# terraform-iac-aws-state-management-tfstate-locking-modules
Implementing Infrastructure as Code using Terraform with best practices, including managing the tfstate file in an AWS S3 bucket and enabling state file locking with AWS DynamoDB

### Requirements
1. AWS CLI installed and configured.
2. Environment variables for access and secret keys.
3. AWS S3 bucket.
4. Aws DynamoDB table.

### Prerequisites Before Using the Code

  Before running the code, ensure the following steps are completed:
  
### 1. Configure AWS CLI
   
   A. Install AWS CLI on your system if not already installed.
  
```bash
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
```

   B. Configure AWS CLI with your credentials:

```
  aws configure
```

  - Enter your AWS Access Key ID.

  - Enter your AWS Secret Access Key.

  - Specify the default region (e.g., us-east-1).

  - Set the output format (e.g., json).
  
   C. Verify the configuration:

```
aws sts get-caller-identity
```

### 2. Export Environment Variables

   Add your AWS credentials as environment variables:

```
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
```

### 3. Create an S3 Bucket

   Bucket Name: terra-infra-iam

### Via AWS Management Console

   - Go to the S3 Dashboard.

   - Click Create bucket.

   - Enter Bucket name: terra-infra-iam.
     
   - Choose a region (e.g., us-east-1).

   - Leave other settings as default or customize as needed.

   - Click Create bucket.

### Via AWS CLI

   Run the following command:

```
aws s3api create-bucket --bucket terra-infra-iam --region us-east-1
```

   Verify the bucket:

```
aws s3 ls
```

### 4. Create a DynamoDB Table

   Table Name: terra-db

   Primary Key: LockID (String type)

### Via AWS Management Console

   - Go to the DynamoDB Dashboard.

   - Click Create table.

   - Enter Table name: terra-db.

   - Add a primary key:
     
        Partition key: LockID (String).
     
   - Leave other settings as default (use Pay-per-request mode).

   - Click Create table.

### Via AWS CLI

   Run the following command:

```
aws dynamodb create-table \
    --table-name terra-db \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST
```

   Verify the table:

```
aws dynamodb list-tables
```

### 5. Proceed to Use the Code

   After creating:

   - Ensure the bucket name (terra-infra-iam) and table name (terra-db) match exactly in your providers.tf file.

   - Export your AWS credentials as environment variables if needed:

```
export AWS_ACCESS_KEY_ID=your-access-key-id
export AWS_SECRET_ACCESS_KEY=your-secret-access-key
```

### Your setup is now ready to use the Terraform code!

### 6. Terraform commands 

  1. Initialize the Terraform Workspace

   Run this command to initialize Terraform and download the required providers:

```
terraform init
```

   2. Validate the Configuration
      
   To ensure the Terraform configuration is correct:

```
terraform validate
```

   3. View the Execution Plan
      
   Generate and view the execution plan to see what resources will be created:

```
terraform plan
```

   4. Apply the Configuration

   Apply the configuration to create resources in AWS:

```
terraform apply
```

   - Confirm with yes when prompted.

   5. Destroy Resources (If Needed)

   To delete the resources created by Terraform:

```
terraform destroy
```
   - Confirm with yes when prompted.

### Additional Notes

   - Ensure the S3 bucket (terra-infra-iam) and DynamoDB table (terra-db) are already created manually if specified in the providers.tf file.

   - Use terraform show to view the state after applying, and terraform state list to see all managed resources.
