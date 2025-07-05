# RDS 보안 그룹 추가
resource "aws_security_group" "istory_rds_sg" {
  name_prefix = "istory rds sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Allow MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.private-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "istory-rds-sg"
  }
}