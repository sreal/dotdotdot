function Watch-Command {
    param (
        [string] $command,
        [int] $interval = 2
    )

    do {
        clear
        invoke-expression $command

        # Just to let the user know what is happening
        "Waiting for $interval seconds. Press Ctrl-C to stop execution..."
        sleep $interval
    }
    # loop FOREVER
    while (1 -eq 1)
}

### Prompt with Git added
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
    Write-Host "  " -nonewline
    Write-Host($pwd.ProviderPath) -nonewline
    Write-VcsStatus
    $global:LASTEXITCODE = $realLASTEXITCODE
    return "
  >  "
}

# Setup posh-git prompt
Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)
Import-Module C:\Users\Simon\projects\setup\posh-git
Enable-GitColors
Pop-Location
Start-SshAgent -Quiet

# Override Console Readline with one that can handle Emacs bindings
if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadline
    Set-PSReadlineOption -EditMode Emacs
}

# PsGet Module
Import-Module PsGet


# Load PhantomJs into environment for running Karma locally
$phantomjs = Get-Command phantomjs.cmd
$Env:PHANTOMJS_BIN=$phantomjs.Definition

$Env:CHROME_BIN="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"

$CustomPaths = @(
  "C:\applications\Heroku\bin",
  "C:\applications\Heroku\bin\ruby-1.9.2\bin",
  "C:\applications\Hava\bin",
  "C:\applications\VirtualBox",
  "C:\applications\Vagrant\embedded\mingw\bin",
  "C:\applications\cygwin64\bin",
  "C:\Program Files (x86)\Java\jre7\bin"
);

$CustomPaths | % {
  $Env:Path += ";$_"
};

# Custom Aliases
If (-not (Test-Path Alias:\notepad)) {
  New-Alias notepad "c:\applications\Notepad++\notepad++.exe"
}
If (-not (Test-Path Alias:\edit)) {
  New-Alias edit "c:\applications\Notepad++\notepad++.exe"
}
If (-not (Test-Path Alias:\nunit-console)) {
  New-Alias nunit-console "C:\applications\NUnit 2.6.3\bin\nunit-console.exe"
}
If (-not (Test-Path Alias:\open)) {
  New-Alias open "start"
}
If (-not (Test-Path Alias:\watch)) {
  New-Alias watch "Watch-Command"
}

# Start a transcript for the session
$LogFile = "C:\PowerShellTranscripts\log_"+(Get-Date -Format "yyyy-MM-dd_hhmm-ssfff")+".txt";
Start-Transcript -Path "$LogFile";
Register-EngineEvent -SourceIdentifier powershell.exiting -SupportEvent -Action {
  Stop-Transcript
}

# Magic vars