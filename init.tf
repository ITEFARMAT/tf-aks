terraform {
  # this values has to be hardcoded
  # variables are not allowed here
   backend "azurerm" {
    resource_group_name              = #provide RG where is bucket located
    storage_account_name             = #provide SA
    container_name                   = # container name
    key                              =
    access_key                       =
  }
}
