export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
# aliases
alias vim='nvim'
alias ncdu='sudo ncdu /'
alias bluetooth='blueman-manager'
alias goapps='cd /usr/share/applications'
alias key='vim /home/dhanesh/Documents/.website.txt'
alias config='vim /home/dhanesh/.config/hypr/hyprland.conf'
alias shutdown='shutdown now'
alias sthunar='sudo -E thunar'
alias gowaybar='cd /etc/xdg/waybar'
# plugins
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

