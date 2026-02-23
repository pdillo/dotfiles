# Default Programs
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export MAIL="thunderbird"
export FILE="ranger"
export FILEGUI="nemo"
export WAL="black_2026.png"

#Env Vars
export RANGER_LOAD_DEFAULT_RC=false
export ZDOTDIR="$HOME/.config/zsh"
export XDG_DESKTOP_DIR="$HOME"
export GTK2_RC_FILES=$HOME/.config/gtk-2.0/gtkrc-2.0
export GTK_THEME="Materia-dark:dark"

#Add .local/bin to $PATH
export PATH="$HOME/.local/bin:$PATH"

# --- GNU Guix Setup ---
# 1. Prioritize the latest 'guix' binary from 'guix pull'
export PATH="$HOME/.config/guix/current/bin:$PATH"

export PATH="$HOME/Documents/dotfiles/scripts:$PATH"

# 2. Define and source the default user profile
export GUIX_PROFILE="$HOME/.guix-profile"
if [ -f "$GUIX_PROFILE/etc/profile" ]; then
  source "$GUIX_PROFILE/etc/profile"
fi

# 3. SSL/Certs (Crucial for Web Dev: git, npm, curl, etc.)
# Note: You must run 'guix install nss-certs' for these paths to exist
export SSL_CERT_DIR="$GUIX_PROFILE/etc/ssl/certs"
export SSL_CERT_FILE="$GUIX_PROFILE/etc/ssl/certs/ca-certificates.crt"
export GIT_SSL_CAINFO="$SSL_CERT_FILE"
export GUIX_LOCPATH="$GUIX_PROFILE/lib/locale"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
