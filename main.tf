/*provider "local" {}

resource "local_file" "example" {
  filename = "./example.txt" # Path to the file
  content  = "Hello, Terraform!" # Content of the file
}*/


module "dev-infra" {
        source = "./my-infra"
        my_env = "dev"
        aws_ec2_count = 1
        dynamo_table_name = "terra-db"
        aws_instance_type = "t3.micro"
        aws_ami = "ami-08eb150f611ca277f"
}
