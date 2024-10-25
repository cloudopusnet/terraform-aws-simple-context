<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_context"></a> [context](#input\_context) | Context Object<br/>- unique\_short\_id for uniquely identifiable prefix<br/>- environment for a dedicated environment like (dev, staging, uat, prov, pr-x)<br/>- additional\_context list of strings to specify to include in the context<br/>- additional\_tags map of tags to be added | <pre>object({<br/>    unique_short_id    = optional(string)<br/>    environment        = optional(string)<br/>    additional_context = optional(list(string), [])<br/>    additional_tags    = optional(map(string), {})<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_context"></a> [context](#output\_context) | constructed context |
| <a name="output_tags"></a> [tags](#output\_tags) | constructed context tags |
<!-- END_TF_DOCS -->