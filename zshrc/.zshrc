# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# Load completions
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enforce emacs keybindings
bindkey -e

bindkey '^[[Z' reverse-menu-complete

# Functions
smartnvim() {
  local filepath="$1"
  local dirpath

  # Check if no argument is provided
  if [[ -z "$filepath" ]]; then
    echo "Usage: smartnvim <file-path>"
    return 1
  fi

  # Extract directory part of the filepath
  dirpath=$(dirname "$filepath")

  # Create directories only if they don't exist
  if [[ ! -d "$dirpath" ]]; then
    mkdir -p "$dirpath" || {
      echo "Failed to create directory: $dirpath"
      return 1
    }
  fi

  # Open the file with nvim
  nvim "$filepath"
}


# Aliases
alias vi='nvim'
alias vio='nvim $(fzf -m --preview="bat --color=always {}")'

# Exports
export PATH="$HOME/bin:$PATH"

# zsh-autocomplete
zstyle ":completion:*" menu select

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Setup zoxide
eval "$(zoxide init zsh)"
