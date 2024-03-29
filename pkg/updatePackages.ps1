#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Exodia OS         #
#                                   #
#####################################

<# Variables & Array #>
$WORKING_DIR = pwd # to work in right directory #

<# Array to store the needed directories to update their packages #>
$DIRECTORIES = @("apikey-manager","auth","checkout","customer","emailing","kms","manage-business","payment","tokenization")

Write-Host ""
Write-Host "[*] Update Packages Script" -ForegroundColor DarkBlue
Write-Host ""

<# here we loop in all directories one by one and update their packages #>
foreach ($PACKAGE in $DIRECTORIES) {
    
    Write-Host "   ==> updating $PACKAGE packages... " -ForegroundColor Red
    cd $WORKING_DIR/$PACKAGE
    npm run update:common
    Write-Host "       [✔] $PACKAGE packages updated successfully!" -ForegroundColor Green
    Write-Host ""

}

cd $WORKING_DIR # Return to working directory #

Write-Host ""
Write-Host "[✔]    D O N E!" -ForegroundColor Green
Write-Host ""
