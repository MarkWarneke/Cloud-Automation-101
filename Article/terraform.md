# Terra Form
- DevOps Engineers
- Cloud Agnostic
- IaC
- Go APIs
- State Management
- Service Principle
- Azure CLI
- Clienttool for Terra form
  - Azure Cloud Shell
     - Native cloud shell
- JSON light (hcl) hashicorp configuraiton language
  - variables
  - creates graph and dependencies
- deploy it in parallel if can
- Terraform providers
 
[terraform-provides examples](github.com/terraform-provides/terraform-provider-azurerm/examples)

```
terraform init 
# local state

terraform plan # like whatif
# what will change
# state modify / update / delete etc

# variables.tf
# variables to describe

terrafom apply # run the plan
# outputs everything to stream
```

## Pros
- Cloud Agnostic
- Testing https://www.terraform.io/docs/extend/testing/unit-testing.html

## Cons
- Uses AZ cli (refactor to python / az cli needed)
- Abstraction of Azure Provider
- Go implementation
- HCL 
