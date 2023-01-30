$status = $false

# =================================== Start Main Program ===================================

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
        1 { Write-Output "1"
        break  }
        2 { Write-Output "2"
        break }
        3 {Write-Output "3"
        break  }
        4 { Write-Output "4"
        break }
        Default {Write-Output "Invalid"}
    }

}

cmd /c pause