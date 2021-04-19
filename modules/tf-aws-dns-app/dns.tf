data "aws_route53_zone" "default" {
  zone_id = var.zone_id
}

resource "aws_route53_record" "record" {
  zone_id = data.aws_route53_zone.default.zone_id
  name    = "${var.name}.${data.aws_route53_zone.default.name}"
  type    = "CNAME"
  ttl     = "5"
  records = [var.value]
}
