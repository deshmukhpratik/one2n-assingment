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

Configure Variables: Update terraform.tfvars with your specific values:
![image](https://github.com/user-attachments/assets/ec65f4f2-43ce-4285-952a-e0435c174616)

Initialize Terraform:
![image](https://github.com/user-attachments/assets/5a32a318-bca2-4211-8568-29cc45371fab)

Validate and Deploy:
![image](https://github.com/user-attachments/assets/7efe2663-bf93-4d94-9406-7c52744182c4)

![image](https://github.com/user-attachments/assets/cbaa4847-f2d8-4ef9-ab8f-800f7dc97987)

Access the EC2 Instance:

After deployment, retrieve the public IP and SSH into the instance:
![image](https://github.com/user-attachments/assets/f21b341f-0b3a-407e-a85a-464d391b4fba)


### Resource Overview ###

1. S3 Bucket: Stores objects under "dir1" and "dir2".
2. Security Group: Allows HTTP, HTTPS, and SSH traffic.
3. IAM Role and Policy: Grants S3 access to EC2.
4. EC2 Instance: Configured to run an HTTP service using Docker and Python.



