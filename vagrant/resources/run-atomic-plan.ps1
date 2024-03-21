# Define the name of the CSV file

$csvName = Read-Host "What CSV do you want to use?"
$csvPath = "$pwd/$csvName.csv"

$atomicPlanName = Read-Host "Enter plan name"

# Define the log location for test logs
$attireLogLocation = "/opt/vectr/attire-merger/input"

# Prompt user for hostname, username, and password
$hostname = Read-Host "Enter the victim IP address"
$username = Read-Host "Enter the username"

# Create a new PSSession
$sess = New-PSSession -Hostname $hostname -Username $username

# Intiate counter
$counter = 0

# Read the CSV file and execute each test, creating a separate log file for each
Import-Csv $csvPath | ForEach-Object {
    # Extract fields from the current entry
    $technique = $_.Technique
    $testGUID = $_.auto_generated_guid
    $inputArgs = $_.InputArgs
    $timeoutSeconds = $_.timeoutSeconds
    $counter++
    $attireLog = "$($attireLogLocation)/$($technique)_$(Get-Date -Format 'yyyyMMdd-HHmmss')-$counter.json"
    # Check if InputArgs is not null
    if ($inputArgs) {
        # Convert inputArgs string into a hashtable
        $argsHashtable = ConvertFrom-StringData $($inputArgs -split ", " -join "`r`n")
     

    # Execute the Atomic test with InputArgs
        Invoke-AtomicTest $technique -TestGUID $testGUID -TimeoutSeconds $timeoutSeconds -LoggingModule Attire-ExecutionLogger -ExecutionLogPath $attireLog -InputArgs $argsHashtable -Session $sess
    } else {
        Invoke-AtomicTest $technique -TestGUID $testGUID -TimeoutSeconds $timeoutSeconds -LoggingModule Attire-ExecutionLogger -ExecutionLogPath $attireLog -Session $sess

    }
}
