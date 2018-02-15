module "service_redis" {
  source  = "matti/service/kontena"
  version = "0.2.1"

  depends_id = "${module.additional_nodes.id}"
  name       = "redish"
  image      = "redis"
  instances  = 3
}

module "service_mysql" {
  source  = "matti/service/kontena"
  version = "0.2.1"

  depends_id = "${module.additional_nodes.id}"
  name       = "muesli"
  image      = "mysql"
  instances  = 1
  stateful   = true

  envs = [
    "MYSQL_ROOT_PASSWORD=example",
  ]
}

module "nodes" {
  source  = "matti/nodes-outputs/kontena"
  version = "0.0.1"

  depends_id = "${module.additional_nodes.id}"
}

module "service_whoami" {
  source  = "matti/service/kontena"
  version = "0.2.1"

  depends_id = "${module.stack_ingress_lb.id}"
  name       = "whoami"
  image      = "jwilder/whoami"

  envs = [
    "KONTENA_LB_VIRTUAL_HOSTS=${element(module.nodes.public_ips,0)}.xip.io",
    "KONTENA_LB_INTERNAL_PORT=8000",
  ]

  instances = 3
  links     = ["ingress/lb"]
}

output "intial_nodes" {
  value = "${module.initial_nodes.names}"
}
