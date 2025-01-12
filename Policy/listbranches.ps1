# Replace with your Azure DevOps details
$organization = "prolifiklexzy"
$project = "rezumii"
$repository = "rezumii"  # Replace with your repository name
$personalAccessToken = ""

# Azure DevOps REST API endpoint
$uri = "https://dev.azure.com/$organization/$project/_apis/git/repositories/$repository/refs?filter=heads&api-version=7.1-preview.1"

# Encode the Personal Access Token (PAT) for Basic Authentication
$encodedPat = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$personalAccessToken"))

# Create the Headers for the REST API Request
$headers = @{
    Authorization = "Basic $encodedPat"
}

# Perform the API request to get the branches
$response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get

# Check if the response contains value
if ($response.value) {
    # Display the branch names
    $response.value | ForEach-Object {
        Write-Output $_.name
    }
} else {
    Write-Output "No branches found or an error occurred."
}
