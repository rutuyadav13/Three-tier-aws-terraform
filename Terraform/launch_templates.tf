resource "aws_launch_template" "frontend_lt" {

  name_prefix   = "frontend-template"
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.frontend_server_sg.id
  ]

user_data = base64encode(<<-EOF
#!/bin/bash

apt update -y
apt install nginx git -y

cd /var/www/html

git clone https://github.com/YOUR_USERNAME/three-tier-aws-terraform.git

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
  image_id      = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.backend_server_sg.id
  ]

user_data = base64encode(<<-EOF
#!/bin/bash

apt update -y
apt install apache2 php php-mysql mysql-client git -y

cd /var/www/html

git clone https://github.com/YOUR_USERNAME/three-tier-aws-terraform.git

cp -r three-tier-aws-terraform/backend/* /var/www/html/

systemctl start apache2
systemctl enable apache2

EOF
)
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "backend-server"
    }
  }

}
