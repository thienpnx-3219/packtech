project    = "test"
env        = "dev"
region     = "ap-northeast-1"
account_id = "99999999999"

domain          = "test.jp"
internal_domain = "internal.test.jp"

vpc = {
  vpc_cidr      = "10.0.0.0/16"
  public_cidrs  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
}

rds = {
  databasename            = "testdev"
  family                  = "aurora-postgresql16"
  engine                  = "aurora-postgresql"
  engine_version          = "16.1"
  instance_class          = "db.r6g.xlarge"
  replica_number          = 1
  backup_retention_period = 7
  log_retention           = 30
}

global_ips = {
  sun_hni        = ["1.55.242.188/32", "116.97.243.74/32", "42.112.114.236/32", "14.160.25.214/32", "42.116.7.14/32"]
  sun_hni_office = ["1.55.242.188/32", "116.97.243.74/32", "42.112.114.236/32"]
  sun_hni_server = ["14.160.25.214/32", "42.116.7.14/32"]
  sun_dng        = ["118.69.176.252/32", "14.176.232.181/32", "42.116.19.204/32"]
  sun_hcm        = ["222.253.79.245/32", "203.167.11.86/32", "58.186.32.244/32"]
  sun_jp         = ["150.249.192.115/32", "113.33.152.172/32"]
  fpl            = ["202.222.76.189/32", "115.162.43.152/32", "198.144.171.221/32", "58.158.137.206/32", "153.156.2.112/32", "24.239.147.26/31", "133.114.252.124/32", "221.188.12.166/32", "24.239.141.16/30", "111.108.18.126/32"]
}
