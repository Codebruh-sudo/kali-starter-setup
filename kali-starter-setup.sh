#!/bin/bash

# Colors for output
GREEN="\e[32m"
NC="\e[0m"

echo -e "${GREEN}Kali/Parrot Starter Setup Script${NC}"
echo "Setting up your hacking environment..."

# 1. Update & Upgrade the system
echo -e "${GREEN}[1] Updating system...${NC}"
sudo apt update && sudo apt upgrade -y

# 2. Install essential tools
echo -e "${GREEN}[2] Installing essential tools...${NC}"
sudo apt install -y git curl wget zsh neofetch ffuf gobuster seclists

# 3. Install Rust & RustScan
echo -e "${GREEN}[3] Installing Rust & RustScan...${NC}"
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
cargo install rustscan

# 4. Create a hacker workspace
echo -e "${GREEN}[4] Creating hacker folders...${NC}"
mkdir -p ~/recon ~/scripts ~/reports ~/wordlists

# 5. Clone SecLists
echo -e "${GREEN}[5] Cloning SecLists...${NC}"
git clone https://github.com/danielmiessler/SecLists ~/wordlists/SecLists

# 6. Install Oh My Zsh
echo -e "${GREEN}[6] Installing Oh My Zsh...${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 7. Optional: Set Zsh as default shell
echo -e "${GREEN}[7] Making Zsh your default shell...${NC}"
chsh -s $(which zsh)

# 8. Add some helpful aliases
echo -e "${GREEN}[8] Adding aliases to .zshrc...${NC}"
echo "alias recon='cd ~/recon'" >> ~/.zshrc
echo "alias up='sudo apt update && sudo apt upgrade -y'" >> ~/.zshrc
echo "alias ports='netstat -tuln'" >> ~/.zshrc

# 9. Final touch
echo -e "${GREEN}[9] Showing system info...${NC}"
neofetch

echo -e "${GREEN}Setup complete! Restart your terminal and hack away.${NC}"
