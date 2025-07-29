module "ses" {
  source = "git@github.com:framgia/sun-infra-iac.git//modules/ses?ref=terraform-aws-ses_v0.0.2"
  #basic
  region = var.region

  #ses
  ses_domain_identity = var.domain
  route53_zone_id     = module.route53_zone.route53_zone_id
  ses_smtp_user = {
    name = "${var.project}-${var.env}-ses-smtp-user"
    policy = jsonencode({
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "ses:SendRawEmail",
          "Resource" : "*",
          "Condition" : {
            "StringLike" : {
              "ses:FromAddress" : "*"
            }
          }
        }
      ]
    })
  }
}
