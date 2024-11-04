#!/bin/bash

# Variables
hostname="dm-mac"

# Install applications with Homebrew
# Ensure Homebrew is installed first
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Set hostname
sudo hostnamectl set-hostname "$hostname"
sudo scutil --set ComputerName "$hostname"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$hostname"

# Run activation scripts
# Note: The path below may not directly translate to a shell command and might need adjustment.
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# Example settings (you'll need to expand this for all settings)
# Menu Extra Clock
defaults write com.apple.menuextra.clock Show24Hour -bool true

# Dock settings
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tr-corner -int 13
defaults write com.apple.dock wvous-bl-corner -int 3
defaults write com.apple.dock wvous-br-corner -int 4

# Finder settings
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Trackpad settings
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.trackpadRightClick -bool true
defaults write NSGlobalDomain com.apple.mouse.trackpadThreeFingerDrag -bool true

# Global macOS settings
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain com.apple.sound.beep.feedback -int 0
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool true
defaults write NSGlobalDomain _HIHideMenuBar -bool false
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 3
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Custom user preferences
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults write com.apple.screencapture location -string "~/Desktop"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
defaults write com.apple.ImageCapture disableHotPlug -bool true

# Login window settings
defaults write com.apple.loginwindow GuestEnabled -bool false
defaults write com.apple.loginwindow SHOWFULLNAME -bool true

# Keyboard settings
defaults write NSGlobalDomain com.apple.keyboard.enableKeyMapping -bool true
defaults write NSGlobalDomain com.apple.keyboard.remapCapsLockToControl -bool false
defaults write NSGlobalDomain com.apple.keyboard.remapCapsLockToEscape -bool false
defaults write NSGlobalDomain com.apple.keyboard.swapLeftCommandAndLeftAlt -bool false

# Enable TouchID for sudo authentication
sudo defaults write /etc/pam.d/sudo pam_enable_sudo_touchid_auth -bool true

# Create /etc/zshrc for Nix-Darwin environment with zsh
echo 'source /etc/profile' > /etc/zshrc

# Install fonts (example using Homebrew, adjust as needed)
brew tap homebrew/cask-fonts
brew install --cask font-material-design-icons
brew install --cask font-fontawesome
brew install --cask font-jetbrainsmono

# Note: Installing nerd fonts might require a different approach depending on your setup.

# Enable Homebrew taps
brew tap homebrew/services
brew tap FelixKratz/formulae  # sketchybar tap

# Install regular brews
brew install sketchybar mas

# Install casks
# List of applications to install
applications=(
    "1password"
    "anki"
    "discord"
    "firefox"
    "flameshot"
    "font-hack-nerd-font"
    "google-chrome"
    "insomnia"
    "keycastr"
    "macfuse"
    "microsoft-teams"
    "obs"
    "obsidian"
    "openinterminal-lite"
    "orbstack"
    "raycast"
    "sf-symbols"
    "spotify"
    "visual-studio-code"
    "vlc"
    "wireshark"
    "zoom"
)

# Install applications
for app in "${applications[@]}"; do
    # Check if application is installed
    if ! brew list --cask "$app" &>/dev/null; then
        echo "Installing $app..."
        brew install --cask "$app"
    else
        echo "$app is already installed. Skipping..."
    fi
done

# Install Mac App Store apps using mas-cli (manually installed first)
mas install 1475387142  # Tailscale
mas install 803453959   # Slack
mas install 747648890   # Telegram
mas install 1497506650  # Yubico Authenticator

# Optional: Additional Homebrew cask installations
# brew install --cask background-music

# List of packages to install via Homebrew
brew_packages=(
    caddy
    cowsay
    file
    fzf
    gawk
    gh
    glow
    gnu-sed
    gnu-tar
    gnupg
    jq
    mikefarah/yq/yq
    nmap
    nnn
    p7zip
    ripgrep
    socat
    tree
    unzip
    which
    xz
    zip
    zstd
)

# Install packages using Homebrew
for pkg in "${brew_packages[@]}"; do
    brew install "$pkg"
done

# Configure programs
# Zsh
brew install zsh
# Configure Oh-My-Zsh and plugins
# Adjust plugins and custom settings as needed
echo 'plugins=(git)' >> ~/.zshrc
echo 'ZSH_CUSTOM="$HOME/.config/zsh_nix/custom"' >> ~/.zshrc
echo 'source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
echo 'source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

# Neovim
brew install neovim
# Configure Neovim and plugins
echo 'set number' >> ~/.config/nvim/init.vim
echo 'highlight Comment cterm=italic gui=italic' >> ~/.config/nvim/init.vim
echo 'nmap <F6> :NERDTreeToggle<CR>' >> ~/.config/nvim/init.vim

# Eza
brew install eza
# Configure Eza
echo 'source /opt/homebrew/share/eza/init.sh' >> ~/.zshrc

# Skim
brew install skim
# Configure Skim
echo 'export SKIM_DEFAULT_COMMAND="sk --ansi"' >> ~/.zshrc

echo "Installation completed."