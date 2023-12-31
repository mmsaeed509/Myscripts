#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

# Colors #
$RESET_COLOR = "`e[0m"
$BCyan = "`e[1;36m"
$BRed = "`e[1;31m"
$BYellow = "`e[1;33m"
$BPurple = "`e[1;35m"
$BBlue = "`e[1;34m"
$BGreen = "`e[1;32m"

# Echo function to simulate 'echo -e' #
function Echo-Color ($text, $color) {
    
    Write-Host "$color$text$RESET_COLOR"

}

# Main script #
Echo-Color "" $BCyan
Echo-Color "#############################" $RESET_COLOR
Echo-Color "#      Git Push Script      #" $RESET_COLOR
Echo-Color "#############################" $RESET_COLOR

# Get branch name #
$DEFAULT_BRANCH = git rev-parse --abbrev-ref HEAD
$TARGET_BRANCH = $DEFAULT_BRANCH

# Get default commit message based on changes #
$DEFAULT_COMMIT_MSG = ""

git status -s -z | ForEach-Object {

    $status = $_.Substring(0, 2)
    $file = $_.Substring(3).Trim()

    switch ($status) {

        "D" {

            # Deleted #
            $DEFAULT_COMMIT_MSG += "    ${BRed}==> deleted : $file${RESET_COLOR}"

        }

        "M" {

            # Modified #
            $DEFAULT_COMMIT_MSG += "    ${BCyan}==> modified : $file ${RESET_COLOR}"

        }

        "??" {

            # Added #
            $DEFAULT_COMMIT_MSG += "    ${BGreen}==> added : $file ${RESET_COLOR}"

        }

    }

    # Add a newline character after each line #
    $DEFAULT_COMMIT_MSG += "`n"

}

# Remove the trailing newline #
$DEFAULT_COMMIT_MSG = $DEFAULT_COMMIT_MSG.TrimEnd("`n")

# If no changes detected, use a default message #
if (-not $DEFAULT_COMMIT_MSG) {

    $DEFAULT_COMMIT_MSG = "   ==> NO changes"

}

Echo-Color "`n[*] Your Current Branch : ${BYellow}$DEFAULT_BRANCH$RESET_COLOR" $BRed

# Get new updates #
Echo-Color "`n[+] Updating Repo...`n" $BPurple
git pull

Echo-Color "`n[+] The new changes in the repo:`n`n${BYellow}$DEFAULT_COMMIT_MSG$RESET_COLOR" $BPurple

# Process script arguments #
$CREATE_PR = $false
$TARGET_PR_BRANCH = ""

for ($i=0; $i -lt $args.Length; $i++) {

    switch ($args[$i]) {

        "-t" {
            $TARGET_BRANCH = $args[$i + 1]
            $i++
        }

        "--target-branch" {
            $TARGET_BRANCH = $args[$i + 1]
            $i++
        }

        "-m" {
            $DEFAULT_COMMIT_MSG = $args[$i + 1]
            $i++
        }

        "--commit-msg" {
            $DEFAULT_COMMIT_MSG = $args[$i + 1]
            $i++
        }

        "--create-pr" {
            $CREATE_PR = $true
            $TARGET_PR_BRANCH = $args[$i + 1]
            $i++
        }

    }

}


Echo-Color "`n[+] Target Branch : ${BYellow}$TARGET_BRANCH$RESET_COLOR" $BRed

if ($TARGET_BRANCH -ne $DEFAULT_BRANCH) {

    if (git show-ref --verify --quiet "refs/heads/$TARGET_BRANCH") {

        Echo-Color "  └──> Changing to the Target Branch: ${BYellow}$TARGET_BRANCH$RESET_COLOR" $BBlue
        git checkout $TARGET_BRANCH

    } else {

        Echo-Color "  └──> Creating and changing to the Target Branch: ${BYellow}$TARGET_BRANCH$RESET_COLOR" $BBlue
        git checkout -b $TARGET_BRANCH

    }

}

Echo-Color "`n[+] Adding new changes to the repo...`n" $BPurple
git add --all .

# Check for a custom commit message #
if ($DEFAULT_COMMIT_MSG) {

    Echo-Color "`n" $RESET_COLOR
    git commit -m $DEFAULT_COMMIT_MSG

}

# Push to Target Branch #
Echo-Color "`n" $RESET_COLOR
git push -u origin $TARGET_BRANCH

# Check and create a pull request #
if ($CREATE_PR -and $TARGET_PR_BRANCH) {

    Echo-Color "`n[+] Creating a pull request from $TARGET_BRANCH to $TARGET_PR_BRANCH...$RESET_COLOR" $BBlue
    gh pr create --base $TARGET_PR_BRANCH --head $TARGET_BRANCH --title "Pull Request: $TARGET_BRANCH to $TARGET_PR_BRANCH" --body "Please review and merge."

}

# D O N E! #
Echo-Color "`n[✔] D O N E" $BGreen
