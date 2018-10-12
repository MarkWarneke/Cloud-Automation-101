# Cloud Automation Version Control [<](03_Cloud_Automation_Advanced.md) [>](05_Cloud_Automation_Software_Testing.md)

## Table of content

- [Version Control Introduction](#version-control-introduction)
- [Version Control Tools](#version-control-tools)
    - [Git Introduction](#git-introduction)
    - [Git Installation](#git-installation)
    - [Git Common Commands](#git-common-commands)
- [Repositories](#repositories)
- [Links](#links)

## Version Control Introduction
> Version control systems are software that help you track changes you make in your code over time. As you edit to your code, you tell the version control system to take a snapshot of your files. The version control system saves that snapshot permanently so you can recall it later if you need it.
*By: Robert Outlaw* [Link](https://docs.microsoft.com/en-us/azure/devops/learn/git/what-is-version-control)

## Version Control Tools

- [Git](https://git-scm.com/)

### Git Introduction

- Find a comprehensive Git introduction on Microsoft docs [Learn Git](https://docs.microsoft.com/en-us/azure/devops/learn/git/what-is-version-control).
- Inclduing how Microsoft uses Git [How We Use Git at Microsoft](https://docs.microsoft.com/en-us/azure/devops/learn/devops-at-microsoft/use-git-microsoft).
- If you are working in a team a good branching policy is adviced, find some inspiration on [Adopt a Git branching strategy](https://docs.microsoft.com/en-us/azure/devops/repos/git/git-branching-guidance?view=vsts), also see [Cloud Automation DevOps](07_Cloud_Automation_DevOps.md).


### Git Installation

Install git via [Chocolatey](https://chocolatey.org/).

```PowerShell
choco install git
```

### Git Common Commands

Table to list the common commands used in git
They are ordered by execution flow.

| Command                                   | Description                                                                                                                                                                      |
| -- | -- |
| git status                                | Show the working tree status                                                                                                                                                     |
| git fetch                                 | Updates the local repository with all remote changes                                                                                                                             |
| git pull                                  | Fetch from and integrate with another repository or a local branch                                                                                                               |
| git branch                                | List, create, or delete branches                                                                                                                                                 |
| git branch -v -a                          | List, create, or delete branches -all -verbose (Including Remote Branches -- in case you are missing them locally)                                                               |
| Git checkout - - track origin/feature/... | Checkout specific branch -- including remote branches if you are missing them locally.Use origin/feature/<WORKITEMNUMBER_WORKITEMDESCRIPTION> (don't include the remote/ before) |
| git add .                                 | Adds all changes in the current directory (and sub directories) to the staging (need commit after)                                                                               |
| git add <PATH_TO_FILE>                    | Adds a specific file to the staging (Needs commit after)                                                                                                                         |
| git commit -am "Text"                     | Commit the changes (provide a descriptive message like "adds" ,"removes", "fixes" - those commit messages should describe the changes made)                                      |
| git push                                  | Update remote refs along with associated objects                                                                                                                                 |
A common sequence to checkin is

```Bash
git add .
git commit -am '<COMMITMESSAGE>'
git push
```

Where `add .` stages all files. `commit -am` commits **a**ll changes with a given **m**essage. And `push` changes into remote repository.

## Repositories

- [Github](https://github.com/)
- [Azure DevOps](https://dev.azure.com/)

*Get Free AzureSubscription and Azure DevOps access through [Visual Studio](http://my.visualstudio.com/)*

## Links

[**Next** Cloud Automation Software Testing](05_Cloud_Automation_Software_Testing.md)

- [Table of contents](README.md)
- [Home](../README.md)