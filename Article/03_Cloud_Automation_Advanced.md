# Cloud Automation Advanced [<](02_Cloud_Automation_Basics.md) [>](04_Cloud_Automation_Version_Control.md)

## Table of content

- [Cloud Automation Advanced < >](#cloud-automation-advanced--)
    - [Table of content](#table-of-content)
    - [Error Handling](#error-handling)
    - [Azure Log Analytics Integration](#azure-log-analytics-integration)
    - [Chat Ops](#chat-ops)
    - [Links](#links)

## Error Handling

The deployment log of an ARM template deployment can be access by the `Get-AzureRMLog` function.

```PowerShell
$ResourceGroupName = 'deploymentGroupName'
$correlationId = ((Get-AzureRMLog -x $ResourceGroupName)[0]).CorrelationId
$logentry = (Get-AzureRMLog -CorrelationId $correlationId -DetailedOutput)

#$logentry
$rawStatusMessage = $logentry.Properties
$status = $rawStatusMessage.Content.statusMessage | ConvertFrom-Json
$status.error.details
$status.error.details.details
```

## Azure Log Analytics Integration

Logs into Operations Management Suite (OMS) Log Analytics
TODO: Add setup and further description

## Chat Ops

See Runbook gallery Slack Webhook

## Links

[**Next** Cloud Automation Version Control](04_Cloud_Automation_Version_Control.md)

- [Table of contents](README.md)
- [Home](../README.md)