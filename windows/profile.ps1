$Host.UI.RawUI.BackgroundColor = 'Black'
$Host.UI.RawUI.ForegroundColor = 'White'
$Host.PrivateData.ErrorForegroundColor = 'DarkRed'
$Host.PrivateData.ErrorBackgroundColor = 'Black'
$Host.PrivateData.WarningForegroundColor = 'Yellow'
$Host.PrivateData.WarningBackgroundColor = 'Black'
$Host.PrivateData.DebugForegroundColor = 'Yellow'
$Host.PrivateData.DebugBackgroundColor = 'Black'
$Host.PrivateData.VerboseForegroundColor = 'Green'
$Host.PrivateData.VerboseBackgroundColor = 'Black'
$Host.PrivateData.ProgressForegroundColor = 'DarkGray'
$Host.PrivateData.ProgressBackgroundColor = 'Black'
Clear-Host

function prompt {
    $d = Get-Date -UFormat '%R'
    $u = $env:UserName
    $c = $env:ComputerName
    Write-Host "[" -ForegroundColor Green -NoNewLine
    Write-Host " $u @ $c " -ForegroundColor White -NoNewLine
    Write-Host "]=[" -ForegroundColor Green -NoNewLine
    Write-Host " $d " -ForegroundColor White -NoNewLine
    Write-Host "]=[" -ForegroundColor Green -NoNewLine
    Write-Host " $($ExecutionContext.SessionState.Path.CurrentLocation) " -ForegroundColor White -NoNewLine
    Write-Host "] `r`n`$" -ForegroundColor Green -NoNewLine
    return " "
}

[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\tools\neovim\Neovim\bin", "Machine")
