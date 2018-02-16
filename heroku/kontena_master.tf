module "heroku_master" {
  source  = "matti/heroku-master/kontena"
  version = "0.0.1"

  app_name            = "${var.heroku_app_name}"
  heroku_organization = "${var.heroku_organization}"
}

module "grid" {
  source  = "matti/grid/kontena"
  version = "0.1.0"

  depends_id   = "${module.heroku_master.id}"
  initial_size = 3

  name  = "test"
  token = "asdfasdfasdfasdfasdf"
}

output "heroku_hostname" {
  value = "${module.heroku_master.heroku_hostname}"
}
