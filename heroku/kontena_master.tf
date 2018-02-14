module "heroku_master" {
  source  = "matti/heroku-master/kontena"
  version = "0.0.1"

  app_name            = "${var.heroku_app_name}"
  heroku_organization = "appgyver"
}
