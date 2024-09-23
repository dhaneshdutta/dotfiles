pokeget --hide-name random
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# pywal
cat ~/.cache/wal/sequences
wallset() {
  wal -a "0" -n -1 "&@"
  feh --bg-fill "$(< "${HOME}/.cache/wal/wal")"
}

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
# aliases
alias vi='nvim'
alias vim='nvim'
alias svim='sudo -E nvim'
alias ncdu='sudo ncdu /'
alias bluetooth='blueman-manager'
alias goapps='/home/dhanesh/.config/hypr/scripts/move.sh'
alias batt='inxi -B'
alias key='vim /home/dhanesh/Documents/Misc/.website.txt'
alias wifi='vim /home/dhanesh/Documents/College/Misc/wifi'
alias config='vim /home/dhanesh/.config/hypr/hyprland.conf'
alias shutdown='shutdown now'
alias sthunar='sudo -E thunar'
alias help='cat /home/dhanesh/Documents/Misc/.cli-help'
alias gowaybar='cd /home/dhanesh/.config/waybar'
alias fetch='fastfetch'
alias cwifi='cat /home/dhanesh/Documents/College/Misc/wifi'
alias ls='lsd'
alias chalu='sudo systemctl start ollama'
alias band='sudo systemctl stop ollama'
alias tota-udd='ollama run tota'
alias aft='android-file-transfer'

# plugins
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

