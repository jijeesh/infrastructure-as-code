# Create an EC2 instance
resource "aws_instance" "example" {
  
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"

  tags {
    Environment = "${var.env}"
    CreatedBy = "terraform"
  }
}
