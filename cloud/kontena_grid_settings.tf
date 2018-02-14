module "registry_gcr_us" {
  source  = "matti/external-registry/kontena"
  version = "0.0.2"

  depends_id = "${module.platform.id}"
  url        = "https://us.gcr.io"
  username   = "_json_kex"
  email      = "invalid@example.com"
  password   = "asdfasdfsafd"
}

module "certificate_registration" {
  source  = "matti/certificate-registration/kontena"
  version = "0.0.1"

  depends_id = "${module.additional_nodes.id}"
  email      = "wat@mailinator.com"
}
