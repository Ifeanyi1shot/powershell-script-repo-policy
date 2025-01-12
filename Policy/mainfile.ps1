# Variables
$organizationName = "prolifiklexzy"
$projectName = "rezumii"
$repositoryId = "" # Replace with your repository ID
$branchName = ""          # Target branch for the policy
$personalAccessToken = ""

# API URL
$baseUrl = "https://dev.azure.com/$organizationName/$projectName/_apis/policy/configurations?api-version=7.1-preview.1"

# Headers
$headers = @{
    "Content-Type"  = "application/json"
    "Authorization" = "Basic $([Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$personalAccessToken")))"
}

# Define required reviewer IDs (GUIDs of the users)
# Replace with actual user IDs of reviewers in Azure DevOps
$reviewer1Id = "msa.OWY1M2RhZmEtOTY0Ny03ZmY1LTlkYzctZjNiZGQ4YTlkOTFh"  # Replace with actual user ID
$reviewer2Id = "msa.Yzk3MDZjOTEtNjlkMC03NGVmLTljYzYtM2Q2MzEzMWEwMDRm"  # Replace with actual user ID

# Policy configuration payload
$policy = @{
    "isEnabled"       = $true
    "isBlocking"      = $true
    "type"            = @{
        "id" = "fa4e907d-c16b-4a4c-9dfa-4906e5d171dd" # Policy ID for Required Reviewer
    }
    "settings"        = @{
        "minimumApproverCount" = 2  # Require at least 2 reviewers
        "creatorVoteCounts"    = $false  # Author's approval doesn't count
        "requiredReviewerIds"  = @($reviewer1Id, $reviewer2Id)  # Enforce specific reviewers
        "scope" = @(
            @{
                "repositoryId" = $repositoryId
                "refName"      = $branchName
                "matchKind"    = "exact"
            }
        )
    }
}

# Convert payload to JSON
$policyJson = $policy | ConvertTo-Json -Depth 10 -Compress

# Create the policy
$response = Invoke-RestMethod -Uri $baseUrl -Method Post -Headers $headers -Body $policyJson

# Output the response
if ($response) {
    Write-Host "Policy created successfully with ID: $($response.id)"
} else {
    Write-Host "Failed to create the policy."
}
