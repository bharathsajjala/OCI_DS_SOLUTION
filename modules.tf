module "compartment" {
  count = var.compartment_is_deployed ? 1 : 0
  source = "./modules/compartment"
  # configuration
  compartment_description = var.compartment_description
  compartment_name = local.compartment_name
  parent_compartment_id = local.parent_compartment_id
  enable_delete = var.enable_delete
  compartment_group_is_deployed = var.compartment_group_is_deployed
  compartment_group_name = local.compartment_group_name
  compartment_group_description = var.compartment_group_description
  compartment_policy_is_deployed = var.compartment_policy_is_deployed
  compartment_policy_name = local.compartment_policy_name
  compartment_policy_description = var.compartment_policy_description
  compartment_policy_statement_substring = local.compartment_policy_statement_substring
  tenancy_ocid = var.tenancy_ocid
}

module "vcn" {
  count = var.vcn_is_deployed ? 1 : 0
  source = "./modules/vcn"
  # configuration
  vcn_display_name = local.vcn_display_name
  vcn_dns_label = local.vcn_dns_label
  ng_display_name = local.ng_display_name
  sg_display_name = local.sg_display_name
  vcn_cidrs = var.vcn_cidrs
  compartment_id = local.compartment_id
  service_id = data.oci_core_services.services.services.0.id
  vcn_group_is_deployed = var.vcn_group_is_deployed
  vcn_group_name = local.vcn_group_name
  vcn_group_description = var.vcn_group_description
  vcn_policy_is_deployed = var.vcn_policy_is_deployed
  vcn_policy_name = local.vcn_policy_name
  vcn_policy_description = var.vcn_policy_description
  compartment_policy_statement_substring = local.compartment_policy_statement_substring
  tenancy_ocid = var.tenancy_ocid
}

module "ods" {
  depends_on = [module.vcn]
  count = var.vcn_is_deployed && var.ods_is_deployed ? 1 : 0
  source = "./modules/ods"
  # configuration
  project_display_name = local.project_display_name
  notebook_session_display_name = local.notebook_session_display_name
  notebook_session_notebook_session_configuration_details_shape = var.notebook_session_notebook_session_configuration_details_shape
  notebook_session_notebook_session_configuration_details_block_storage_size_in_gbs = var.notebook_session_notebook_session_configuration_details_block_storage_size_in_gbs
  ods_rt_display_name = local.ods_rt_display_name
  ods_sl_display_name = local.ods_sl_display_name
  ods_subnet_display_name = local.ods_subnet_display_name
  ods_subnet_dns_label = local.ods_subnet_dns_label
  ods_subnet_cidr = var.ods_subnet_cidr
  compartment_id = local.compartment_id
  vcn_id = module.vcn[0].vcn_id
  vcn_default_dhcp_options_id = module.vcn[0].vcn_default_dhcp_options_id
  ng_id = module.vcn[0].ng_id
  sg_id = module.vcn[0].sg_id
  service_cidr_block = data.oci_core_services.services.services.0.cidr_block
  tenancy_ocid = var.tenancy_ocid
  user_ocid = local.user_ocid
  ods_group_is_deployed = var.ods_group_is_deployed
  ods_group_name = local.ods_group_name
  ods_group_description = var.ods_group_description
  ods_dynamic_group_is_deployed = var.ods_dynamic_group_is_deployed
  ods_dynamic_group_name = local.ods_dynamic_group_name
  ods_dynamic_group_description = var.ods_dynamic_group_description
  ods_policy_is_deployed = var.ods_policy_is_deployed
  ods_policy_name = local.ods_policy_name
  ods_policy_description = var.ods_policy_description
  compartment_policy_statement_substring = local.compartment_policy_statement_substring
}

module "bucket" {
  count = var.bucket_is_deployed ? 1 : 0
  source = "./modules/bucket"
  # configuration
  bucket_name = local.bucket_name
  bucket_access_type = var.bucket_access_type
  bucket_storage_tier = var.bucket_storage_tier
  bucket_versioning = var.bucket_versioning
  objectstorage_namespace = data.oci_objectstorage_namespace.namespace.namespace
  compartment_id = local.compartment_id
  bucket_group_is_deployed = var.bucket_group_is_deployed
  bucket_group_name = local.bucket_group_name
  bucket_group_description = var.bucket_group_description
  bucket_policy_is_deployed = var.bucket_policy_is_deployed
  bucket_policy_name = local.bucket_policy_name
  bucket_policy_description = var.bucket_policy_description
  compartment_policy_statement_substring = local.compartment_policy_statement_substring
  tenancy_ocid = var.tenancy_ocid
}

