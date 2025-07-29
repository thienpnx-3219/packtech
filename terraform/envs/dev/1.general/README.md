# 1.general

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.56.0 |
| <a name="requirement_sops"></a> [sops](#requirement\_sops) | ~> 0.5 |
| <a name="requirement_template"></a> [template](#requirement\_template) | ~> 2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.5.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | git@github.com:framgia/sun-infra-iac.git//modules/acm | terraform-aws-acm_v0.0.2 |
| <a name="module_acm_cloudfront"></a> [acm\_cloudfront](#module\_acm\_cloudfront) | git@github.com:framgia/sun-infra-iac.git//modules/acm | terraform-aws-acm_v0.0.2 |
| <a name="module_cloudtrail"></a> [cloudtrail](#module\_cloudtrail) | git@github.com:framgia/sun-infra-iac.git//modules/cloudtrail | terraform-aws-cloudtrail_v0.0.1 |
| <a name="module_route53_zone"></a> [route53\_zone](#module\_route53\_zone) | git@github.com:framgia/sun-infra-iac.git//modules/route53 | terraform-aws-route53_v0.0.3 |
| <a name="module_s3_bucket_logs"></a> [s3\_bucket\_logs](#module\_s3\_bucket\_logs) | git@github.com:framgia/sun-infra-iac.git//modules/s3 | terraform-aws-s3_v0.2.1 |
| <a name="module_ses"></a> [ses](#module\_ses) | git@github.com:framgia/sun-infra-iac.git//modules/ses | terraform-aws-ses_v0.0.2 |
| <a name="module_sns_codepipeline"></a> [sns\_codepipeline](#module\_sns\_codepipeline) | git@github.com:framgia/sun-infra-iac.git//modules/sns | terraform-aws-sns_v0.0.2 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git@github.com:framgia/sun-infra-iac.git//modules/vpc | terraform-aws-vpc_v0.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_global_ips"></a> [global\_ips](#input\_global\_ips) | n/a | `any` | n/a | yes |
| <a name="input_internal_domain"></a> [internal\_domain](#input\_internal\_domain) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | <pre>object({<br>    vpc_cidr      = string<br>    private_cidrs = list(string)<br>    public_cidrs  = list(string)<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
