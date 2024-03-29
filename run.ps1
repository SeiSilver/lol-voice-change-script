# Get Client Path
$leagueProcess = Get-Process -Name LeagueClient -ErrorAction SilentlyContinue
$CLIENT_PATH = $null

if ($leagueProcess) {
    $clientPath = Split-Path -Path $leagueProcess.Path -Parent
    $CLIENT_PATH = Join-Path -Path $clientPath -ChildPath "LeagueClient.exe"
    Write-Output "League of Legends client path: $CLIENT_PATH"

    $leagueProcess | Stop-Process -Force
    Write-Output "Stop client!"
}
else {
    Write-Output "League of Legends client is not running."
}

$status = $false
$LOCATION_CODE = "vi_VN"

function Validate-Option {
    if ($option -eq "YES" -or $option -eq "Y" ) {
        return $true
    }
    Clear-Host
    return $false
}

while ($status -eq $false) {

    Write-Output "---------------------------------------------------------------------------"
    Write-Output "Options:"
    Write-Output "1. Change Language to Vietnamese"
    Write-Output "2. Change Language to Japanese"
    Write-Output "3. Change Language to US"
    Write-Output "4. Change Language to Other"
    Write-Output ""
    $choice = Read-Host "Enter your choice here"
    $option = Read-Host "Are you sure(Y/N)"
    $status = Validate-Option

    switch ($choice) {
        1 {
            $LOCATION_CODE = "vi_VN"
            break
        }
        2 {
            $LOCATION_CODE = "ja_JP"
            break
        }
        3 {
            $LOCATION_CODE = "en_US"
            break
        }
        4 {
            $LOCATION_CODE = Read-Host "Enter your Location Code here"
            break
        }
        Default {
            Clear-Host
            Write-Output "Invalid choice pls try-again"
            Write-Output ""
            $status = $false
        }
    }

}

Start-Process $CLIENT_PATH --locale=$LOCATION_CODE
Write-Output "Change Language success"
Write-Output "Please wait for the game to start"

cmd /c pause