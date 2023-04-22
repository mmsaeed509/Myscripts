#####################################
#                                   #
#  @author      : 00xWolf           #
#    GitHub    : @mmsaeed509       #
#    Developer : Mahmoud Mohamed   #
#  﫥  Copyright : Mahmoud Mohamed   #
#                                   #
#####################################

# clear console #
cls

function Set-ExodiaFetch {
    [CmdletBinding()]
    param(
        [string]$FontType = "JetBrainsMono Nerd Font"
    )

    $exodiaFetch = @'
     ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━┓
     ┃                                                                                ┃   Exodia Fetch ┃        ┃
     ┃  ██╗ ██╗     ███████╗██╗  ██╗ ██████╗ ██████╗ ██╗ █████╗      ██████╗ ███████╗ ┣━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━┫
     ┃ ████████╗    ██╔════╝╚██╗██╔╝██╔═══██╗██╔══██╗██║██╔══██╗    ██╔═══██╗██╔════╝ ┃                             ┃
     ┃ ╚██╔═██╔╝    █████╗   ╚███╔╝ ██║   ██║██║  ██║██║███████║    ██║   ██║███████╗ ┃                             ┃
     ┃ ████████╗    ██╔══╝   ██╔██╗ ██║   ██║██║  ██║██║██╔══██║    ██║   ██║╚════██║ ┃   Developed by : 00xWolf   ┃
     ┃ ╚██╔═██╔╝    ███████╗██╔╝ ██╗╚██████╔╝██████╔╝██║██║  ██║    ╚██████╔╝███████║ ┃   GitHub : @mmsaeed509     ┃
     ┃  ╚═╝ ╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═╝     ╚═════╝ ╚══════╝ ┃ 﫥 Cyb3rTh1eveZ Team         ┃
     ┃                                                                                ┃                             ┃
     ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛ 
'@

    $Host.UI.RawUI.FontFamily = $FontType
    Write-Host $exodiaFetch
}


# Set-ExodiaFetch -FontType "JetBrainsMono Nerd Font"
# Set-ExodiaFetch

Write-Host " ------------------------------------------"  -ForegroundColor Cyan
Write-Host "| Developed By: Mahmoud Mohamed <00xWolf>  |" -ForegroundColor Cyan
Write-Host "| GitHub: @mmsaeed509                      |" -ForegroundColor Cyan
Write-Host "| Powered By: Exodia OS                    |" -ForegroundColor Cyan
Write-Host "| Gmail: mmsaeed509@gmail.com              |" -ForegroundColor Cyan
Write-Host " ------------------------------------------"  -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
# Start-Sleep -Seconds 0.3


# set theme #
oh-my-posh init pwsh --config C:\Users\Eng_Mahmoud\Desktop\GitHub\OhMyPosh\atomic.omp.json | Invoke-Expression

# more themes  #
# visti: https://ohmyposh.dev/docs/themes

# Alias #

# git #
function gcl {git clone --depth 1}
function gi {git init}
function ga {git add}
function gc {git commit -m}
function gp {git push origin master}
function cb {git checkout}
