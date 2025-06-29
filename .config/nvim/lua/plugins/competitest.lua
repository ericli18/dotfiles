return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  cmd = {
    'CompetiTest',
  },
  opts = {
    -- testcases_directory = "./.tests",
    testcases_use_single_file = true,
    compile_command = {
      c = { exec = 'gcc', args = { '-Wall', '$(FNAME)', '-o', '$(FNOEXT)' } },
      cpp = { exec = 'g++', args = { '-DLOCAL', '-Wall', '$(FNAME)', '-o', '$(FNOEXT)' } },
      rust = { exec = 'rustc', args = { '$(FNAME)' } },
      java = { exec = 'javac', args = { '$(FNAME)' } },
      haskell = { exec = 'ghc', args = { '$(FNAME)' } },
    },
  },
}
