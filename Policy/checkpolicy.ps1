# Variables
$organizationName = "prolifiklexzy"
$projectName = "rezumii"
$personalAccessToken = "C39niNvfffBBd3dwTjIAPDGaSRTfC0nOf09bmopbatbqJ3mQBY9IJQQJ99ALACAAAAAAAAAAAAASAZDO4uHH"

# API URL for fetching policies
$baseUrl = "https://dev.azure.com/$organizationName/$projectName/_apis/policy/configurations?api-version=7.1-preview.1"

# Headers
$headers = @{
    "Authorization" = "Basic $([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$personalAccessToken")))"
}

# Fetch existing policies
$response = Invoke-RestMethod -Uri $baseUrl -Method Get -Headers $headers

# Output the policies
$response.value | ForEach-Object { $_ | ConvertTo-Json -Depth 10 }

# or 

# Variables
#$organizationName = "prolifiklexzy"
#$projectName = "rezumii"
#$personalAccessToken = "C39niNvfffBBd3dwTjIAPDGaSRTfC0nOf09bmopbatbqJ3mQBY9IJQQJ99ALACAAAAAAAAAAAAASAZDO4uHH"

# API URL for fetching policies
#$baseUrl = "https://dev.azure.com/$organizationName/$projectName/_apis/policy/configurations?api-version=7.1-preview.1"

# Headers
#$headers = @{
#    "Authorization" = "Basic $([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$personalAccessToken")))"
#}

# Fetch existing policies
#$response = Invoke-RestMethod -Uri $baseUrl -Method Get -Headers $headers

# Output the policies
#if ($response.value) {
#    $response.value | ForEach-Object { 
#        Write-Host "Policy ID: $($_.id)" 
#       Write-Host "Display Name: $($_.type.displayName)" 
#        Write-Host "Branch Scope: $($_.settings.scope.refName)" 
#        Write-Host "--------------------------------------------"
#    }
#} else {
#    Write-Host "No policies found."
#}
