module "stack_ingress_lb" {
  source  = "matti/stack/kontena"
  version = "0.0.1"

  depends_id = "${module.additional_nodes.id}"
  name       = "ingress"
  stack      = "kontena/ingress-lb"
}
