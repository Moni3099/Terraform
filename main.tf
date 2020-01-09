provider "google" {
  project     = "${var.var_project}"
}
module "vpc" {
  source                  = "./modules/vpc"
  network_name            = "${var.vpc_name}"
  region                  = "${var.region}"
  project_id              = "{var.project_id}"
  }

/******************************************
	Instance configuration
 *****************************************/
module "instance" {
  source           = "./modules/instance"
  network_name     = "${module.vpc.network_name}"
}
