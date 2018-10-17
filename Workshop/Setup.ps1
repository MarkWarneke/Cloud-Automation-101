Get-Module Az.Profile


Connect-AzAccount

$Location = "WestEurope"
$Environment = "T"
$LocationShort = "W"
$Resource = "DSVM"
$ResourceGroupName = "{1}{0}{2}{0}{3}" -f $Delimiter, $Environment, $LocationShort, $Resource

Write-Verbose "$(Get-Date -Format o) - ResourceGroupName $ResourceGroupName"
$ResourceGroup = New-AzResourceGroup -Location $Location -Name $ResourceGroupName
Write-Verbose "$(Get-Date -Format o) - Created $ResourceGroupName"


$VmName = "{0}{1}{2}" -f $Environment, $LocationShort, $Resource
$VmSize = "Standard_DS3"

$VirtualMachine = New-AzureRmVMConfig -VMName $VMName -VMSize $VMSize
$VirtualMachine = Set-AzureRmVMOperatingSystem -VM $VirtualMachine -Windows -ComputerName $ComputerName -Credential $Credential -ProvisionVMAgent -EnableAutoUpdate

$VirtualMachine = Set-AzureRmVMSourceImage -VM $VirtualMachine -PublisherName 'MicrosoftWindowsServer' -Offer 'WindowsServer' -Skus '2012-R2-Datacenter' -Version latest

New-AzureRmVM -ResourceGroupName $ResourceGroupName -Location $Loca

New-AzureRMVm -Name