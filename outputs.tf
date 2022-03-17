
output "bucket_id" {
  value = var.bucket_is_deployed ? module.bucket[0].bucket_id : null
}
output "compartment_id" {
  value = local.compartment_id
}

output "ods_notebook_session_id" {
  value = var.ods_is_deployed ? module.ods[0].ods_notebook_session_id : null
}

output "vcn_id" {
  value = var.vcn_is_deployed ? module.vcn[0].vcn_id : null
}