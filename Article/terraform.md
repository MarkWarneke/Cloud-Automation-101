# Terraform

- For DevOps Engineers
- Cloud Agnostic
- IaC
- Go APIs
- can manage State Management
- uses own Service Principle
- uses Azure CLI
- separate Client tool for Terra form
  - integrates into Azure Cloud Shell
    - Native cloud shell
- JSON light language: (hcl) HashiCorp configuration language
  - human readable
  - variables
  - creates graph and dependencies
- deploy it in parallel if can
- uses Terraform providers (Kubernetes / ARM)

## Demo Terraform

[terraform-provides examples](github.com/terraform-provides/terraform-provider-azurerm/examples)

```bash
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
- Testing [Terraform: Unit-Testing](https://www.terraform.io/docs/extend/testing/unit-testing.html)

## Cons

- Uses AZ cli (refactor to python / az cli needed)
- Abstraction of Azure Provider
- Go implementation
- HCL
