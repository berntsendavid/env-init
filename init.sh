# Ask for the administrator password upfront.
sudo -v

##########################
### Get info from user ###
##########################
computer_name=' '
user_name=' '
user_email=' '

echo -n "What would you like your computer to be known as on the network? ex:Joe's Macbook  "
read computer_name

echo -n 'What is your name? (This is just for git)  '
read user_name

echo -n 'What is your email address? (Again, just for git)  '
read user_email

#########################
### Install XCode CLI ###
#########################

if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    print_result $? 'Install XCode Command Line Tools'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
    print_result $? 'Make "xcode-select" developer directory point to Xcode'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    print_result $? 'Agree with the XCode Command Line Tools licence'

fi



#######################################
### Change ownership of /usr/local/ ###
#######################################

echo '*** gaining ownership of /usr/local/ ***'
sudo chmod a+w /usr/local/



##############################
### Software Installations ###
##############################

echo '*** install homebrew ***'
ruby -e "$(curl -#fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

echo '*** install brew cask ***'
brew install caskroom/cask/brew-cask

echo '*** install python3 ***'
brew install python3

echo '*** change default cask install location to ~/Applications ***'
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#echo '*** install atom ***'
#brew cask install atom

#echo '*** install cyberduck ***'
#brew cask install cyberduck

echo '*** install google chrome ***'
brew cask install google-chrome

#echo '*** install transmission ***'
#brew cask install transmission

echo '*** iterm2 ***'
brew cask install iterm2

echo '*** install keepingyouawake ***'
brew cask install keepingyouawake

#echo '*** install sequel-pro ***'
#brew cask install sequel-pro

echo '*** install skype ***'
brew cask install skype

#echo '*** install steam ***'
#brew cask install steam

#echo '*** install flux ***'
#brew cask install flux

echo '*** install spotify ***'
brew cask install spotify

echo '*** install telegram ***'
brew cask install telegram

echo '*** install the-unarchiver ***'
brew cask install the-unarchiver

#echo '*** install tunnelblick ***'
#brew cask install tunnelblick

#echo '*** install vagrant ***'
#brew cask install vagrant

#echo '*** install virtualbox ***'
#brew cask install virtualbox

#echo '*** install vlc ***'
#brew cask install vlc

echo '*** cleaning up cask installs ***'
brew cask cleanup

echo '*** install quick-look plugins ***'
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook

echo '*** install nvm ***'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash


#########################
### Computer Settings ###
#########################

# Set computer name
echo '*** set computer name ***'
sudo scutil --set ComputerName $computer_name
sudo scutil --set HostName $computer_name
sudo scutil --set LocalHostName $computer_name
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $computer_name

# Show the ~/Library folder
echo '*** show the ~/Library folder ***'
chflags nohidden ~/Library

# Speed up Mission Control animations
echo '*** speed up mission control animations ***'
defaults write com.apple.dock expose-animation-duration -float 0.2

# Prevent Time Machine from prompting to use new hard drives as backup volume
echo '*** stop time machine from asking about new drives ***'
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable Dashboard
echo '*** disable dashboard ***'
defaults write com.apple.dashboard mcx-disabled -bool true

# Make Dock icons of hidden applications translucent
echo '*** make hidden app icons translucent ***'
defaults write com.apple.dock showhidden -bool true

# Disable the Launchpad gesture (pinch with thumb and three fingers)
#echo '*** disable launchpad gesture ***'
#defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Disable prompt when quitting iterm2
echo '*** Disable prompt when quitting iterm2 ***'
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Don’t automatically rearrange Spaces based on most recent use
echo '*** stop automatically rearranging spaces based on time ***'
defaults write com.apple.dock mru-spaces -bool false

# quit printer app when there are no pending jobs
echo '*** quit printer app when there are no pending jobs ***'
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# check for updates daily
echo '*** check for Apple updates daily ***'
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# disable smart quotes, auto-correct spelling, and smart dashes
echo '*** disable smart quotes, auto-correct spelling, and smart dashes ***'
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# prevent Photos from opening when inserting external media
echo '*** prevent photos from opening when instering drives ***'
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# sets clock to 24-hour mode
echo '*** set clock to 24-hour mode ***'
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# disable warning when changing file extension
echo '*** disable warning when changing file extension ***'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# disable .DS_Store on network drives
echo '*** prevent creation of .DS_Store on network drives ***'
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# show battery percentage
echo '*** show battery percentage ***'
defaults write com.apple.menuextra.battery ShowPercent -string "NO"

# set tap-to-click
echo '*** enable tap-to-click ***'
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# change crash reporter to notification
echo '*** change crash reporter to notification ***'
defaults write com.apple.CrashReporter UseUNC 1

# create global .gitignore
# echo '*** create global .gitignore ***'
# curl -# https://raw.githubusercontent.com/fouxarn/env-init/master/assets/gitignore.txt > ~/.gitignore

# set git user info and credentials
echo '*** set git user info and credentials ***'
git config --global user.name $user_name
git config --global user.email $user_email
git config --global credential.helper osxkeychain

# update PATH
# echo '*** update path ***'
# echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

# Disable local Time Machine snapshots
echo '*** disable local time machine snapshots ***'
sudo tmutil disablelocal



#############################
### Transmission Settings ###
#############################

# hide donate message
echo '*** hide transmission donate message ***'
defaults write org.m0k.transmission WarningDonate -bool false

# hide legal warning
echo '*** hide transmission legal warning ***'
defaults write org.m0k.transmission WarningLegal -bool false

# auto resize window
echo '*** auto resize transmission window ***'
defaults write org.m0k.transmission AutoSize -bool true


#############################
### Atom Text Settings ###
#############################

# set atom as default text editor in git
# echo '*** set atom as default test editor in git ***'
# git config --global core.editor "atom"

# set atom as default text editor os-wide
# echo '*** set atom as default text editor os-wide ***'
# defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add \
# '{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.github.atom;}'


#############################
### Atom Packages ###
#############################
# echo '*** installing atom package-sync ***'
# apm install package-sync
# echo '*** symlinking atom packages.cson ***'
# ln -s assets/packages.cson ~/.atom/packages.cson
# echo '*** run package-sync:sync in atom to sync packages ***'

#######################
### install ohmyzsh ###
#######################

echo '*** install ohmyzsh ***'
sh -c "$(curl -#fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

######################
### setup dotfiles ###
######################

./setup_dotfiles.sh

######################################
######################################

cp ./colorschemes/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-themes
cp ./colorschemes/wombat256mod.vim ~/.vim/colors/dracula.vim
