# locals {
#   # instance_count       = "${var.instance_enabled == "true" ? 1 : 0}"
#   # security_group_count = "${var.create_default_security_group == "true" ? 1 : 0}"
#   # region               = "${var.region != "" ? var.region : data.aws_region.default.name}"
#   # root_iops            = "${var.root_volume_type == "io1" ? var.root_iops : "0"}"
#   # ebs_iops             = "${var.ebs_volume_type == "io1" ? var.ebs_iops : "0"}"
#   # availability_zone    = "${var.availability_zone != "" ? var.availability_zone : data.aws_subnet.default.availability_zone}"
#   # ami                  = "${var.ami != "" ? var.ami : data.aws_ami.default.id}"
#   # root_volume_type     = "${var.root_volume_type != "" ? var.root_volume_type : data.aws_ami.info.root_device_type}"
#   # public_dns           = "${var.associate_public_ip_address == "true" && var.assign_eip_address == "true" && var.instance_enabled == "true" ?  data.null_data_source.eip.outputs["public_dns"] : join("", aws_instance.default.*.public_dns)}"
# }


data "aws_region" "default" {}


module "ec2" {
	source = "../modules/ec2"
  env = "${var.env}"
  name_id = "${var.env}"
  //ami_id = "${local.ami}"
  instance_type = "t2.micro"

}
