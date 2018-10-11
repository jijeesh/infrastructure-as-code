# Terraform example

This folder contains an example of how define infrastructure-as-code using [Terraform](https://www.terraform.io/). The
Terraform templates in this folder are the "Hello, World" of Terraform, showing how to create a single EC2 instance.

## Quick start

Note: these Terraform templates create real resources in your AWS account. The resources are part of the [AWS Free
Tier](https://aws.amazon.com/free/), but if you've used up all your credits, they may cost you money.

1. Install [Terraform](https://www.terraform.io/).
2. Add your AWS credentials as
```
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html
aws configure --profile jijeesh
AWS Access Key ID [None]: AKIAI44QH8DHBEXAMPLE
AWS Secret Access Key [None]: je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
Default region name [None]: us-east-1
Default output format [None]: text
```
3. Run `terraform init`
4. Run `terraform plan`.
5. If the plan looks good, run `terraform apply`.

## Making changes

Try making some changes to the template to learn about basic Terraform features, as described in the following sections.

### Use a variable

Variables make your templates configurable. To become familiar with variables, try defining one in `main.tf`:

```hcl
variable "name" {
  description = "The name of the EC2 instance"
}
```

Next, use that variable in the `tags` of the `aws_instance`:

```hcl
resource "aws_instance" "example" {
  // ...

  tags {
    Name = "${var.name}"
  }
}
```

Try running `terraform plan` and `terraform apply` to see what happens.

### Use dependencies

Terraform resources can depend on each other. Terraform will automatically build a dependency graph and ensure the
resources get created in the right order. For example, to add an IP address to the EC2 instance, you can define an
`aws_eip` resource:

```hcl
resource "aws_eip" "example" {
  instance = "${aws_instance.example.id}"
}
```

Notice how the `instance` parameter is set to `"${aws_instance.example.id}"`. This is dependency on the `id` attribute
of the `aws_instance` you've already created. Terraform now knows that when you `apply` these templates, it needs to
create the `aws_instance` first, pull out its `id`, and then it can create the `aws_eip`.

## Cleaning up

To clean up the resources created by these templates, just run `terraform destroy`.
