variable "project" {
  type = string
}
variable "env" {
  type = string
}
variable "region" {
  type = string
}
variable "account_id" {
  type = string
}
variable "domain" {
  type = string
}
variable "internal_domain" {
  type = string
}
variable "global_ips" {
  type = any
}
variable "vpc" {
  type = object({
    vpc_cidr      = string
    private_cidrs = list(string)
    public_cidrs  = list(string)
  })
}
