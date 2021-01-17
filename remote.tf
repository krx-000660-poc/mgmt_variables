# Remote state를 사용한 정보 확인 
# misO_KC_nw_vnet 작업 결과를 사용

# vnet resource group name
data "terraform_remote_state" "misO_mgmt_workspace" {
  backend = "remote"

  config = {
    hostname     = "terraform.skhynix.com"
    organization = "skhynix"
    workspaces = {
      name = "misO_mgmt_workspace"
    }
  }
}
