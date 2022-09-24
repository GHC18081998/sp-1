# Creating External LoadBalancer
resource "aws_lb" "external-alb" {
  name               = "elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-sg.id]
  subnets            = [aws_subnet.web-pub-sub-1.id, aws_subnet.app-pub-sub-1.id]
}
resource "aws_lb_target_group" "alb-tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.pro-vpc.id
}
resource "aws_lb_target_group_attachment" "attachment-1" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.web-1.id
  port             = 80
  depends_on = [
    aws_instance.web-1,
  ]
}
resource "aws_lb_target_group_attachment" "attachment-2" {
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.web-2.id
  port             = 80
  depends_on = [
    aws_instance.web-2,
  ]
}

#listener
resource "aws_lb_listener" "albl" {
  load_balancer_arn = aws_lb.external-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}
