# Authoring best practices

- Camel Case
  - apiVersion instead of APIVersion
- Location
  - resourceGroup().location instead of -Location
- Tag
  - Automation create tags
- Outputs

  - Pass information for additonal automation (PowerShell best practices)
  - information to end users (publicIPs, entry points)

- Complex Variables
  - Reference assumptions by complex variables
  - use ARM template funcitons for building variables
- Concat will asume resource exists, so use resourceID if you need to depend on it

## Source

- [Youtube: Deploy Infrastructure As A Service with Azure Resource Manager Templates by Will Anderson](https://www.youtube.com/watch?v=fY62tqENNw4)
