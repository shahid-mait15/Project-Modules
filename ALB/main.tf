#create application load balancer
resource "aws_lb" "application_load_balancer" {
  name               = "${var.project_name}-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = [var.public_subnet_az1_id, var.public_subnet_az2_id, var.public_subnet_az3_id]

  enable_deletion_protection = false

 tags = {
    Name = "${var.project_name}-ALB"
  }
}

#create target group
resource "aws_lb_target_group" "alb_target_group" {
  name = "${var.project_name}-TG"
  target_type = "instance"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check{
    enabled = true
    interval = 300
    path = "/"
    timeout = 60
    matcher = 200
    healthy_threshold = 10
    unhealthy_threshold = 10
  }

  lifecycle {
    create_before_destroy = true
  }
}

#create a listener on port 80 
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "target_attachment1" {
  
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id = var.private_instance_az1_id
  
  }

resource "aws_lb_target_group_attachment" "target_attachment2" {
  
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id = var.private_instance_az2_id
  
  }


resource "aws_lb_target_group_attachment" "target_attachment3" {
  
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id = var.private_instance_az3_id
  
  }







