return { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }
      local hipatterns = require 'mini.hipatterns'
      hipatterns.setup {
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup {
        mappings = {
          add = 'gsa',
          delete = 'gsd',
          find = 'gsf',
          find_left = 'gsF',
          replace = 'gsr',
        },
      }

      require('mini.files').setup {
        mappings = {
          show_help = '?',
          go_in_plus = '<cr>',
          go_out_plus = '<tab>',
          synchronize = 's',
        },
        windows = {
          width_nofocus = 25,
        },
        options = {
          permanent_delete = false,
          use_as_default_explorer = false,
        },
      }

      local statusline = require 'mini.statusline'

      --local function section_short_mode(opts)
      local function section_short_mode(opts)
        local mode_str, hl = statusline.section_mode(opts)
        local mode_kirby = {
          Normal = '<(•ᴗ•)>',
          Insert = '<(•o•)>',
          Visual = '(v•-•)v',
          ['V-Block'] = '(v•-•)>',
          ['V-Line'] = '(>•-•)>',
          Command = '(^•o•)^',
          Select = '(v*-*)v',
          ['S-Block'] = '(v*-*)>',
          ['S-Line'] = '(>*-*)>',
          Replace = '(∩*o*∩)',
          Terminal = '(っ^‿^)っ',
        }

        if type(mode_str) == 'string' and #mode_str > 0 then
          -- mode_str = mode_kirby[mode_str] .. mode_str:sub(1, 1)
          mode_str = mode_kirby[mode_str]
          -- mode_str = mode_str
          -- mode_str = mode_str:sub(1, 1):upper()
        end
        return mode_str, hl
      end

      statusline.setup {
        use_icons = vim.g.have_nerd_font,
        content = {
          active = function()
            local mode_char, mode_hl = section_short_mode { trunc_width = 0 }
            local git = statusline.section_git { trunc_width = 40 }
            local filename = statusline.section_filename { trunc_width = 140 }
            local diagnostics = statusline.section_diagnostics { trunc_width = 75 }

            return statusline.combine_groups {
              { hl = mode_hl, strings = { mode_char } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              {
                hl = 'MiniStatuslineFileinfo',
                strings = {
                  vim.bo.filetype ~= '' and require('mini.icons').get('filetype', vim.bo.filetype) .. ' ' .. vim.bo.filetype,
                },
              },
              { hl = mode_hl, strings = { '%l:%v' } },
            }
          end,
        },
      } -- ← this closes the outer table

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  }
