Connect-AzureRmAccount

Describe "how to clean up" {
    $TestResourceGroupName = (Get-Date -Format FileDateTime)
    $Location = 'WestEurope'

    BeforeEach {
        Write-Host "Create Test ResourceGroup $TestResourceGroupName..." -ForeGroundColor Blue
        New-AzureRmResourceGroup -Name $TestResourceGroupName -Location $Location | Out-Null
        Write-Host "Test started." -ForeGroundColor Blue
    }

    it "should cleanup" { "A" | Should Be "A" }

    AfterEach {
        Write-Host "Remove ResourceGroup $TestResourceGroupName..." -ForeGroundColor Blue
        Get-AzureRmResourceGroup $TestResourceGroupName -ErrorAction SilentlyContinue | Remove-AzureRmResourceGroup -Force
        Write-Host "Test completed." -ForeGroundColor Blue
    }
}