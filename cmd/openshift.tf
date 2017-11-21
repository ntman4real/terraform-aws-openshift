module "openshift" {
  source             = "../modules/openshift"
  public_subnet_ids  = ["${module.vpc.external_subnets}"]
  private_subnet_ids = ["${module.vpc.internal_subnets}"]
  vpc_id             = "${module.vpc.id}"
  admin_ssh_key      = "${var.admin_ssh_key}"
  management_net     = "${chomp(data.http.workstationip.body)}/32"
  public_domain      = "${var.public_domain}"
}
