variable "ec2_instance_type" {
  description = "Type of AWS instance"
  type        = string
  default     = "t2.micro"

}

variable "ec2_root_volume_size" {
  description = "Size of the root volume in GB"
  type        = number
  default     = 8
}

variable "ec2_ami_id" {
  description = "AMI ID for the AWS instance"
  type        = string
  default     = "ami-02d26659fd82cf299" 
}

variable "env" {
  type        = string
  default     = "dev"
}