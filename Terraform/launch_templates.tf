resource "aws_launch_template" "frontend_lt" {

  name_prefix   = "frontend-template"
  image_id      = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"

  vpc_security_group_ids = [
    aws_security_group.frontend_server_sg.id
  ]

user_data = base64encode(<<-EOF
#!/bin/bash

apt update -y
apt install nginx git -y

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

#!/bin/bash

apt update -y
apt install apache2 php php-mysql mysql-client git -y

cd /home/ubuntu

git clone https://github.com/rutuyadav13/Three-tier-aws-terraform.git

cp -r Three-tier-aws-terraform/backend/api/* /var/www/html/

RDS_ENDPOINT="YOUR_RDS_ENDPOINT"
DB_USER="admin"
DB_PASS="StrongPassword123"

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
