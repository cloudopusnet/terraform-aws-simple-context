locals {
  # filtering out null values
  _context_list = compact(flatten([var.context.unique_short_id, var.context.environment, var.context.additional_context]))
  # concatenating the list if there are elements otherwise return null
  context = length(local._context_list) > 0 ? join("-", local._context_list) : null
}

locals {
  # Constructing tags from context values
  _context_tags = {
    UniqueShortId = var.context.unique_short_id
    Environment   = var.context.environment
    Context       = local.context
  }

  # Dropping null value key-pairs
  _context_tags_filtered = { for k, v in local._context_tags : k => v if v != null }

  # Merging the tags from the context and the input tags
  tags = merge(local._context_tags_filtered, var.context.additional_tags)
}
