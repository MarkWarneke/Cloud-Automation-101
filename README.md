# Cloud-Automation-101

 Introduction to Cloud Automation, Azure DevOps, Infrastructure As Code (IaC), PowerShell, Azure Resource Manager (ARM), Unit-Testing with Pester, CI/CD Pipeline with Azure DevOps and more!

You can find detailed descirption of the topic in the [Article](Article) and Demonstrations in the [Code](Code).

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
- [wikipedia Inrastructure_as_Code](https://en.wikipedia.org/wiki/Infrastructure_as_Code)
- [wikipedia DevOps](https://en.wikipedia.org/wiki/DevOps)
- [derrickcawthon](http://derrickcawthon.com/2018/04/30/fast-start-infrastructure-as-code-using-azure-devtestlabs/)
- [openedx.microsoft](https://openedx.microsoft.com/courses/course-v1:Microsoft+DEVOPS200.2x+2018_T1/info)
- [blogs.msdn.microsoft.com/azuredev](https://blogs.msdn.microsoft.com/azuredev/2017/02/11/iac-on-azure-an-introduction-of-infrastructure-as-code-iac-with-azure-resource-manager-arm-template/)
- [blogs.msdn.microsoft.com/mvpawardprogram](https://blogs.msdn.microsoft.com/mvpawardprogram/2018/02/13/infrastructure-as-code/)

## Contact

Contact me!

- [twitter mark_mit_k_](https://twitter.com/mark_mit_k_)
- [mail](mailto:mark.warneke@microsoft.com)