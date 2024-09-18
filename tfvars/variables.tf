variable "instance_name" {
  default = {
    mongodb = "t3.small"
    redis = "t2.micro"
    web = "t2.micro"
  }
}
variable "ami"{
    default = "ami-0b4f379183e5706b9"
}

variable "zone_id"{
    default = "Z0426536RLNV1FOO62SE"
}