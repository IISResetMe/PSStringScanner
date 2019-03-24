param(
    [Switch]$DontCreateZip
)

##
#   Used in Appveyor.yml
##

$PSVersionTable.PSVersion

if ($null -eq (Get-Module -ListAvailable pester)) {
    Install-Module -Name Pester -Repository PSGallery -Force -Scope CurrentUser
}

$result = Invoke-Pester -Script $PSScriptRoot\__tests__ -Verbose -PassThru

if ($result.FailedCount -gt 0) {
    throw "$($result.FailedCount) tests failed."
}