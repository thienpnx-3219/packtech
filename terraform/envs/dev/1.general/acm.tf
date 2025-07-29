module "acm" {
  source = "git@github.com:framgia/sun-infra-iac.git//modules/acm?ref=terraform-aws-acm_v0.0.2"

  #acm
  acm_domain      = var.domain
  route53_zone_id = module.route53_zone.route53_zone_id
}

module "acm_cloudfront" {
  source = "git@github.com:framgia/sun-infra-iac.git//modules/acm?ref=terraform-aws-acm_v0.0.2"
  #providers
  providers = { aws = aws.east }

  #acm
  acm_domain     = var.domain
  dns_validation = false
}
