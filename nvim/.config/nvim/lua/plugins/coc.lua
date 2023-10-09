return {
  { 'rescript-lang/vim-rescript' },
  {
    'neoclide/coc.nvim',
    branch = "release",
    config = function()
      vim.opt.backup              = false
      vim.opt.writebackup         = false
      vim.opt.updatetime          = 300
      vim.opt.signcolumn          = "yes"

      vim.g.coc_global_extensions = {
        '@yaegassy/coc-tailwindcss3',
        '@yaegassy/coc-volar',
        'coc-css',
        'coc-docker',
        'coc-emmet',
        'coc-flutter',
        'coc-json',
        'coc-prettier',
        'coc-stylua',
        'coc-sumneko-lua',
        'coc-tsserver',
        'coc-rust-analyzer',
      }

      function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      -- Completion
      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
      vim.keymap.set("i", "<TAB>",
        'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
      vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
      vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
        opts)
      vim.keymap.set("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

      -- Diagnostics
      vim.keymap.set("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true })
      vim.keymap.set("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true })

      -- GoTo code navigation
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })


      -- Use K to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end

      vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })


      -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
      vim.api.nvim_create_augroup("CocGroup", {})
      vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold"
      })


      -- Symbol renaming
      vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

      -- Formatting selected code
      vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
      vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

      -- Setup formatexpr specified filetype(s)
      vim.api.nvim_create_autocmd("FileType", {
        group = "CocGroup",
        pattern = "typescript,json",
        command = "setl formatexpr=CocAction('formatSelected')",
        desc = "Setup formatexpr specified filetype(s)."
      })

      -- Update signature help on jump placeholder
      vim.api.nvim_create_autocmd("User", {
        group = "CocGroup",
        pattern = "CocJumpPlaceholder",
        command = "call CocActionAsync('showSignatureHelp')",
        desc = "Update signature help on jump placeholder"
      })

      -- Code actions
      vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
      vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)

      -- Refactoring
      vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
      vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
      vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

      -- Run the Code Lens actions on the current line
      vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

      -- Remap <C-f> and <C-b> to scroll float windows/popups
      opts = { silent = true, nowait = true, expr = true }
      vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
      vim.keymap.set("i", "<C-f>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
      vim.keymap.set("i", "<C-b>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
      vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
      vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

      -- Add `:Format` command to format current buffer
      vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

      -- Add `:OR` command for organize imports of the current buffer
      vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
    end
  }
}
