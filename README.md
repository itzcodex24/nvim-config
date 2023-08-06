# My Neovim Config

## Theme 🎨

- Using [catppuccin](https://github.com/catppuccin/nvim) <b>Mocha</b> as my primary theme

## Plugin Manager 🤖

- Using [packer](https://github.com/wbthomason/packer.nvim) as my plugin manager.
- The main configuration file is located [here](lua/codex/plugins-setup.lua)

## Wanna use my config? 🔗

- Firstly, I would suggest creating a backup of your current neovim config.

```sh
    mv ~/.config/nvim/ ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    mv ~/.local/state/nvim ~/.local/state/nvim.bak
    mv ~/.cache/nvim ~/.cache/nvim.bak
```

- This command will essentially remove your current neovim setup for the time being.

- Now, clone into this repository after creating a new `~/.config/nvim` directory

```sh
    mkdir ~/.config/nvim
```

```sh
    git clone https://github.com/itzcodex24/nvim-config ~/.config/nvim
```

- Open the `plugins-setup.lua` file located under `lua/codex`.
- Save the file and let packer install all of the plugins.

### You're done!

- Simply lauch neovim and enjoy ;)
