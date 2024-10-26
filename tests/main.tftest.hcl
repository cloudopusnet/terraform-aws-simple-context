run "validate_context" {

  command = plan

  variables {
    context = {
      unique_short_id    = "CLOUDOPUS"
      environment        = "prod"
      additional_context = ["test"]
      additional_tags = {
        Product = "Terraform Module"
      }
    }
  }

  assert {
    condition     = output.context == "CLOUDOPUS-prod-test"
    error_message = "Context output error"
  }

  assert {
    condition = output.tags.Context == "CLOUDOPUS-prod-test"
    error_message = "Context output error"
  }

  assert {
    condition = output.tags.UniqueShortId == "CLOUDOPUS"
    error_message = "Context output error"
  }

  assert {
    condition = output.tags.Environment == "prod"
    error_message = "Context output error"
  }

  assert {
    condition = output.tags.Product == "Terraform Module"
    error_message = "Context output error"
  }
}

run "validate_context_with_minimal_values" {

  command = plan

  variables {
    context = {
      additional_tags = {
        Product = "Terraform Module"
      }
    }
  }

  assert {
    condition     = output.context == null
    error_message = "Context output error"
  }

  assert {
    condition = provider::assert::key("Product", output.tags)
    error_message = "Context output error"
  }

  assert {
    condition     = provider::assert::key("Context", output.tags) == false
    error_message = "Context output error"
  }

  assert {
    condition     = provider::assert::key("Environment", output.tags) == false
    error_message = "Context output error"
  }

  assert {
    condition     = provider::assert::key("UniqueShortId", output.tags) == false
    error_message = "Context output error"
  }
}
