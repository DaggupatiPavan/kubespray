resource "aws_security_group" "security_sg"  {
    name        = "Cluster_SG"
    description = "Kubernetes Security Group"
    vpc_id      =  var.vpc_id
}

# Inbound rules
resource "aws_security_group_rule" "inbound_rules" {
    count = 8 
    type        = "ingress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.63.0.0/16"]
    security_group_id = aws_security_group.security_sg.id
}

# Outbound rules (egress)
resource "aws_security_group_rule" "egress_rules" {
    type        = "egress" 
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.security_sg.id
}
