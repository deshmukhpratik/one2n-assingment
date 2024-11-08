### AWS Infrastructure with Terraform ###

This project provisions AWS resources using Terraform. It creates:

1. An S3 bucket with specified directories and files.
2. An EC2 instance running a simple HTTP service.
3. Security configurations allowing HTTP, HTTPS, and SSH access.

### Project Structure ###

1. main.tf: Contains resource definitions, including the S3 bucket, IAM roles, security group, and EC2 instance.
2. variables.tf: Defines configurable variables.
3. outputs.tf: Displays resource details after deployment.
4. provider.tf: Configures the AWS provider.
5. terraform.tfvars: Contains values for the variables.
6. install.sh: Bootstrapping script for setting up Python, Docker, and dependencies on the EC2 instance.

### Prerequisites ###

AWS Account: Ensure you have the necessary permissions.
AWS CLI: Configure it with aws configure.
Terraform: Install Terraform.

### Setup Instructions ###
Clone the Repository:
![image](https://github.com/user-attachments/assets/85462b3e-1fb1-42a2-8bd5-b84431dc1b4d)

