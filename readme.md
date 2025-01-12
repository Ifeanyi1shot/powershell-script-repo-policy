# Azure DevOps Scripts Documentation

This documentation provides an overview of the PowerShell scripts written for managing various configurations and policies in an Azure DevOps project. These scripts interact with Azure DevOps REST APIs to perform operations such as fetching policies, listing branches, creating policies, and fetching user information.

---

## **Table of Contents**

1. [checkpolicy.ps1](#checkpolicyps1)
2. [listbranche.ps1](#listbrancheps1)
3. [listfiles.ps1](#listfilesps1)
4. [mainfile.ps1](#mainfileps1)
5. [repoid.ps1](#repoidps1)
6. [userid.ps1](#useridps1)

---

## **checkpolicy.ps1**

### **Description**
This script fetches and displays all existing policies configured in a given Azure DevOps project.

### **Endpoints**
- `https://dev.azure.com/{organization}/{project}/_apis/policy/configurations?api-version=7.1-preview.1`

### **Key Features**
- Authenticates using a Personal Access Token (PAT).
- Fetches all policy configurations.
- Outputs policies in JSON format for detailed viewing.

### **Code Highlights**
- Uses `Invoke-RestMethod` for API calls.
- Converts the response to JSON for easier readability.
- Allows customization of output format.

---

## **listbranche.ps1**

### **Description**
This script lists all branches in a specified Azure DevOps repository.

### **Endpoints**
- `https://dev.azure.com/{organization}/{project}/_apis/git/repositories/{repository}/refs?filter=heads&api-version=7.1-preview.1`

### **Key Features**
- Retrieves all branches in a repository.
- Outputs branch names for user reference.

### **Code Highlights**
- Constructs authentication headers using a PAT.
- Handles cases where no branches are found or errors occur.

---

## **listfiles.ps1**

### **Description**
This script is used to create a policy that enforces specific reviewer requirements for a branch in an Azure DevOps repository.

### **Endpoints**
- `https://dev.azure.com/{organization}/{project}/_apis/policy/configurations?api-version=7.1-preview.1`

### **Key Features**
- Creates a "Required Reviewer" policy.
- Configurable to enforce a minimum number of approvers.
- Can restrict reviews to specific users.
- Targets a specific branch within the repository.

### **Code Highlights**
- Defines required reviewer IDs.
- Constructs a policy payload in JSON format.
- Uses the POST method to create the policy.

---

## **mainfile.ps1**

### **Description**
This script lists all repositories in the specified Azure DevOps project.

### **Endpoints**
- `https://dev.azure.com/{organization}/{project}/_apis/git/repositories?api-version=7.1-preview.1`

### **Key Features**
- Fetches repository names and IDs.
- Useful for identifying repositories for further operations.

### **Code Highlights**
- Outputs repository details for user reference.
- Utilizes the `Select-Object` cmdlet to display only relevant fields.

---

## **repoid.ps1**

### **Description**
This script retrieves a list of users associated with an Azure DevOps organization.

### **Endpoints**
- `https://vssps.dev.azure.com/{organization}/_apis/graph/users?api-version=7.1-preview.1`

### **Key Features**
- Fetches user information, including email and descriptors.
- Useful for identifying user IDs required in policy configurations.

### **Code Highlights**
- Constructs authentication headers using a PAT.
- Uses `Select-Object` to display user details.

---

## **userid.ps1**

### **Description**
This script retrieves user details for a given Azure DevOps organization, including email addresses and unique user descriptors.

### **Endpoints**
- `https://vssps.dev.azure.com/{organization}/_apis/graph/users?api-version=7.1-preview.1`

### **Key Features**
- Provides user information for configuration or auditing purposes.
- Displays user names, email addresses, and unique descriptors.

### **Code Highlights**
- Utilizes the `Select-Object` cmdlet for concise output.
- Handles authentication using an encoded PAT.

---

## **How It Works**

### **Authentication**
All scripts use a **Personal Access Token (PAT)** for authentication. The token is Base64-encoded and included in the `Authorization` header of each API call:
```powershell
$encodedPAT = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$personalAccessToken"))
$headers = @{ Authorization = "Basic $encodedPAT" }
