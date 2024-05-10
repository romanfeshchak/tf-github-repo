provider "github" {
  owner = var.GITHUB_OWNER
  token = var.GITHUB_TOKEN
}

resource "github_repository" "terraincognitus" {
  name       = var.repository_name
  visibility = var.repository_visibility
  auto_init  = true
}

data "github_repository" "terraincognitus" {
  full_name = "${var.GITHUB_OWNER}/${var.repository_name}"
}
resource "github_repository_deploy_key" "terraincognitus" {
  title      = var.public_key_openssh_title
  repository = github_repository.terraincognitus.name
  key        = var.public_key_openssh
  read_only  = false
}
