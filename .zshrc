# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
# aliases
alias vim='nvim'
alias ncdu='sudo ncdu /'
alias goapps='cd /usr/share/applications'
alias config='vim /home/$USER/.config/hypr/hyprland.conf'
alias shutdown='shutdown now'
alias sthunar='sudo -E thunar'
alias fetch='fastfetch'
alias ls='eza --icons'
alias aft='android-file-transfer'

# plugins
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pywal
cat ~/.cache/wal/sequences
wallset() {
  wal -a "0" -n -1 "&@"
  feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"
}

