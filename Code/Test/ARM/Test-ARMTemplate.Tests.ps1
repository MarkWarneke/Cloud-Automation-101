# Extract the module names with a replace of correct test file name

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path)
$template = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.ps1', '.json'


Describe "Template: $template" {

    $templateJson = Get-Content "$here\$template" | ConvertFrom-Json -ErrorAction SilentlyContinue
    $templateParameters = $templateJson.Parameters
    $templateVariables = $templateJson.Variables

    Context "Template Validation" {

        It "has the expected properties defined" {
            $templateProperties = $templateJson | Get-Member -MemberType NoteProperty | ForEach-Object Name
            $expectedProperties = '$schema',
                                  'contentVersion',
                                  'parameters',
                                  'variables',
                                  'resources',                                
                                  'outputs' | Sort-Object # We sort these as Get-Member below will return a sorted list
            
            $templateProperties | Should Be $expectedProperties
        }

        It "uses the correct schema version for ARM deployments" {
            $templateJson.'$schema' | Should Be "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#"
         
        }   
    }

    Context "Parameters Names and Types" {
        
        $templateParamNames = $templateParameters | Get-Member -MemberType NoteProperty | ForEach-Object Name

        $requiredParameters = @(@{'NetworkApiVersion' = @{'type' = 'string'}},
                                @{'ComputeApiVersion' = @{'type' = 'string'}},
                                @{'Location' = @{'type' = 'string'}},
                                @{'VmNames' = @{'type' = 'array'}},
                                @{'VmSize' = @{'type' = 'string'}},
                                @{'AdminUserName' = @{'type' = 'string'}},
                                @{'sshPublicKey' = @{'type' = 'string'}},
                                @{'ImageResourceId' = @{'type' = 'string'}},
                                @{'OsDiskSize' = @{'type' = 'int'}},
                                @{'OsDiskStorageType' = @{'type' = 'string'}},
                                @{'DataDiskCount' = @{'type' = 'int'}},
                                @{'DataDiskSize' = @{'type' = 'int'}},
                                @{'DataDiskStorageType' = @{'type' = 'string'}},
                                @{'State' = @{'type' = 'string'}},
                                @{'SubnetIds' = @{'type' = 'array'}},
                                @{'DiagStorageAccountName' = @{'type' = 'string'}},
                                @{'DiagStorageAccountSasToken' = @{'type' = 'securestring'}},
                                @{'AvailabilitySetResourceId' = @{'type' = 'string'}},
                                @{'Environment' = @{'type' = 'string'}},
                                @{'Department' = @{'type' = 'string'}},
                                @{'Role' = @{'type' = 'string'}},
                                @{'DeploymentDate' = @{'type' = 'string'}})

        # Tests

        # $requiredParameters uses the parameter name as a key value in a hash table. Compare the list to
        # what is contained in the template 

        It "contains necessary parameters" {
            Compare-Object $requiredParameters.Keys $templateParamNames| Should Be $null
        }
        
        # Use the array of known parameter types to ensure these are correct in the template

        foreach($param in $requiredParameters)
        {
            It "parameter $($param.Keys) has a type of $($param.Values.type)" {
                 $templateParameters.$($param.Keys).type | Should Be $($param.Values.type)
            }
        }
    }

    Context "Parameter Defaults" {

        # Confirm any required defaults are present

        It "has a default of 100 for OsDiskSize" {
            $templateParameters.OsDiskSize.defaultValue | Should Be 100
        }

        It "has a default of 100 for DataDiskSize" {
            $templateParameters.DataDiskSize.defaultValue | Should Be 100
        }

        It "has a default of Standard_LRS for OsDiskStorageType" {
            $templateParameters.OsDiskStorageType.defaultValue | Should Be "Standard_LRS"
        }

        It "has a default of Standard_LRS for DataDiskStorageType" {
            $templateParameters.DataDiskStorageType.defaultValue | Should Be "Standard_LRS"
        }

        It "has a default of 0 for DataDiskCount" {
            $templateParameters.DataDiskCount.defaultValue | Should Be 0

        }
    }

    Context "Parameter Value Validation" {

        It "limits OsDiskStorageType to Standard_LRS and Premium_LRS" {
            $templateParameters.OsDiskStorageType.allowedValues | Should Be @("Standard_LRS","Premium_LRS")
        }

        It "limits DataDiskStorageType to Standard_LRS and Premium_LRS" {
            $templateParameters.DataDiskStorageType.allowedValues | Should Be @("Standard_LRS","Premium_LRS")
        }

        It "limits data disks to 1 maximum" {
            $templateParameters.DataDiskCount.maxValue | Should Be 1
        }

        It "limits SubnetIds to a maximum of 2" {
            $templateParameters.SubnetIds.maxLength | Should Be 2
        }

        It "limits SubnetIds to a minimum of 1" {
            $templateParameters.SubnetIds.minLength | Should Be 1
        }
    }

    Context "Variables" {

        $templateVariablesNames = $templateVariables| Get-Member -MemberType NoteProperty | ForEach-Object Name

        $requiredVariables = @('VmCount',
                               'NicCount',
                               'sshKeyPath',
                               'OsDiskCaching',
                               'DataDiskCaching',
                               'NicSuffixes',
                               'OsDiskNameSuffix',
                               'DataDiskNameSuffix',
                               'InitDiskArrayNamePrefix',
                               'DiagStorageUri',
                               'DiagExtensionNameSuffix')

        # Tests

        It "contains necessary variables" {
            Compare-Object $requiredVariables $templateVariablesNames | Should Be $null
        }

        It "initializes OsDiskNameSuffix to .disk.os" {
            $templateVariables.OsDiskNameSuffix | Should Be ".disk.os"
        }

        It "initializes DataDiskNameSuffix to .disk.data" {
             $templateVariables.DataDiskNameSuffix | Should Be ".disk.data"
        }

        It "initializes OsDiskCaching to ReadWrite" {
            $templateVariables.OsDiskCaching | Should Be "ReadWrite"
        }

        It "initializes DataDiskCaching to ReadWrite" {
             $templateVariables.DataDiskCaching | Should Be "ReadWrite"
        }

        It "has vmCount calculated from vmNames array parameter " {
            $templateVariables.vmCount | Should Be "[length(parameters('VmNames'))]"
        }

        It "has NicCount calculated from SubnetIds array parameter " {
            $templateVariables.NicCount | Should Be "[length(parameters('SubnetIds'))]"
        }

        It "sets sshKeyPath to the path correct path based on AdminUserName" {
            $templateVariables.sshKeyPath | Should Be "[concat('/home/',parameters('AdminUserName'),'/.ssh/authorized_keys')]"
        }

        It "has InitDiskArrayNamePrefix set to InitDiskArray" {
            $templateVariables.InitDiskArrayNamePrefix | Should Be "InitDiskArray."
        }

        It "has DiagStorageUri build a URL based on DiagStorageAccountName" {
            $templateVariables.DiagStorageUri | Should Be "[concat('https://',parameters('DiagStorageAccountName'),'.blob.core.windows.net')]"
        }

        It "has DiagExtensionNameSuffix set to /LinuxDiagnostic" {
            $templateVariables.DiagExtensionNameSuffix | Should Be "/LinuxDiagnostic"
        }
    }
    
    Context "Template Core Resource Settings" {

        $coreResourceSettings = $templateJson.resources | Where-Object {$PSItem.type -eq 'Microsoft.Resources/deployments'}

        It "uses an api version of 2016-09-01" {
            $coreResourceSettings.apiVersion | Should Be "2016-09-01"
        }

        It "set an incremental mode for deployment" {
            $coreResourceSettings.properties.mode | Should Be "Incremental"
        }

        It "includes all the required Azure resources" {
            $expectedResources =  'Microsoft.Resources/deployments',
                                  'Microsoft.Network/networkInterfaces',
                                  'Microsoft.Compute/virtualMachines',
                                  'Microsoft.Compute/virtualMachines/extensions' | Sort-Object
            $templateResources = $templateJson.Resources.type | Sort-Object -Unique
            $templateResources | Should Be $expectedResources
        }
    }

    Context "virtualMachines Resource Settings" {

        $vmRes = $templateJson.resources | Where-Object {$PSItem.type -eq "Microsoft.Compute/virtualMachines"}

        Context "osDisk settings" {

            It "specifies Linux as the operating system" {
                $vmRes.properties.storageProfile.osDisk.osType | Should Be "Linux"
            }

            It "instructs to build from an image" {
                $vmRes.properties.storageProfile.osDisk.createOption | Should Be "FromImage"
            }

            It "sets the disk size to that passed to osDiskSize parameter" {
                $vmRes.properties.storageProfile.osDisk.diskSizeGB | Should Be "[parameters('OsDiskSize')]"
            }

            It "sets caching from the OsDiskCaching variable" {
                $vmRes.properties.storageProfile.osDisk.caching | Should Be "[variables('OsDiskCaching')]"
            }
        }

        Context "osProfile settings" {
            
            It "sets the admin user from adminUserName parameter" {
                $vmRes.properties.osProfile.adminUsername | Should Be "[parameters('AdminUsername')]"
            }
        }

        Context "hardwareProfile settings" {

            It "sets vmSize from the vmSize parameter passed" {
                $vmRes.properties.hardwareProfile.vmSize | Should Be "[parameters('VmSize')]"
            }
        }

    }

    Context "virtualMachines/extensions Resource Settings" {


    }

    Context "networkInterfaces Resource Settings" {


    }


}

