return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    config = function()
        require 'lspconfig.ui.windows'.default_options.border = 'rounded'
        require('neodev').setup()
        local lspconfig = require 'lspconfig'
        local util = lspconfig.util

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        --[[ LUA LSP ]]
        lspconfig.lua_ls.setup {
            cmd = { 'lua-language-server' },
            capabilities = capabilities,
        }

        --[[ RUST LSP ]]
        lspconfig.rust_analyzer.setup {
            cmd = { 'rust-analyzer' },
            capabilities = capabilities,
            root_dir = util.root_pattern('Cargo.toml', 'Cargo.lock', 'rust-project.json')
        }

        --[[ OCAML LSP ]]
        lspconfig.ocamllsp.setup {
            cmd = { 'ocamllsp' },
            capabilities = capabilities,
            root_dir = util.root_pattern('*.opam', 'esy.json', 'package.json', '.git', 'dune-project', 'dune-workspace')
        }

        --[[ GOLANG LSP ]]
        lspconfig.gopls.setup {
            cmd = { 'gopls' },
            capabilities = capabilities,
            root_dir = util.root_pattern('go.work', 'go.mod', '.git')
        }

        --[[ CSHARP LSP ]]
        lspconfig.omnisharp.setup {
            name = 'omnisharp-roslyn',
            cmd = { 'OmniSharp' },
            capabilities = capabilities,
            enable_editorconfig_support = true,
            enable_import_completion = true,
            enable_roslyn_analyzers = true,
            root_dir = util.root_pattern('*.sln', '*.csproj', 'omnisharp.json', 'function.json')
        }

        --[[ TYPESCRIPT LSP ]]
        lspconfig.tsserver.setup {
            cmd = { 'typescript-language-server', '--stdio' },
            capabilities = capabilities,
            root_dir = util.root_pattern('tsconfig.json', 'package.json', 'jsconfig.json', '.git')
        }

        --[[ SVELTE LSP ]]
        lspconfig.svelte.setup {
            cmd = { 'svelteserver', '--stdio' },
            capabilities = capabilities,
            root_dir = util.root_pattern('package.json', '.git')
        }

        --[[ ANGULAR LSP ]]
        lspconfig.angularls.setup {
            cmd = { 'ngserver',
                '--stdio',
                '--tsProbeLocations',
                '/usr/local/lib/node_modules/typescript/lib',
                '--ngProbeLocations',
                '/usr/local/lib/node_modules/@angular/language-server/bin' },
            capabilities = capabilities,
            filetypes = { 'ts', 'typescript', 'html' }
        }
    end,
    dependencies = { 'folke/neodev.nvim', cmd = 'Neoconf' },
}
