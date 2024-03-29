return {
  { 'folke/which-key.nvim',  opts = {} },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
  -- Git related plugins
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth' },
  -- Matching closing characters
  -- { 'Raimondi/delimitMate' },
  { 'jiangmiao/auto-pairs' },
  {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "startup".setup()
    end
  },
  { 'mg979/vim-visual-multi' }
}
