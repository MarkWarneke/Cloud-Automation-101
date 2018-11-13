## Recommendations

- Minimize your use of parameters. Whenever possible, use a variable or a literal value. Use parameters only for these scenarios:

  - Settings that you want to use variations of according to environment (SKU, size, capacity).
  - Resource names that you want to specify for easy identification.
  - Values that you use frequently to complete other tasks (such as an admin user name).
  - Secrets (such as passwords).
  - The number or array of values to use when you create multiple instances of a resource type.

- Use camel case for parameter names.
- Provide a description of every parameter in the metadata
- Define default values for parameters (except for passwords and SSH keys). By providing a default value, the parameter becomes optional during deployment. The default value can be an empty string.
- Avoid using a parameter or variable for the API version for a resource type.

## Sources

-[Docs: parameters](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-templates-parameters)
