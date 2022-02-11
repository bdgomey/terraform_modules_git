variable "storage_account_name" {
  type = string
}
variable "storage_account_resource_group_name" {
  type = string
}
variable "storage_account_location" {
  type = string
}
variable "storage_account_account_tier" {
  type = string
}
variable "storage_account_account_replication_type" {
  type = string
}
variable "tags" {
  type = map(string)
}

