provider "tfe" {
  hostname = "terraform.skhynix.com"
  #token    = "${var.token}"
  token = var.core.user_token
}
