# Cloud-Automation-101

Introduction to Cloud Automation, Azure DevOps, Infrastructure As Code (IaC), PowerShell, Azure Resource Manager (ARM), Unit-Testing with Pester, CI/CD Pipeline with Azure DevOps and more!

You can find detailed description of the topic in the [Article](Article) and Demonstrations in the [Code](Code). Also you can find a detailed example to guide you through a Infrastructure as Code example in [Workshop](Workshop)

- Link to [Article](Article)
- Link to [Code](Code)
- Link to [Workshop](Workshop)

## What is Cloud Automation

_My Definition of Infrastructure as Code:_

> Infrastructure as Code (IaC) is the management of infrastructure in a descriptive model, using the same versioning as DevOps team uses for source code. Like the principle that the same source code generates the same binary, an IaC model generates the same environment every time it is applied

[Docs](https://docs.microsoft.com/en-us/azure/devops/learn/what-is-infrastructure-as-code)

_My Definition of DevOps:_

> DevOps is the union of people, process, and products to enable continuous delivery of value to our end users. The contraction of “Dev” and “Ops” refers to replacing siloed Development and Operations to create multidisciplinary teams that now work together with shared and efficient practices and tools. Essential DevOps practices include agile planning, continuous integration, continuous delivery, and monitoring of applications.

[Docs](https://docs.microsoft.com/en-us/azure/devops/learn/what-is-devops)

So DevOps is about the union of people, process, and technology to enable continuous delivery of value to your end users.

## Why Cloud Automation

- Consistency: Standardised provisioning
- Accelerating: Rapid deployment and provisioning
- Reusability: JSON code and pipeline
- Extensibility: Extensible JSON

_Characteristics of Infrastructure as Code:_

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

- [Version Control](Article/04_Cloud_Automation_Version_Control.md)
- [Software Testing](Article/05_Cloud_Automation_Software_Testing.md)
- [Declarative](Article/06_Cloud_Automation_Declarative.md)

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
- [What is Infrastructure as Code](https://docs.microsoft.com/en-us/azure/devops/learn/what-is-infrastructure-as-code)
- [What is DevOps?](https://docs.microsoft.com/en-us/azure/devops/learn/what-is-devops)
- [derrickcawthon](http://derrickcawthon.com/2018/04/30/fast-start-infrastructure-as-code-using-azure-devtestlabs/)
- [openedx.microsoft](https://openedx.microsoft.com/courses/course-v1:Microsoft+DEVOPS200.2x+2018_T1/info)
- [blogs.msdn.microsoft.com/azuredev](https://blogs.msdn.microsoft.com/azuredev/2017/02/11/iac-on-azure-an-introduction-of-infrastructure-as-code-iac-with-azure-resource-manager-arm-template/)
- [blogs.msdn.microsoft.com/mvpawardprogram](https://blogs.msdn.microsoft.com/mvpawardprogram/2018/02/13/infrastructure-as-code/)
- [blogs.msdn.microsoft.com/mvpawardprogram](https://blogs.msdn.microsoft.com/mvpawardprogram/2018/05/01/azure-resource-manager/)

## Contact

Contact me!

- [twitter mark*mit_k*](https://twitter.com/mark_mit_k_)
- [mail](mailto:mark.warneke@microsoft.com)
