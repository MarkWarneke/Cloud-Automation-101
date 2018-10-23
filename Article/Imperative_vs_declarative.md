# Methods
1 manual Azure Portal
2 Scripts Imperative
3 Template Declarative

## Manual
### Pro
- Browser based
- Exploration
- Visual
- Fully featured

### Cons
- Performed manually
- Error rpone
- Lack of process integration (DevOps, ITSM)

## Imperative
### Pro
- Process Integration (DevOps, ITSM)
- Less Error Prone (removes human)
- Unopionoated
- Flexible
- Testable

### Cons
- Scripting Knowledge
- Complex Logic
- Hand Build

## Declarative
### Pro
- Process Integration (DevOps, ITSM)
- Less Error Prone (removes human)
- Handles some complex logic
- state management

### Cons
- Templating Knolwdge
- Opinionated and lack of flexibility

### ARM Template
- JSON
- Tooling Visual Studion / Visual Studio Code
- Native Azure portal integration
- Generated directly from REST / Swagger

### Terra Form
- Open Source Project
- Cross computing envrionment templating language
- Provision, Update and Delte resources
- Authored in HashiCorp Configuration Language (HCL) or JSON

## Source
[Youtube: Microsoft Ignite - Cloud native Azure deployments with Terraform - BRK3306](https://www.youtube.com/watch?v=YoLV0tJ_DxE)

## Imperative Using .Net Core

[Azure management library for .NET fluent concepts](https://docs.microsoft.com/en-us/dotnet/azure/dotnet-sdk-azure-concepts?view=azure-dotnet)

>A fluent interface is a specific form of the builder pattern that creates objects through a method chain that enforces correct configuration of a resource. For example, the entry-point Azure object is created using a fluent interface

```C#
var azure = Azure
    .Configure()
    .Authenticate(credentials)
    .WithDefaultSubscription();

var sql = azure.SqlServers.Define(sqlServerName)
    .WithRegion(Region.USEast)
    .WithNewResourceGroup(rgName)
    .WithAdministratorLogin(administratorLogin)
    .WithAdministratorPassword(administratorPassword)
    .Create();
```