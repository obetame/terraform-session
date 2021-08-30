variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "AWS_SHARED_CREDENTIALS" {
  default = "/Users/obeta/.aws/credentials"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1      = "ami-13be557e"
    us-west-2      = "ami-06b94666"
    eu-west-1      = "ami-844e0bf7"
    ap-southeast-1 = "ami-0f9bb83789c97a18c"
  }
}

variable "WEB_PORT" {
  default = 80
}

