if status is-interactive
    # PATH
    export NVM_DIR="$HOME/.nvm"
    set PATH $HOME/.meteor $PATH
    set -gx GPG_TTY (tty)
    export CARGO_PATH="$HOME/.cargo/bin"
    export GO_PATH="$HOME/go/bin"
    export WEZTERM_PATH="/Applications/WezTerm.app/Contents/MacOS"
    export VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    export PATH="$CARGO_PATH:$PNPM_HOME:$NVM_DIR:$GO_PATH:$WEZTERM_PATH:$VSCODE_PATH:$PATH"

    # git commands aliases
    alias gaa="git add -A"
    alias gaap="git add -A -p"
    alias gce="git checkout"
    alias gcm="git commit"
    alias gpp="git push"
    alias gpl="git pull"
    alias gss="git status"
    alias gll="git log"
    alias gllo="git log --oneline"
    alias gbb="git branch | cat"

    # bin aliases
    alias ls="exa"
    alias cat="bat"
    alias find="fd"
    alias ps="procs"
    alias copy="pbcopy <"
    alias vim="nvim"
    alias v="nvim ."

    # directories aliases
    alias home="cd ~"
    alias de="cd ~/Desktop"
    alias pro="cd ~/Projects"

    # config files
    alias nvimrc="vim ~/.config/nvim/init.lua"
    alias fishrc="vim ~/.config/fish/config.fish"
    alias weztermrc="vim ~/.config/wezterm/wezterm.lua"

    # some utils
    alias noswap="rm ~/.local/state/nvim/swap/*"

    # some crazy utils
    alias work="timer 25m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

    alias rest="timer 5m && terminal-notifier -message 'Pomodoro'\
            -title 'Break is over! Get back to work 😬'\
            -appIcon '~/Pictures/pumpkin.png'\
            -sound Crystal"
end


# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
