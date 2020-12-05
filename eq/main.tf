terraform {
  required_version = ">= 0.12.0"
}

resource "null_resource" "checker" {
  provisioner "local-exec" {
    command = "echo 'Condition failed. Expected: \"${var.expected}\" actual: \"${var.actual}\"' && exit 1"
  }

  count = var.expected == var.actual ? 0 : 1
}
