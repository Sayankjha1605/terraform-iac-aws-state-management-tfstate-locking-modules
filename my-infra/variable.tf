variable "my_env" {
        description = "this holds the env for the infra"
        type = string
}

variable "aws_ami" {
        description = "this holds the env for the infra"
        type = string
}

variable "aws_ec2_count" {
        description = "this tells the number of instances requied"
        type = number
}

variable "aws_instance_type" {
        description = "this holds the for the ec2 instance"
        type = string
}

variable "dynamo_table_name" {
        description = "this holds the dynamo db table name postfix"
        type = string
}

