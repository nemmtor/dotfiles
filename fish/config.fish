if status is-interactive
    # PATHS
    set -lx PATH_DIRECTORIES \
        $HOME/.config/tmuxifier/bin \
        $HOME/.nvm \
        $HOME/vcpkg \
        $HOME/.cargo/bin \
        $HOME/go/bin \
        /Applications/WezTerm.app/Contents/MacOS \
        /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin \
        $HOME/.bun/bin

    set -x PATH $PATH_DIRECTORIES $PATH

    set -gx GPG_TTY (tty)

    set -gx EDITOR nvim

    # git
    alias gaa="git add -A"
    alias gaap="git add -A -p"
    alias gce="git checkout"
    alias gcm="git commit"
    alias gpp="git push"
    alias gpl="git pull"
    alias gss="git status"
    alias gll="git log"
    alias gllo="git log --oneline"
    alias gbb="git branch"
    alias lg="lazygit"
    alias ld="lazydocker"
    source ~/.config/fish/functions/git-things.fish

    # bin
    alias ls="exa"
    alias cat="bat"
    alias find="fd"
    alias copy="pbcopy <"
    alias v="nvim"
    alias vim="nvim"
    alias python="python3"

    # directories
    alias pro="cd ~/Projects"

    # config files
    alias nvimrc="vim ~/.config/nvim"
    alias fishrc="vim ~/.config/fish/config.fish"
    alias weztermrc="vim ~/.config/wezterm/wezterm.lua"

    # utils
    alias work="timer 25m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -sound Crystal"

    alias rest="timer 5m && terminal-notifier -message 'Pomodoro'\
        -title 'Break is over! Get back to work 😬'\
        -sound Crystal"
end

fish_vi_key_bindings

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

eval (tmuxifier init - fish)

if type -q tmux; and status is-interactive; and not string match -qr 'screen|tmux' -- "$TERM"; and test -z "$TMUX"
    tmux
end
