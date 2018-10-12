# Cloud-Automation-101

 Introduction to Cloud Automation, Azure DevOps, Infrastructure As Code (IaC), PowerShell, Azure Resource Manager (ARM), Unit-Testing with Pester, CI/CD Pipeline with Azure DevOps and more!

 - Link to [Article](Article)
 - Link to [Code](Code)

## What is Cloud Automation

*My Definition of Infrastructure as Code:*

> Infrastructure as Code is the process of managing and provisioning computing infrastructure and its configuration through machine-processable definition files. It treats the infrastructure as a software system, applying software engineering practices to manage changes to the system in a repeatable, structured and safe way.

[Wikipedia: Infrastructe_As_Code](https://en.wikipedia.org/wiki/Infrastructure_as_Code)

*My Definition of DevOps:*

> DevOps (a clipped compound of “development” and “operations”) is a *culture, movement or practice* that emphasizes the *collaboration and communication* of both software developers and other information-technology (IT) professionals while *automating the process of software delivery and infrastructure changes*. It aims at establishing a culture and environment where *building, testing, and releasing software*, can happen *rapidly, frequently, and more reliably*.

[Wikipedia: DevOps](https://en.wikipedia.org/wiki/DevOps)

So DevOps is about the union of people, process, and technology to enable continuous delivery of value to your end users.

## Why Cloud Automation

- Consistency: Standardised provisioning
- Accelerating: Rapid deployment and provisioning
- Reusability: JSON code and pipeline
- Extensibility: Extensible JSON

*Characteristics of Infrastructure as Code:*

- Declarative
- Single source of truth
- Increase repeatability and testability
- Decrease provisioning time
- Rely less on availability of persons to perform tasks
- Use proven software development practices for deploying infrastructure
- Repeatable and testable
- Faster to provision
- Idempotent provisioning and configuration (calls can be executed repeatedly while producing the same result)

## How to Cloud Automation

A practice in Infrastructure as Code is to write your definitions in a declarative way versus an imperative way.

You define the state of the infrastructure you want to have and let the system do the work on getting there. In the following sections we will have a look at tools to implement the practice.

- Version Control [Link](#version-control)
- Software Testing [Link](#software-testing)
- Declarative [Link](#declarative)

### Version Control

Enables the method track and rollback changes to your infrastructure as needed. Repositiories allow you to store the code centrally.

**Tool:**

- [Git](https://git-scm.com/)

**Repositories:**

- [Github](https://github.com/)
- [Azure DevOps](https://dev.azure.com/)

*Get Free AzureSubscription and Azure DevOps access through [Visual Studio](http://my.visualstudio.com/)*

### Software Testing

*From [Testing Fundamentals](http://softwaretestingfundamentals.com/)*
>Unit Testing is a level of software testing where individual units/ components of a software are tested.
>Integration testing is a level of software testing where individual units are combined and tested as a group. The purpose of this level of testing is to expose faults in the interaction between integrated units.

**Tools:**

- PowerShell Unittest [Pester](https://github.com/pester/Pester)
- Python Unittest [unittest](https://docs.python.org/3/library/unittest.html)

### Conventions

- tbd

### Declarative

Use templates and other resources to construct your Infrastructure as Code fast and reliable

- [Terra Form](https://www.terraform.io/)
- [Azure Resource Manager Template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)

#### Templates

Use tested and repeatable templates to quickly create and manage your infrastructure. Current tools allow you to store your own custom snippets.

- Custom snippets with [VSCode snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets), see [Custom Snippets](##TODO: INSERT LINK HERE)
- ARM templates from [Github: azure-quickstart-templates](https://github.com/Azure/azure-quickstart-templates)
- [Vscode Extension: Azure Resource Manager Templates](https://marketplace.visualstudio.com/items?itemName=samcogan.arm-snippets), open source from Sam Cogan from [azure-xplat-arm-tooling](https://github.com/Azure/azure-xplat-arm-tooling)

#### ARM Templates Syntax

```JSON
{
    "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "",
    "parameters": {  },
    "variables": {  },
    "functions": [  ],
    "resources": [  ],
    "outputs": {  }
}
```

- [Get Started Blog](https://blogs.msdn.microsoft.com/azuredev/2017/05/06/iac-on-azure-how-to-get-started-with-arm-template/)
- [Understand the structure and syntax of Azure Resource Manager Templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)
- [Quickstart: Create and deploy Azure Resource Manager templates by using the Azure portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-quickstart-create-templates-use-the-portal)

#### ARM Quick Start Templates Collection

- [Azure Quickstart Templates](https://azure.microsoft.com/en-us/resources/templates/)

### Further ARM Links

Links to dive deep into ARM templates and explorer existing infrastructure

- [Azure Resource Explorer](https://resources.azure.com/)
- [ARM Functions](https://github.com/Azure/azure-docs-json-samples/tree/master/azure-resource-manager/functions)
- [Using linked and nested templates when deploying Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-linked-templates)
- [Define the order for deploying resources in Azure Resource Manager Templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-define-dependencies)

## Conclusion

### Infrastructure as Code

- Help you to create a robust and reliable infrastructure
- Each time you deploy, the infrastructure will be exactly the same
- Easily change the resources you are using by changing code and not by changing infrastructure
- Everything should be automated to:
  - save time
  - make fewer manual configuration
  - only allow tested changes
  - ultimatly you will encounter fewer errors
- All changes in the infrastructure are accessible in source control.
- Source control gives great insight in why and what is changed and by whom.

### DevOps

- culture, movement or practice
- emphasizes collaboration and communication
- automating process of software delivery and infrastructure changes
- build, testing and releasing software

## Sources

- [softwaretestingfundamentals](http://softwaretestingfundamentals.com/)
- [docs.microsoft](https://docs.microsoft.com/en-us/azure/azure-resource-manager/)
- [wikipedia Inrastructure_as_Code](https://en.wikipedia.org/wiki/Infrastructure_as_Code)
- [wikipedia DevOps](https://en.wikipedia.org/wiki/DevOps)
- [derrickcawthon](http://derrickcawthon.com/2018/04/30/fast-start-infrastructure-as-code-using-azure-devtestlabs/)
- [openedx.microsoft](https://openedx.microsoft.com/courses/course-v1:Microsoft+DEVOPS200.2x+2018_T1/info)
- [blogs.msdn.microsoft.com/azuredev](https://blogs.msdn.microsoft.com/azuredev/2017/02/11/iac-on-azure-an-introduction-of-infrastructure-as-code-iac-with-azure-resource-manager-arm-template/)
- [blogs.msdn.microsoft.com/mvpawardprogram](https://blogs.msdn.microsoft.com/mvpawardprogram/2018/02/13/infrastructure-as-code/)
