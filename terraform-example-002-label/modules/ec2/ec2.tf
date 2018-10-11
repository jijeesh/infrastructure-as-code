# Create an EC2 instance
resource "aws_instance" "example" {

  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"

  tags {
    Environment = "${var.env}"
    CreatedBy = "terraform"
    label = "${module.label.tags}"
  }
}
