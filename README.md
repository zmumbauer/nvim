# nvim

This repo is a thin personal overlay on top of the work [`neovim-dotfiles`](https://github.com/PayPal-Braintree/neovim-dotfiles) repo.

The goal is to keep the shared Braintree defaults intact, then load only the personal pieces that differ for this setup.

## Repo layout

This repo includes the base work config as a nested git submodule at `vendor/neovim-dotfiles`.

That means the default, self-contained setup for this repo is:

- personal overlay in this repo
- base config in `vendor/neovim-dotfiles`

If `NVIM_BASE_CONFIG` is set, that path takes priority and the vendored base is skipped.

## How bootstrap works

`init.lua` resolves the base config in this order:

1. `NVIM_BASE_CONFIG`
2. `./vendor/neovim-dotfiles`
3. `../neovim-dotfiles`
4. `../../code/neovim-dotfiles`
5. `~/code/neovim-dotfiles`

Once it finds the base repo, it prepends that repo to Neovim's `runtimepath`, extends `package.path` for the base repo's `lua/` modules, and then executes the base repo's `init.lua`.

Personal config lives under `lua/personal/` and is loaded by the base repo's overlay hooks.

Custom fixes should live in `lua/personal/`, not in `vendor/neovim-dotfiles`.

## Clone and update

Because the base config is a nested submodule, clone/update needs to initialize submodules too.

Fresh clone:

```sh
git clone <repo-url> ~/.config/nvim
cd ~/.config/nvim
git submodule update --init --recursive
```

After pulling changes:

```sh
git pull
git submodule update --init --recursive
```

## Copilot setup

Copilot is provided by the base repo, but this overlay adds one important fix: it prefers a dedicated Node 22 binary for `copilot.lua` instead of blindly using whatever `node` is first on `PATH`.

Resolution order for Copilot's Node binary:

1. `NVIM_COPILOT_NODE`
2. newest installed `~/.asdf/installs/nodejs/22.x.y/bin/node`
3. plain `node`

That matters because `copilot.lua` now requires Node 22 or newer. If your shell resolves `node` to an older version, Copilot will fail to start.

### Authenticate

Inside Neovim:

- `:Copilot auth`
- `<Leader>al`

### Chat and prompts

- `<Leader>aa` toggles Copilot Chat
- `<Leader>ap` opens prompt actions
- `<Leader>ae` explains the current visual selection
- `<Leader>ar` reviews the current buffer or selection
- `<Leader>aq` opens a quick freeform prompt

### Fixing `Node.js version 22 or newer required`

Your current error means Neovim is resolving Copilot against an older Node. If you use `asdf`, install a 22.x release and either let the overlay auto-detect it or point Copilot at it explicitly.

Example:

```sh
asdf install nodejs 22.13.0
export NVIM_COPILOT_NODE="$HOME/.asdf/installs/nodejs/22.13.0/bin/node"
```

Then restart Neovim and run:

```vim
:Copilot auth
```

If you prefer to switch your default shell Node instead, update your global `asdf` version to a 22.x release. Project-local `.tool-versions` files can still pin other Node versions where needed.

## Notes

- This overlay caps `lazy.nvim` concurrency to reduce `Too many open files` errors on systems with a low `ulimit -n`.
- If you still hit file descriptor errors during a large `:Lazy sync`, raise your shell limit as well.
