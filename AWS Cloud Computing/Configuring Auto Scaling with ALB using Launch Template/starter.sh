sudo yum update -y        # Amazon Linux 2023
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# if - "sudo yum install -y httpd"  #does not work:
# try: "sudo dnf install -y httpd"
