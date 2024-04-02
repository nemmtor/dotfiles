if status is-interactive
    # PATHS
    export TMUXIFIER_PATH="$HOME/.config/tmuxifier/bin"
    export NVM_PATH="$HOME/.nvm"
    export VCPKG_ROOT="$HOME/vcpkg"
    export METEOR_PATH="$HOME/.meteor"
    export CARGO_PATH="$HOME/.cargo/bin"
    export GO_PATH="$HOME/go/bin"
    export WEZTERM_PATH="/Applications/WezTerm.app/Contents/MacOS"
    export VSCODE_PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"
    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export ANDROID_EMULATOR="$ANDROID_HOME/emulator"
    export ANDROID_PLATFORM="$ANDROID_HOME/platform-tools"
    export ANDROID_SDK_BIN="$ANDROID_HOME/cmdline-tools/10.0/bin"
    export RBENV_SHIMS="$HOME/.rbenv/shims"
    export JAVA_HOME=$(/usr/libexec/java_home)
    set -x PATH $JAVA_HOME:$TMUXIFIER_PATH:$NVM_PATH:$METEOR_PATH:$CARGO_PATH:$GO_PATH:$WEZTERM_PATH:$VSCODE_PATH:$JAVA_HOME:$ANDROID_EMULATOR:$ANDROID_PLATFORM:$ANDROID_SDK_BIN:$RBENV_SHIMS:$PATH

    # GPG TTY
    set -gx GPG_TTY (tty)

    set -gx EDITOR nvim

    alias golive="live-server --port=8050|lt --port=8050"

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
    alias gbb="git branch"

    # bin aliases
    alias ls="exa"
    alias cat="bat"
    alias find="fd"
    alias copy="pbcopy <"
    alias oldv="NVIM_APPNAME=nvim-old nvim"
    alias oldvim="NVIM_APPNAME=nvim-old nvim"
    alias v="nvim"
    alias vim="nvim"
    alias python="python3"

    # directories aliases
    alias home="cd ~"
    alias de="cd ~/Desktop"
    alias pro="cd ~/Projects"
    alias configs="cd ~/.config"
    alias mybrain="cd ~/my-brain"


    # config files
    alias nvimrc="vim ~/.config/nvim"
    alias nvimkickrc="vim ~/.config/nvim-kickstart"
    alias fishrc="vim ~/.config/fish/config.fish"
    alias weztermrc="vim ~/.config/wezterm/wezterm.lua"

    # utils
    alias work="timer 25m && terminal-notifier -message 'Pomodoro'\
        -title 'Work Timer is up! Take a Break 😊'\
        -appIcon '~/Pictures/pumpkin.png'\
        -sound Crystal"

    alias rest="timer 5m && terminal-notifier -message 'Pomodoro'\
            -title 'Break is over! Get back to work 😬'\
            -appIcon '~/Pictures/pumpkin.png'\
            -sound Crystal"
    
    alias dstore="fd -H -t f .DS_Store | xargs -I {} rm {}"
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# source ~/.config/fish/functions/foo.fish
eval (tmuxifier init - fish)
