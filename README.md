Instructions:

1. Make a backup of your .config dir and nvim cache:

```bash
cp -R ~/.config ~/.config.bak
```

```bash
cp -R ~/.local/share/nvim ~/.local/share/nvim.bak
cp -R ~/.local/state/nvim ~/.local/state/nvim.bak
cp -R ~/.cache/nvim ~/.cache/nvim.bak
```

2. Clone this repo and use it as your .config dir - probably you need to clone it to some other dir and manually copy paste inside .config so you don't lose your current stuff.

3. Install [Tmuxifier](https://github.com/jimeh/tmuxifier) place it in ~/.config/tmuxifier

```bash
git clone git@github.com:jimeh/tmuxifier.git ~/.config/tmuxifier
```

4. Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

5. Setup Github Copilot by running command in nvim:

```bash
:Copilot setup
```

## Github copilot

Github copilot is disabled for all filetypes other than some defaults, if you want to enable copilot for other filetypes go to [copilot config](./nvim/lua/config/plugins/copilot.lua)
