variable "context" {
  description = <<-EOF
    Context Object
    - unique_short_id for uniquely identifiable prefix
    - environment for a dedicated environment like (dev, staging, uat, prov, pr-x)
    - additional_context list of strings to specify to include in the context
    - additional_tags map of tags to be added
  EOF
  type = object({
    unique_short_id    = optional(string)
    environment        = optional(string)
    additional_context = optional(list(string), [])
    additional_tags    = optional(map(string), {})
  })
}
