module "route53_zone" {
  source = "git@github.com:framgia/sun-infra-iac.git//modules/route53?ref=terraform-aws-route53_v0.0.3"
  #basic
  env     = var.env
  project = var.project

  #route53
  route53_zone = {
    domain_name = var.domain
  }
}
