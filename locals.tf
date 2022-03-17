locals {
# variables that help adjust for input value regulations for certain variables
max_length_dns_label = 14
max_length_autonomous_database_db_name = 14
max_length_analytics_instance_name = 14
max_length_bucket_name = 14
max_length_ods_subnet_dns_label = 12
max_length_odi_subnet_dns_label = 12
max_length_vcn_dns_label = 12
max_length_compartment_name = 12
abbrev_suffix_length = 3

# Terraform user: user_ocid, Resource Manager user: current_user_ocid
user_ocid = var.user_ocid == "" ? var.current_user_ocid : var.user_ocid

# Naming
region_key = lower(data.oci_identity_regions.available_regions.regions.0.key)

suffix_1 = replace(var.suffix, "DEFAULT_REGION_KEY", local.region_key)
suffix_for_global_resources_1 = replace(var.suffix, "DEFAULT_REGION_KEY", "")

suffix_2 = replace(local.suffix_1, "/[^A-Za-z0-9]/", "")
suffix_for_global_resources_2 = replace(local.suffix_for_global_resources_1, "/[^A-Za-z0-9]/", "")

suffix = local.suffix_2 == "NONE" ? "" : substr(local.suffix_2, 0, local.abbrev_suffix_length)
suffix_for_global_resources = local.suffix_for_global_resources_2 == "NONE" ? "" : substr(local.suffix_for_global_resources_2, 0, local.abbrev_suffix_length)

# Compartment
parent_compartment_id = var.parent_compartment_id == "DEFAULT" ? var.tenancy_ocid : var.parent_compartment_id
compartment_id_1 = var.compartment_id == "DEFAULT" ? var.tenancy_ocid : var.compartment_id
compartment_id = var.compartment_is_deployed ? module.compartment[0].compartment_id_new_compartment : local.compartment_id_1
compartment_policy_statement_substring = data.oci_identity_compartment.compartment.name == data.oci_objectstorage_namespace.namespace.namespace ? "tenancy" : "compartment id ${local.compartment_id}"
compartment_name_1 = replace(var.compartment_name, "/[^A-Za-z0-9]/", "")
compartment_name_2 = substr(local.compartment_name_1, 0, local.max_length_compartment_name - local.abbrev_suffix_length)
compartment_name = "${local.compartment_name_2}${local.suffix_for_global_resources}"
compartment_group_name = "${var.compartment_group_name}${local.suffix_for_global_resources}"
compartment_policy_name = "${var.compartment_policy_name}${local.suffix_for_global_resources}"

# VCN
vcn_display_name = "${var.vcn_display_name} ${local.suffix}"
vcn_dns_label_1 = replace(var.vcn_dns_label, "/[^A-Za-z0-9]/", "")
vcn_dns_label_2 = substr(local.vcn_dns_label_1, 0, local.max_length_vcn_dns_label - local.abbrev_suffix_length)
vcn_dns_label = "${local.vcn_dns_label_2}${local.suffix}"
ng_display_name = "${var.ng_display_name} ${local.suffix}"
sg_display_name = "${var.sg_display_name} ${local.suffix}"
vcn_group_name = "${var.vcn_group_name}${local.suffix_for_global_resources}"
vcn_policy_name = "${var.vcn_policy_name}${local.suffix_for_global_resources}"

# ODS
project_display_name = "${var.project_display_name} ${local.suffix}"
notebook_session_display_name = "${var.notebook_session_display_name} ${local.suffix}"
ods_rt_display_name = "${var.ods_rt_display_name} ${local.suffix}"
ods_sl_display_name = "${var.ods_sl_display_name} ${local.suffix}"
ods_subnet_display_name = "${var.ods_subnet_display_name} ${local.suffix}"
ods_subnet_dns_label_1 = replace(var.ods_subnet_dns_label, "/[^A-Za-z0-9]/", "")
ods_subnet_dns_label_2 = substr(local.ods_subnet_dns_label_1, 0, local.max_length_ods_subnet_dns_label - local.abbrev_suffix_length)
ods_subnet_dns_label = "${local.ods_subnet_dns_label_2}${local.suffix}"
ods_group_name = "${var.ods_group_name}${local.suffix_for_global_resources}"
ods_dynamic_group_name = "${var.ods_dynamic_group_name}${local.suffix_for_global_resources}"
ods_policy_name = "${var.ods_policy_name}${local.suffix_for_global_resources}"


# Bucket
bucket_name_1 = replace(var.bucket_name, "/[^A-Za-z0-9]/", "")
bucket_name_2 = replace(local.bucket_name_1, "/(^[0-9][a-zA-Z0-9]*)/", "BKT$1")
bucket_name_3 = substr(local.bucket_name_2, 0, local.max_length_bucket_name - local.abbrev_suffix_length)
bucket_name = "${local.bucket_name_3}${local.suffix}"
bucket_group_name = "${var.bucket_group_name}${local.suffix_for_global_resources}"
bucket_policy_name = "${var.bucket_policy_name}${local.suffix_for_global_resources}"

}