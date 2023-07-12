# con.tf

provider "aws" {
  region     = "us-east-1"
#  access_key = "YOUR-ACCESS-KEY"
#  secret_key = "YOUR-SECRET-KEY"
}

variable "envi" {}

resource "aws_instance" "dev1" {
   ami = "ami-0747bdcabd34c712a"
   instance_type = "t2.micro"
   count = var.envi == "dev" ? 3 : 0
}

resource "aws_instance" "prod1" {
   ami = "ami-0747bdcabd34c712a"
   instance_type = "t2.large"
   count = var.envi == "prod" ? 1 : 0
}

#terraform.tfvars

envi = "dev"
#envi = prod




# A conditional expression uses the value of a bool expression to select one of two values.

# The syntax of a conditional expression is as follows:

# condition ? true_val : false_val

# var.a != "" ? var.a : "default-a"
# If var.a is an empty string then the result is "default-a", but otherwise it is the actual value of var.a.
# https://www.terraform.io/docs/language/expressions/conditionals.html



