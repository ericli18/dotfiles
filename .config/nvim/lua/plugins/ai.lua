return {
  {
    'milanglacier/minuet-ai.nvim',
    event = 'InsertEnter',
    cmd = 'Minuet',
    opts = {
      provider = 'codestral',
      blink = {
        enable_auto_complete = false,
      },
      request_timeout = 3,
      throttle = 1000,
      debounce = 400,
      provider_options = {
        codestral = {
          api_key = 'CODESTRAL_API_KEY',
          optional = {
            max_tokens = 256,
            stop = { '\n\n' },
          },
        },
      },
    },
  },
}
