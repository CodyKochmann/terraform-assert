terraform {
  required_version = ">= 0.12.0"
}

resource "null_resource" "checker" {
  provisioner "local-exec" {
    command = "echo 'ASSERTION ERROR - ${var.message}' && exit 1"
  }

  count = var.condition ? 0 : 1
}
