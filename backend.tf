terraform {
  backend "remote" {
    hostname     = "terraform.skhynix.com"
    organization = "skhynix"

    workspaces {
      name = "misO_mgmt_variables"
    }
  }
}
