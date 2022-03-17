#provider "oci" {
  #user_ocid        = "ocid1.user.oc1..aaaaaaaabkdp6ctxycivjxz7bdwknf36emr6zuqblkudvkaot5hes263gvca"
  #fingerprint      = "4d:4f:45:2f:d9:13:e6:05:3c:41:dc:78:fd:19:3f:62"
 # tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaa25c5a2zpfki3wo4ofza5l72aehvwkjbuavpnzqtmr4nigdgzi57a"
  #region           = "us-ashburn-1"
 # private_key_path = "/Users/sajjala/.oci/oci_api_key.pem"
#}

provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key_path     = var.private_key_path
  region               = var.region
  disable_auto_retries = true
}