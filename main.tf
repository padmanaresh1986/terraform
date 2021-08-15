/*
we can remove access_key and secret_key
set them as en variables , see aws provider docuemtnation
*/



provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}

resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Env" = "development",
    "Name" = "development-vpc"
  }
}

resource "aws_subnet" "development-vpc-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    "Env" = "development",
    "Name" = "development-vpc-subnet-1"
  }

}

/*
To get the data of already created resources
data "aws_vpc" "development-vpc" {
  #default = true
  tags = {
   "Env" = "development"
   "Name" = "development-vpc"
  }
} */


/*
We can declare variables as strings, list, objects .. 
type = list(string),  
Useage: var.development-vpc-subnet-2-cidrs[1]

To read objects and validate its data type
type = list(object({
    name = string
    cidr = string
}))
Useage : var.development-vpc-subnet-2-cidr[0].cidr
         var.development-vpc-subnet-2-cidr[0].name
*/

variable "development-vpc-subnet-2-cidr" {
    description = "CIDR for development-vpc-subnet-2"
    default = "10.0.30.0/24"
    type = string 
  }

resource "aws_subnet" "development-vpc-subnet-2" {
   vpc_id = aws_vpc.development-vpc.id
   cidr_block = var.development-vpc-subnet-2-cidr
    availability_zone = "ap-south-1a"
    tags = {
     "Env" = "development",
     "Name" = "development-vpc-subnet-2"
    }
} 


/* Create environmental variable as below
   TF_VAR_avail_zone="ap-south-1a"
   this variable automatically binds to avail_zone 
   we can use it in configuration 
   availability_zone = avail_zone
   */

variable "avail_zone"{
  default = "ap-south-1a"
}   


/* to output data created resources */

output "development-vpc-id" {
    value = aws_vpc.development-vpc.id
}

output "development-vpc-subnet-1-id" {
    value = aws_subnet.development-vpc-subnet-1.id
}

output "development-vpc-subnet-2-id" {
    value = aws_subnet.development-vpc-subnet-2.id
}