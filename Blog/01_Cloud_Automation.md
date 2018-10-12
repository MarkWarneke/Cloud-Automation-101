# Cloud Automation Theory

## Table of content

- Objectives
- Cloud Automation Theory
- Idempotence
- Approach
- Type
- Goal
- Common automation tasks

## Objectives

- Understand Cloud Automation Theory
- Implement, configure, and apply Azure Resource Manager templates.
- Use source control for configurations, and integrate Infrastructure as Code into the deployment pipeline.

## Introduction Cloud Automation Theory

Distinguish between:

- Provisioning
- Configuration

**Provisioning** Runbook (PowerShell)


**Configuration** Desired State

## Idempotence

Idempotence is a principle of Infrastructure as Code.

>Idempotence is the property where a deployment command always sets the target environment into the same configuration, regardless of the environment’s starting state.

*Idempotency* is achieved by either automatically configuring an existing target or by discarding the existing target and recreating a fresh environment.

It saves time and increases the reliability of regular administrative tasks, and even schedules them to be automatically performed at regular intervals.
You can automate processes using runbooks or automate configuration management by using Desired State Configuration

## Approach

There are two types of approaches to Infrastructure as Code:

> Declarative (functional) and imperative (procedural).

The *declarative* approach states “what” the final state should be. When run, the script or definition will initialize or configure the machine to have the finished state that was declared.

In the *imperative* approach, the script states the “how” for the final state of the machine by executing through the steps to get to the finished state.

## Type

There are also two types of methods in Infrastructure as Code:

> push and pull methods.

In the *pull* method, the machines configured will pull the configuration from a controlling server, such as a master server.

In the *push* method, the controlling or master server will push the configuration to the target machines. Some organizations may benefit from Infrastructure as Code frameworks such as PowerShell DSC.

## Goal

> The goal of IaC is to create a *build process* that creates *consistent infrastructure* and *deploys the application*.

Changes are committed, and the build process spins up a new server and deploys the application. This means that testing is always performed on a clean machine with a known configuration. It’s possible with source control to create several builds, such as development, test, and production, and to choose which one to target.

## Common automation tasks

- **Disaster recovery.** Deploy new instances of Azure resources quickly within an alternative Azure datacenter after a disaster occurs. Resources might include Azure virtual machines (VMs), virtual networks, or cloud services, in addition to database servers.
- **Provisioning.** Perform initial and subsequent provisioning of a complete deployment, for example, a virtual network, where you assign VMs to it, create cloud services, and join the services to the same virtual network.
- **State management.** Apply DSC to manage the state of your machines.
- **Running backups.** Azure Automation is very helpful for running regular backups of non-database systems, such as backing up Blob storage at certain intervals.
- **Deploying patches.** Azure Automation allows you to develop a runbook to manage the updates at scheduled times to manage patch remediation. Ensure machines continually align with configured security policy.

## Source

[openedx.microsoft - DEVOPS200](
https://openedx.microsoft.com/courses/course-v1:Microsoft+DEVOPS200.2x+2018_T1/info)