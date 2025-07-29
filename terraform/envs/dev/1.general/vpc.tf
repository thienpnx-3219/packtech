module "vpc" {
  source = "git@github.com:framgia/sun-infra-iac.git//modules/vpc?ref=terraform-aws-vpc_v0.1.1"
  #basic
  env     = var.env
  project = var.project
  region  = var.region

  #vpc
  vpc_cidr      = var.vpc.vpc_cidr
  public_cidrs  = var.vpc.public_cidrs
  private_cidrs = var.vpc.private_cidrs
  vpc_flow_logs = {
    all_logs_to_s3 = {
      log_destination_arn  = module.s3_bucket_logs.s3_bucket_arn
      log_destination_type = "s3"
      traffic_type         = "ALL"
      log_record_format    = "$${version} $${account-id} $${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${protocol} $${packets} $${bytes} $${start} $${end} $${action} $${log-status} $${ecs-cluster-name} $${ecs-cluster-arn} $${ecs-container-instance-id} $${ecs-container-instance-arn} $${ecs-service-name} $${ecs-task-definition-arn} $${ecs-task-id} $${ecs-task-arn} $${ecs-container-id} $${ecs-second-container-id}"
      destination_opt = {
        log_file_format = "parquet"
      }
    }
  }
}
