# Authentication
variable "tenancy_ocid" { default = "" }
variable "user_ocid" { default = "" }
variable "fingerprint" { default = "" }
variable "private_key_path" { default = "" }
variable "region" { default = "us-ashburn-1" }
variable "current_user_ocid" { default = "" } # current_user_ocid can be left unused for Terraform deployment. It is only used during Resource Manager deployment.

# Required Input
variable "analytics_instance_idcs_access_token" { default = "" }

# Naming
variable "suffix" { default = "DEFAULT_REGION_KEY" }

# Compartment
variable "compartment_is_deployed" { default = true }
variable "compartment_description" { default = "Compartment for Lakehouse Pipeline" }
variable "compartment_name" { default = "Lakehouse" }
variable "compartment_id" { default = "DEFAULT_TENANCY" }
variable "parent_compartment_id" { default = "DEFAULT_TENANCY" } # if compartment_is_deployed == true, then parent_compartment_id is used in the place of compartment_id
variable "enable_delete" { default = false }
variable "compartment_group_is_deployed" { default = false }
variable "compartment_group_name" { default = "CompartmentGroup" }
variable "compartment_group_description" { default = "Group for users who manage Compartment-related operations." }
variable "compartment_policy_is_deployed" { default = false }
variable "compartment_policy_name" { default = "CompartmentPolicy" }
variable "compartment_policy_description" { default = "Collection of policy statements that grant permissions for user groups, dynamic groups, and services." }

# VCN
variable "vcn_is_deployed" { default = true }
variable "vcn_display_name" { default = "VCN" }
variable "vcn_dns_label" { default = "vcn" }
variable "ng_display_name" { default = "NAT Gateway" }
variable "sg_display_name" { default = "Service Gateway" }
variable "vcn_cidrs" {
  type = list(string)
  default = ["10.0.0.0/16"]
}
variable "vcn_group_is_deployed" { default = false }
variable "vcn_group_name" { default = "terraform-VirtualCloudNetworkGroup" }
variable "vcn_group_description" { default = "Group for users who manage Virtual-Cloud-Network-related operations." }
variable "vcn_policy_is_deployed" { default = false }
variable "vcn_policy_name" { default = "VirtualCloudNetworkPolicy" }
variable "vcn_policy_description" { default = "Collection of policy statements that grant permissions for user groups, dynamic groups, and services." }

# ODS
variable "ods_is_deployed" { default = true }
variable "project_display_name" { default = "ODS Project" }
variable "notebook_session_display_name" { default = "Notebook Session" }
variable "notebook_session_notebook_session_configuration_details_shape" { default = "VM.Standard2.1" }
variable "notebook_session_notebook_session_configuration_details_block_storage_size_in_gbs" { default = 50 }
variable "ods_rt_display_name" { default = "ODS Route Table" }
variable "ods_sl_display_name" { default = "ODS Security List" }
variable "ods_subnet_display_name" { default = "ODS Subnet" }
variable "ods_subnet_dns_label" { default = "ods-sub" }
variable "ods_subnet_cidr" { default = "10.0.0.0/24" }
variable "ods_group_is_deployed" { default = false }
variable "ods_group_name" { default = "terraform-DataScienceGroup" }
variable "ods_group_description" { default = "Group for users who manage Data-Science-related operations." }
variable "ods_dynamic_group_is_deployed" { default = false }
variable "ods_dynamic_group_name" { default = "DataScienceDynamicGroup" }
variable "ods_dynamic_group_description" { default = "Group defined by a rule that matches particular resource-types within a given compartment." }
variable "ods_policy_is_deployed" { default = false }
variable "ods_policy_name" { default = "terraform-DataSciencePolicy" }
variable "ods_policy_description" { default = "Collection of policy statements that grant permissions for user groups, dynamic groups, and services." }

# Bucket
variable "bucket_is_deployed" { default = true }
variable "bucket_name" { default = "terraform-Bucket" }
variable "bucket_access_type" { default = "NoPublicAccess" }
variable "bucket_storage_tier" { default = "Standard" }
variable "bucket_versioning" { default = "Disabled" }
variable "bucket_group_is_deployed" { default = false }
variable "bucket_group_name" { default = "terraform-BucketGroup" }
variable "bucket_group_description" { default = "Group for users who manage Bucket-related operations." }
variable "bucket_policy_is_deployed" { default = false }
variable "bucket_policy_name" { default = "terraform-BucketPolicy" }
variable "bucket_policy_description" { default = "Collection of policy statements that grant permissions for user groups, dynamic groups, and services." }