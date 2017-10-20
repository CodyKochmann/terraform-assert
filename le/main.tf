resource "null_resource" "checker" {
  provisioner "local-exec" {
    command = "echo 'Condition failed. Actual: \"${var.actual}\" expected to be lesser or equal than \"${var.expected}\"' && exit 1"
  }

  count = "${var.actual <= var.expected ? 0 : 1}"
}
