resource "aws_s3_bucket" "terra-infra-iam"{

        bucket = "${var.my_env}-terrabucket"
        tags = {
                Name = "${var.my_env}-terrabucket"
                Enviroment = "${var.my_env}"
}
}
