module "cloudtrail" {
  source = "git@github.com:framgia/sun-infra-iac.git//modules/cloudtrail?ref=terraform-aws-cloudtrail_v0.0.1"

  depends_on = [module.s3_bucket_logs]
  #basic
  env     = var.env
  project = var.project

  #cloudtrail
  cloudtrail = {
    s3_bucket_name = module.s3_bucket_logs.s3_bucket_id
  }
}
