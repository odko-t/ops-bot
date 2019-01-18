resource "aws_instance" "start-stop-test" {
		ami = "ami-04d3eb2e1993f679b"
		instance_type = "t3.micro"
		subnet_id = "${data.aws_subnet.dev_default.id}"
		associate_public_ip_address = true
		vpc_security_group_ids = ["${data.aws_security_group.dev-default.id}", "${data.aws_security_group.allow-ssh-from-intra.id}", "${data.aws_security_group.allow-http-from-intra.id}"]
		tags {
			Name = "new-instance-name"
			datadog = "false" # Set false when this instance
			Environment = "dev"
			Department = "ti"
		}
	}