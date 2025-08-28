#!/bin/bash

# Reset and color definitions
RESET_COLOR='\033[0m'
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
BLUE='\033[1;34m'
BOLD='\033[1m'

# Define the Brave cookies directories to back up
COOKIE_PATHS=(
    "$HOME/.config/BraveSoftware/Brave-Browser/Default/Cookies"
    "$HOME/.config/BraveSoftware/Brave-Browser/Default/Cookies-journal"
    "$HOME/.config/BraveSoftware/Brave-Browser/Profile 1/Cookies"
    "$HOME/.config/BraveSoftware/Brave-Browser/Profile 1/Cookies-journal"
    "$HOME/.config/BraveSoftware/Brave-Browser/Profile 1/Extension Cookies"
    "$HOME/.config/BraveSoftware/Brave-Browser/Profile 1/Extension Cookies-journal"
    "$HOME/.config/BraveSoftware/Brave-Browser/Profile 3/Cookies"
    "$HOME/.config/BraveSoftware/Brave-Browser/Profile 3/Cookies-journal"
)

# Define the backup directory
BACKUP_DIR="$HOME/BraveCookiesBackup"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Function to determine profile name from path
determine_profile() {
    case $1 in
        *"Default"*) echo "Default" ;;
        *"Profile 1"*) echo "Profile 1" ;;
        *"Profile 3"*) echo "Profile 3" ;;
        *) echo "Unknown" ;;
    esac
}

# Function to back up cookies
backup_cookies() {
    clear
    echo -e "${CYAN}${BOLD}Starting Backup Process...${RESET_COLOR}"
    local BACKUP_TIME=$(date +"%Y-%m-%d %H:%M:%S")
    for COOKIE_PATH in "${COOKIE_PATHS[@]}"; do
        if [ -f "$COOKIE_PATH" ]; then
            PROFILE_NAME=$(determine_profile "$COOKIE_PATH")
            PROFILE_BACKUP_DIR="$BACKUP_DIR/$PROFILE_NAME"
            mkdir -p "$PROFILE_BACKUP_DIR"

            # Copy the file to the profile-specific backup folder
            cp "$COOKIE_PATH" "$PROFILE_BACKUP_DIR/"
            echo -e "${GREEN}Backed up:${RESET_COLOR} $COOKIE_PATH ${YELLOW}=>${RESET_COLOR} $PROFILE_BACKUP_DIR"
        else
            echo -e "${RED}File not found:${RESET_COLOR} $COOKIE_PATH"
        fi
    done
    echo -e "${CYAN}Backup completed for all profiles.${RESET_COLOR}"
    echo -e "${BLUE}Last Backup Time:${RESET_COLOR} ${BOLD}$BACKUP_TIME${RESET_COLOR}"
}

# Function to restore cookies
restore_cookies() {
    clear
    echo -e "${CYAN}${BOLD}Starting Restore Process...${RESET_COLOR}"
    for COOKIE_PATH in "${COOKIE_PATHS[@]}"; do
        PROFILE_NAME=$(determine_profile "$COOKIE_PATH")
        PROFILE_BACKUP_DIR="$BACKUP_DIR/$PROFILE_NAME"

        if [ -d "$PROFILE_BACKUP_DIR" ]; then
            BASENAME=$(basename "$COOKIE_PATH")
            BACKUP_FILE="$PROFILE_BACKUP_DIR/$BASENAME"

            if [ -f "$BACKUP_FILE" ]; then
                cp "$BACKUP_FILE" "$COOKIE_PATH"
                echo -e "${GREEN}Restored:${RESET_COLOR} $BACKUP_FILE ${YELLOW}=>${RESET_COLOR} $COOKIE_PATH"
            else
                echo -e "${RED}Backup file not found:${RESET_COLOR} $BACKUP_FILE"
            fi
        else
            echo -e "${RED}Backup directory not found:${RESET_COLOR} $PROFILE_BACKUP_DIR"
        fi
    done
    echo -e "${CYAN}Restore completed for all profiles.${RESET_COLOR}"
}

# Monitor Brave process and trigger backup on close
if [[ "$1" == "--load" || "$1" == "-l" ]];
    
    then

        echo -e "${BLUE}Restoring cookies from backup...${RESET_COLOR}"
        restore_cookies

elif [[ "$1" == "--save" || "$1" == "-s" ]];
    
    then

        while true;
            
            do
            
                if ! pgrep -x "brave" > /dev/null;
                    
                    then
                        
                        echo -e "${BLUE}Brave is not running. Starting backup...${RESET_COLOR}"
                        backup_cookies
                        sleep 3

            fi

                sleep 1

        done

else

    echo -e "${BLUE}use --load OR -l to load and --save OR -s for save${RESET_COLOR}"

fi
