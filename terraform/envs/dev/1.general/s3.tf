module "s3_bucket_logs" {
  source = "git@github.com:framgia/sun-infra-iac.git//modules/s3?ref=terraform-aws-s3_v0.2.1"

  s3_bucket = {
    name       = "${var.project}-${var.env}-logs"
    versioning = "Enabled"
    lifecycle_versioning = {
      status                             = "Enabled"
      noncurrent_version_expiration_days = 365
    }
    lifecycle = [
      {
        id              = "s3-bucket-lifecycle"
        status          = "Enabled"
        expiration_days = 365
      }
    ]
    object_ownership = "BucketOwnerPreferred"
  }

  s3_bucket_policy = {
    template = jsonencode(
      {
        "Version" : "2012-10-17",
        "Id" : "AllowWriteLog",
        "Statement" : [
          {
            "Effect" : "Allow",
            "Principal" : {
              "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
            },
            "Action" : "s3:PutObject",
            "Resource" : "${module.s3_bucket_logs.s3_bucket_arn}/AWSLogs/*"
          },
          {
            "Sid" : "AWSCloudTrailAclCheck20150319",
            "Effect" : "Allow",
            "Principal" : {
              "Service" : "cloudtrail.amazonaws.com"
            },
            "Action" : "s3:GetBucketAcl",
            "Resource" : module.s3_bucket_logs.s3_bucket_arn
          },
          {
            "Sid" : "AWSCloudTrailWrite20150319",
            "Effect" : "Allow",
            "Principal" : {
              "Service" : "cloudtrail.amazonaws.com"
            },
            "Action" : "s3:PutObject",
            "Resource" : "${module.s3_bucket_logs.s3_bucket_arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Condition" : {
              "StringEquals" : {
                "s3:x-amz-acl" : "bucket-owner-full-control"
              }
            }
          },
          {
            "Sid" : "AWSELBWriteLogs",
            "Action" : "s3:PutObject",
            "Effect" : "Allow",
            "Resource" : "${module.s3_bucket_logs.s3_bucket_arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*",
            "Principal" : {
              "AWS" : "arn:aws:iam::582318560864:root"
            }
          }
        ]
      }
    )
  }
}
