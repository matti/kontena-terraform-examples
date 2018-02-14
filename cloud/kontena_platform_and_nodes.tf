module "platform" {
  source  = "matti/cloud-platform/kontena"
  version = "0.1.1"

  organization = "${var.cloud_organization}"
  name         = "${var.platform_name}"
  type         = "standard"
  region       = "eu-west-1"
  initial_size = 3
}

module "initial_nodes" {
  source  = "matti/cloud-nodes/kontena"
  version = "0.1.0"

  depends_id = "${module.platform.id}"
  count      = 3
  type       = "k1"
}

module "additional_nodes" {
  source  = "matti/cloud-nodes/kontena"
  version = "0.1.0"

  depends_id = "${module.initial_nodes.id}"
  count      = 2
  type       = "k1"
}
