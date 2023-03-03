# project-1
Dev Ops - Terraform Project Week 1

This project was done using Terraform with the goal to deploy resources to AWS and AZ.

In providers.tf you will find the configuration required in order to deploy resources to AWS and AZ using Terraform.
In main.tf you will find all the resources created and its configurations.
In variables.tf you will find all the variables used in this project.

First phase of the project:
This part of the code will create users on Azure. One of them being a trainee and the other being a trainer.
Trainee is created with a field for name, email, username, and password.
Please note that the Trainer has the exact same filds with the exception that it will be prompted to change its password after the first login.

Second phase of the project:
The goal is to create four users and deployt it to AWS. To automate and to avoid errors, these users were created using a for_each.
The name of the users were stored in a variable and we used a for_each to create one user at a time.

Third phase of the project:
It was created two instances of S3 Storage bucket, and to be flexible, it was used the 'count' variable in terraform, and the value of count is set in variables.tf.
Please note that in order to create AWS buckets, Azure User 1 needs to be created first, so there's a dependency on it.
Back to the buckets, the names are using interpolation, and it is done by the count.index

Fourth phase of the project:
Resource Group, Virtual Machine and Storage account from Azure were created.
The Resource group is going to be the first one to be created, the name and the location are set in the variables.
Later on Azure users will be created, keeping in mind that the Trainer will be prompted to change its password once they log in.
After that, S3 buckets are going to be created, and they are going to be created after because it depends on the azure users. So it follows and order.
Then four aws users are created using the for each, making this resource somewhat automated.
Storage accounts are also created using dependencies and variables, and tags are also included in their parameters.
Last but not least, it's time for the virtual machine, however some resources need to be created first, such as Virtual network, so terraform will deploy the code to create resources necessary in order to create the virtual machine.
