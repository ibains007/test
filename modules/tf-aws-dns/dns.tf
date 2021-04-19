data "aws_route53_zone" "default" {
  zone_id = var.zone_id
}

resource "aws_route53_record" "rancher" {
  zone_id = data.aws_route53_zone.default.zone_id
  name    = "rancher.${data.aws_route53_zone.default.name}"
  type    = "A"
  ttl     = "5"

  records= [
    for node in var.rke_nodes:
    node.public_ip
  ] 
}
