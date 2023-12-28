#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

#
# you can run script with 2 arguments (your commit comment)
# ./push.ps1 -m "yourCommit"
#

# a simple PowerShell script to push your commits to GitHub #


# Function to print colored text #
function Write-ColoredText {
    param (
        [string]$text,
        [string]$color
    )
    Write-Host $text -ForegroundColor $color
}

Write-ColoredText "#############################" "Cyan"
Write-ColoredText "#      Git Push Script      #" "Cyan"
Write-ColoredText "#############################" "Cyan"

# Get branch name #
$Branch = git rev-parse --abbrev-ref HEAD

# Default commit message based on changes #
$DEFAULT_COMMIT_MSG = ""

# Get Git status #
git status -s | ForEach-Object {
    $status = $_.Substring(0, 2)
    $file = $_.Substring(3).Trim()

    switch ($status) {
        "D" {
            # Deleted #
            $DEFAULT_COMMIT_MSG += "    ==> deleted : $file `n"
            break
        }
        "M" {
            # Modified #
            $DEFAULT_COMMIT_MSG += "    ==> modified : $file `n"
            break
        }
        "??" {
            # Added #
            $DEFAULT_COMMIT_MSG += "    ==> added : $file `n"
            break
        }
    }
}

# If no changes detected, use a default message #
if (-not $DEFAULT_COMMIT_MSG) {
    $DEFAULT_COMMIT_MSG = "   ==> NO changes"
}

Write-ColoredText "`n[*] Your Current Branch : $Branch" "Red"

# Get new updates if they exist #
Write-ColoredText "`n[+] Updating Repo... `n" "Magenta"
git pull

Write-ColoredText "`n[+] The new changes in the repo:`n`n$DEFAULT_COMMIT_MSG" "Magenta"

Write-ColoredText "`n[+] Adding new changes to the repo... `n" "Magenta"
git add --all .

if ($args[0] -eq "-m") {
    # Commit changes #
    Write-Host ""
    git commit -m $args[1]
} else {
    # Use the default commit message #
    Write-Host ""
    git commit -m $DEFAULT_COMMIT_MSG
}

# Push to repo #
Write-Host ""
git push -u origin $Branch

# Done #
Write-ColoredText "`n[✔] D O N E `n" "Green"
