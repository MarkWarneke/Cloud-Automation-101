Context "Virtual Machines Validation with VMSet[$Server] and [$nic] NICs" {
    $deploymentOutput = Invoke-TestDebugDeployment.ps1 -TemplateParameterObject $TemplateParameterObject -TemplateFile $TemplateFile

    $vm = $deploymentOutput.validatedResources | Where-Object { $_.type -eq 'Microsoft.Compute/virtualMachines' }

    It "Should provision the correct number of computer resources " {

        $vms.TargetItemName.Count | Should Be $Vm.Name.Count
    }

    It "Should provision vhds" {

        $vm.properties.storageProfile.osDisk.vhd.uri.Count | Should Be $vms.TargetItemName.Count
    }
}

Context "NIC Validation with VMSet[$Server] and [$nic] NICs" {
    $TemplateParameterObject.NumberOfNics = $Nic

    $deploymentOutput = Test-ArmTemplate -TemplateParameterObject $TemplateParameterObject -TemplateFile $TemplateFile

    It "Should provision each VM with $Nic Nics" {

        $nics = $deploymentOutput.validatedResources | Where-Object {$_.type -match 'Microsoft.Network/networkInterfaces' -and $_.Name -notmatch "TestServer"}

        (($TemplateParameterObject.vms.TargetItemName.Count - 1) * $Nic) | Should Be $Nics.Name.Count
    }

    It "TestServer Should have a Public NIC" {

        $publicNic = $deploymentOutput.validatedResources | Where-Object {$_.type -match 'Microsoft.Network/publicIPAddress'}

        $publicNic.Name.Count | Should Be 1
        $publicNic.Name | Should Be 'TestServerPip1'
    }
} 
