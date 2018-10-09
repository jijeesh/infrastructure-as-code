module "ec2" {
	source = "../modules/ec2"
  env = "${var.env}"
  instance_type = "t2.micro"
}
