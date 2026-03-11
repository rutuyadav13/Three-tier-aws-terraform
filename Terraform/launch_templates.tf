resource "aws_launch_template" "frontend_lt" {
  name_prefix   = "frontend-template"
  image_id      = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.frontend_server_sg.id
  ]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

    apt update -y
    apt install -y nginx git

    # Create a simple index.html so health check passes
    echo "<h1>Frontend Server Running</h1>" > /var/www/html/index.html

    cd /var/www/html
    git clone https://github.com/rutuyadav13/Three-tier-aws-terraform.git
    cp -r three-tier-aws-terraform/frontend/* /var/www/html/

    systemctl start nginx
    systemctl enable nginx
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "frontend-server"
    }
  }
}

resource "aws_launch_template" "backend_lt" {
  name_prefix   = "backend-template"
  image_id      = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.backend_server_sg.id
  ]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

    apt update -y
    apt install -y apache2 php php-mysql mysql-client git

    # Create a simple index.html to pass health check
    echo "<h1>Backend Server Running</h1>" > /var/www/html/index.html

    cd /home/ubuntu
    git clone https://github.com/rutuyadav13/Three-tier-aws-terraform.git
    cp -r Three-tier-aws-terraform/backend/api/* /var/www/html/

    # Replace with your actual RDS endpoint and credentials
    RDS_ENDPOINT="YOUR_RDS_ENDPOINT"
    DB_USER="admin"
    DB_PASS="StrongPassword123"

    # Initialize database
    mysql -h $RDS_ENDPOINT -u $DB_USER -p$DB_PASS < Three-tier-aws-terraform/database/init.sql

    systemctl restart apache2
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "backend-server"
    }
  }
}
