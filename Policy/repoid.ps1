# Replace with your Azure DevOps details
$organization = "prolifiklexzy"
$project = "rezumii"
$personalAccessToken = "C39niNvfffBBd3dwTjIAPDGaSRTfC0nOf09bmopbatbqJ3mQBY9IJQQJ99ALACAAAAAAAAAAAAASAZDO4uHH"

# Azure DevOps REST API URL for listing repositories
$reposUrl = "https://dev.azure.com/$organization/$project/_apis/git/repositories?api-version=7.1-preview.1"

# Encode the PAT for Basic Authentication
$encodedPAT = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$personalAccessToken"))
$headers = @{ Authorization = "Basic $encodedPAT" }

# Fetch repositories
$response = Invoke-RestMethod -Uri $reposUrl -Method Get -Headers $headers

# Display repository names and IDs
$response.value | Select-Object name, id
