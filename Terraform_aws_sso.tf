provider "aws" {
  sso_start_url = "https://<your-aws-sso-start-url>"
  sso_account_id = "aws_id"
  sso_region = "aws_region"
  sso_role_name = "aws-sso-role-name"
  sso_role_duration = <duration-in-seconds>
}

resource "aws_ssoadmin_account_assignment" "rdp" {
  instance_arn = "arn:aws:ec2:<REGION>:<ACCOUNT_ID>:instance/<INSTANCE_ID>"
  target_id = "arn:aws:organizations::<ORGANIZATION_ID>:sso-instance-sso/sso-instance"
  target_type = "aws_instance_access"
  permission_set_arn = "arn:aws:sso:::permissionSet:/<PERMISSION_SET_ID>"
}

resource "aws_ssoadmin_permission_set" "rdp" {
  name = "sso-instance"
  description = "SSO permission set for EC2 instance access"
  session_duration = "PT1H"
}

resource "aws_ec2_instance" "rdp" {
  ami = " "
  instance_type = " "
  key_pair = " "

}

resource "aws_security_group" "rdp" {
  name = "windows-rdp"

  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }


