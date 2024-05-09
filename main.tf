provider "github" {
  owner = var.GITHUB_OWNER
  token = var.GITHUB_TOKEN
}

resource "github_repository" "terraincognitus" {
  name       = var.repository_name
  visibility = var.repository_visibility
  auto_init  = true
}

resource "github_repository_deploy_key" "terraincognitus" {
  title      = var.public_key_openssh_title
  repository = github_repository.terraincognitus.name
  key        = var.public_key_openssh
  read_only  = false
}