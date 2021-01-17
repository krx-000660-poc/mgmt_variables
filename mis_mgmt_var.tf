locals {
  common_variables = {
   client_id="43ffce50-fbb6-490c-9b53-bebcc0951177"
   client_secret=".p5MhbGR8lT.Ns.y5Da-quv3jJM__02rK6"
   subscription_id="e85c4805-41db-4f50-9013-b7ea21a1f5e2"
   tenant_id="4784a18d-d34d-47d9-afb0-87b086bf01a8"
  }
}

data "tfe_workspace_ids" "misO_ws_all" {
  #names        = ["misO_KC_*"]
  #names        = ["misO_KC_nw_vnet","misO_KC_nw_vnet_peering","misO_KC_inf_aks","misO_KC_inf_acr","misO_KC_inf_eai","misO_KC_inf_hp",  "misO_KC_inf_fscp","misO_KC_inf_rsv","misO_KC_inf_rsvbp","misO_KC_inf_mgmt"]
  names = data.terraform_remote_state.misO_mgmt_workspace.outputs.ws_names
 
  organization = var.core.org
}



resource "tfe_variable" "misO_tf_workspaces_variable_subscription_id" {
  for_each     = data.tfe_workspace_ids.misO_ws_all.*[0].external_ids
  key          = "ARM_SUBSCRIPTION_ID"
  value        = local.common_variables.subscription_id
  category     = "env"
  workspace_id = each.value
  description  = "ARM_SUBSCRIPTION_ID"
}

resource "tfe_variable" "misO_tf_workspaces_variable_client_id" {
  for_each     = data.tfe_workspace_ids.misO_ws_all.*[0].external_ids
  key          = "ARM_CLIENT_ID"
  value        = local.common_variables.client_id
  category     = "env"
  workspace_id = each.value
  description  = "ARM_CLIENT_ID"
}


resource "tfe_variable" "misO_tf_workspaces_variable_client_secret" {
  for_each     = data.tfe_workspace_ids.misO_ws_all.*[0].external_ids
  key          = "ARM_CLIENT_SECRET"
  value        = local.common_variables.client_secret
  category     = "env"
  workspace_id = each.value
  sensitive = true
  description  = "ARM_CLIENT_SECRET"
}

resource "tfe_variable" "misO_tf_workspaces_variable_tenant_id" {
  for_each     = data.tfe_workspace_ids.misO_ws_all.*[0].external_ids
  key          = "ARM_TENANT_ID"
  value        = local.common_variables.tenant_id
  category     = "env"
  workspace_id = each.value
  description  = "ARM_TENANT_ID"
}
