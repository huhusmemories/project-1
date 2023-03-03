# Variables for the user and trainer - AZURE USERS
variable "user1-hs" {
  default = {
    email          = "huang.shewei@email.com"
    name           = "Huang Shewei"
    mail_nick_name = "huang.shewei"
    pwd            = "qwerty"
  }
}

variable "ibrahimozbek" {
  default = {
    email          = "ibrahim.ozbekler@email.com"
    name           = "Ibrahim Ozbekler"
    mail_nick_name = "ibrahim.ozbekler"
    pwd            = "qwerty"
  }
}


# Variable for users AWS
variable "colleagues" {
  default = ["MireilleDib", "RyanDeMos", "HeeSungShin", "JieyaoDeng"]
}

# Variable for buckets AWS
variable "bucket-name" {
  default = "hs-bucket-terraform-devops"
}

variable "bucket-number" {
  default = 2
}
