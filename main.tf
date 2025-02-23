terraform {
  required_version = ">= 1.5.0"
  backend "local" {}  # Use local backend for testing
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

# Example usage of provisioners (not recommended for production)
resource "null_resource" "test_cleanup" {
  provisioner "local-exec" {
    command = "echo Test environment created!"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo Cleaning up test resources!"
  }
}
