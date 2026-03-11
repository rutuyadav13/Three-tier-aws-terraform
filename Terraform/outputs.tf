output "frontend_alb_dns" {
  description = "Frontend Load Balancer DNS"
  value       = aws_lb.frontend_alb.dns_name
}

output "backend_alb_dns" {
  description = "Backend Load Balancer DNS"
  value       = aws_lb.backend_alb.dns_name
}

output "rds_endpoint" {
  description = "RDS MySQL Endpoint"
  value       = aws_db_instance.mysql_db.endpoint
}
