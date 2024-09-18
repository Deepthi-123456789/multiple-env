resource "aws_instance" "web" {
    for_each = var.instance_name
    ami = var.ami
    instance_type = each.value
  tags = {
    Name = each.key
    terraform = true
    environment = "dev"
    }
}
resource "aws_route53_record" "www" {
  for_each = aws_instance.web
  zone_id = var.zone_id
  name    = "${each.key}.pjdevops.online"
  type    = "A"
  ttl     = 1
  records = [startswith(each.key,"web") ? each.value.public_ip : each.value.private_ip ]
}
