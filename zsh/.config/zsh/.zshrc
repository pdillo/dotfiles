# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep

#Alias 
alias p="sudo pacman"
alias vim="nvim"
alias v="nvim"
alias grep="grep --color=auto"
alias curtis="ssh -i ~/Documents/curtis/aws_wilburcurtis_keypair.pem ubuntu@ec2-13-52-245-25.us-west-1.compute.amazonaws.com" 
alias scpcurtis='scp -i ~/Documents/curtis/aws_wilburcurtis_keypair.pem "$1" ubuntu@ec2-13-52-245-25.us-west-1.compute.amazonaws.com:~/'
alias curtisstaging="ssh -i ~/Documents/curtis/aws_wilburcurtis_keypair.pem ubuntu@ec2-52-53-235-242.us-west-1.compute.amazonaws.com" 
alias r="ranger"
alias setbg="xwallpaper --zoom $HOME/Pictures/Wallpapers/$WAL"
alias weather="clear; curl -i wttr.in"
alias theme="nwg-look"
alias h="sudo nvim /etc/hosts"
alias vh="sudo nvim /etc/nginx/nginx.conf"
alias s="cd /usr/share/nginx/"
alias t="cd wp-content/themes/"
alias m="cd /usr/share/nginx/miratechcorp.com/wp-content/themes/MIRATECH"
alias scrot='scrot && mv *_scrot.png ~/Documents/scrots/'

# Clears all jobs and unpauses the printer
alias fixprint='cancel -a && cupsenable $(lpstat -p | awk "{print \$2}")'

alias pdillo='ssh pdillo'
alias phillipdillon='ssh phillipdillon'

# Mail shortcuts
alias mbsync="mbsync -c ~/.config/isync/mbsyncrc"alias mbsync="mbsync -c ~/.config/isync/mbsyncrc"

# --- GNU Guix Aliases ---
# Package Management
alias gx="guix"
alias gxi="guix install"
alias gxu="guix upgrade"
alias gxr="guix remove"
alias gxs="guix search"
alias gxprb="guix package --roll-back" # Your "Undo" button

# Development Environments (Ephemeral Shells)
alias gsnode="guix shell node nss-certs" # Node environment with SSL certs
alias gspy="guix shell python python-pip nss-certs" # Python with pip and SSL
alias gsh="guix shell" # General purpose shell
alias gsm="guix shell --manifest=manifest.scm" # Run project bill-of-materials

# High-Security / Anti-Container Aliases
# --container isolates the app from your home dir
# --network allows internet access for npm/pip
alias gsc="guix shell --container --network --manifest=manifest.scm"

# The Starlink Monitor
alias st="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python"

# The Quick Sync (To push your ricing changes to the cloud)
alias dotsync="cd ~/Documents/dotfiles && git add . && git commit -m 'update rice' && git push"

#xwallpaper --zoom $HOME/Pictures/Wallpapers/$WAL
#vi mode
bindkey -v
export KEYTIMEOUT=1

zstyle :compinstall filename '$HOME/.config/.zshrc'

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options=(globdots)

#bindkey '^R' 'ranger\n'
bindkey -s '^r' '^uranger\n'

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char 
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Set the GPG TTY so pinentry knows where to spawn
export GPG_TTY=$(tty)

# Refresh the gpg-agent to recognize this new terminal
gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Clean up old agents and start fresh
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)" > /dev/null
   ssh-add ~/.ssh/git_id 2>/dev/null
   ssh-add ~/.ssh/pdillo_id 2>/dev/null
fi

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null

# Powerlevel10k theme
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
#[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# Initialize the prompt system

autoload -U promptinit; promptinit
prompt pure
