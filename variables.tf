variable "context" {
  type = object({
    unique_short_id    = optional(string)
    environment        = optional(string)
    additional_context = optional(list(string), [])
    additional_tags    = optional(map(string), {})
  })
}
