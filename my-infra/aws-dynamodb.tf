resource "aws_dynamodb_table" "dynamo_table_name" {
        name = "${var.my_env}-${var.dynamo_table_name}"
        billing_mode = "PAY_PER_REQUEST"
        hash_key     = "ProductID"


        attribute {
        name = "ProductID"
        type = "S"
        }
        tags = {
                Name = "${var.my_env}-${var.dynamo_table_name}"
        }

}
