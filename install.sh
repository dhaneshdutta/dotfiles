#!/bin/bash

# Define colors
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
BOLD="\033[1m"
RESET="\033[0m"

# Clear the terminal
clear

# Function to ask for user input
ask_user() {
    while true; do
        echo -e -n "${YELLOW}$1 (y/n): ${RESET}"
        read -r yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo -e "${RED}Please answer yes or no.${RESET}";;
        esac
    done
}

# Basic package installation
echo -e "${CYAN}Ensuring essential packages are installed...${RESET}"
if ask_user "Do you want to update the system and install essential packages?"; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm base-devel git curl wget zsh
else
    echo -e "${YELLOW}System update and essential package installation skipped.${RESET}"
fi

# Check and install yay if not installed
if ! command -v yay &> /dev/null; then
    if ask_user "yay is not installed. Do you want to install yay?"; then
        echo -e "${CYAN}Installing yay...${RESET}"
        git clone https://aur.archlinux.org/yay.git /tmp/yay &&
        cd /tmp/yay &&
        makepkg -si --noconfirm
    else
        echo -e "${RED}yay installation skipped. Exiting...${RESET}"
        exit 1
    fi
fi

# Install dependencies
if ask_user "Do you want to install the necessary dependencies?"; then
    echo -e "${CYAN}Installing dependencies...${RESET}"
    yay -S --needed --noconfirm hyprland-git tofi waybar-cava cava cmus btop fastfetch kitty neovim \
        networkmanager thunar swww pywal blueman-git hyprlock-git hyprshot-git \
        pavucontrol nwg-look mpv orchis-theme
else
    echo -e "${YELLOW}Dependency installation skipped.${RESET}"
fi

# Install and enable Ly display manager without starting it
if ask_user "Do you want to install and enable the Ly display manager?"; then
    echo -e "${CYAN}Installing Ly display manager...${RESET}"
    yay -S --needed --noconfirm ly &&
    sudo systemctl enable ly.service
    echo -e "${YELLOW}Ly will start automatically on reboot.${RESET}"
else
    echo -e "${YELLOW}Ly installation and enabling skipped.${RESET}"
fi

# Clone or update the repository
if [ -d "$HOME/.dotfiles" ]; then
    if ask_user "Dotfiles directory already exists. Do you want to pull the latest changes?"; then
        echo -e "${CYAN}Pulling the latest changes...${RESET}"
        cd "$HOME/.dotfiles" && git pull
    else
        echo -e "${YELLOW}Skipping the update. Proceeding with the current dotfiles.${RESET}"
    fi
else
    if ask_user "Do you want to clone the dotfiles repository?"; then
        echo -e "${CYAN}Cloning dotfiles repository...${RESET}"
        git clone "https://github.com/dhaneshdutta/dotiiles" "$HOME/.dotfiles"
    else
        echo -e "${RED}Cloning skipped. Exiting...${RESET}"
        exit 1
    fi
fi

# Copy dotfiles to the home directory
if ask_user "Do you want to copy the dotfiles to your home directory?"; then
    echo -e "${CYAN}Copying dotfiles...${RESET}"
    cp -r "$HOME/.dotfiles/.config/"* ~/.config/
    cp -r "$HOME/.dotfiles/.local/"* ~/.local/
    cp -r "$HOME/.dotfiles/.scripts/"* ~/.scripts/
    cp -r "$HOME/.dotfiles/.zshrc" ~/.zshrc
else
    echo -e "${YELLOW}Dotfile copying skipped.${RESET}"
fi

# Set up Zsh as the default shell
if ask_user "Do you want to set up Zsh as the default shell?"; then
    echo -e "${CYAN}Setting up Zsh as the default shell...${RESET}"
    chsh -s $(which zsh)
else
    echo -e "${YELLOW}Default shell setup skipped.${RESET}"
fi

# Install Oh My Zsh
if ask_user "Do you want to install Oh My Zsh?"; then
    echo -e "${CYAN}Installing Oh My Zsh...${RESET}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo -e "${YELLOW}Oh My Zsh installation skipped.${RESET}"
fi

# Install Powerlevel10k theme
if ask_user "Do you want to install the Powerlevel10k theme?"; then
    echo -e "${CYAN}Installing Powerlevel10k theme...${RESET}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
else
    echo -e "${YELLOW}Powerlevel10k installation skipped.${RESET}"
fi

# Reloading Hyprland
if ask_user "Do you want to reload the Hyprland configuration now?"; then
    echo -e "${CYAN}Reloading Hyprland configuration...${RESET}"
    hyprctl reload
else
    echo -e "${YELLOW}Hyprland configuration reload skipped.${RESET}"
fi

# Configure nwg-look with Orchis theme and dark mode
if ask_user "Do you want to set up Orchis theme and dark mode in nwg-look?"; then
    echo -e "${CYAN}Configuring nwg-look...${RESET}"
    nwg-look --gtk-theme Orchis-Dark --icon-theme Papirus-Dark --font "Inter 11" --apply
else
    echo -e "${YELLOW}nwg-look configuration skipped.${RESET}"
fi

# Offer reboot or manual configuration
echo -e "${BLUE}Installation is complete.${RESET}"
echo -e "${YELLOW}Do you want to reboot now, or would you like to perform some manual configurations before rebooting?${RESET}"
select choice in "Reboot Now" "Manual Configuration"; do
    case $choice in
        "Reboot Now" )
            echo -e "${CYAN}Rebooting the system...${RESET}"
            sudo reboot
            break;;
        "Manual Configuration" )
            echo -e "${CYAN}You can now perform any manual configurations.${RESET}"
            echo -e "${YELLOW}Once you are ready, please reboot the system manually by running 'sudo reboot'.${RESET}"
            break;;
        * )
            echo -e "${RED}Invalid option. Please choose either 'Reboot Now' or 'Manual Configuration'.${RESET}";;
    esac
done

