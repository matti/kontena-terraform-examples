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
  envs       = ["MYSQL_ROOT_PASSWORD=example"]
}
