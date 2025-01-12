$organization = "prolifiklexzy"
$personalAccessToken = "C39niNvfffBBd3dwTjIAPDGaSRTfC0nOf09bmopbatbqJ3mQBY9IJQQJ99ALACAAAAAAAAAAAAASAZDO4uHH"  # Replace with your PAT

# Azure DevOps Graph API URL
$url = "https://vssps.dev.azure.com/$organization/_apis/graph/users?api-version=7.1-preview.1"

# Encode the PAT for authentication
$encodedPAT = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$personalAccessToken"))

# Headers for the API call
$headers = @{ Authorization = "Basic $encodedPAT" }

# Fetch users
$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers

# Display users with email and descriptor
$response.value | Select-Object displayName, mailAddress, descriptor