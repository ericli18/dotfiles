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
      c = {
        exec = 'gcc',
        args = { '-O2', '-g', '-fno-omit-frame-pointer', '-Wall', '$(FNAME)', '-o', 'main' },
      },
      cpp = {
        exec = 'g++',
        args = { '-O2', '-g', '-fno-omit-frame-pointer', '-Wall', '$(FNAME)', '-o', 'main', '-DLOCAL' },
      },
      rust = { exec = 'rustc', args = { '-g', '$(FNAME)' } },
      java = { exec = 'javac', args = { '$(FNAME)' } },
      haskell = { exec = 'ghc', args = { '$(FNAME)' } },
    },
    run_command = {
      c = { exec = './main' },
      cpp = { exec = './main' },
    },
  },
}
