Param(

    [parameter(position=0,Mandatory=$true)]
    $uri,
        [parameter(position=1,Mandatory=$true)]
    $apiver
    
)

$azContext = Get-AzContext
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile
$profileClient = New-Object -TypeName Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient -ArgumentList ($azProfile)
$token = $profileClient.AcquireAccessToken($azContext.Subscription.TenantId)
$authHeader = @{
   'Content-Type'='application/json'
   'Authorization'='Bearer ' + $token.AccessToken
}
$restUri = "${uri}?api-version=${apiver}"
$response = Invoke-RestMethod -Uri $restUri -Method Get -Headers $authHeader 
$response | convertto-json
