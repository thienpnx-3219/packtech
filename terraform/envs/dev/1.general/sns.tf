module "sns_codepipeline" {
  source = "git@github.com:framgia/sun-infra-iac.git//modules/sns?ref=terraform-aws-sns_v0.0.2"
  #basic
  env     = var.env
  project = var.project
  region  = var.region

  #sns
  sns_topic_name = "codepipeline"
  service        = "codepipeline"
}
