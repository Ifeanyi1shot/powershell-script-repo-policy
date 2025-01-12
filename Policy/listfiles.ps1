# Variables
$organizationName = "prolifiklexzy"
$projectName = "rezumii"
$personalAccessToken = ""  # Replace with your actual PAT

# API URL for listing available policy types
$policyTypesUrl = "https://dev.azure.com/$organizationName/$projectName/_apis/policy/types?api-version=7.1-preview.1"

# Authentication header
$headers = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$personalAccessToken"))
}

# Invoke API
$response = Invoke-RestMethod -Uri $policyTypesUrl -Method Get -Headers $headers
$response.value | Format-Table -Property id, displayName
