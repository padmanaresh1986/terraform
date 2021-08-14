**Useful terraform commands**  

Install Terraform binary into system and check vetsion   
>terraform -version  

Create a folder and create a terraform config file inside folder and add configuration  
> main.tf  

To install dependencies defined in main.tf file    
after defineing provider (Eg: AWS) in main.tf , run below command from command line    
>terraform init    

To apply changes of main.tf file to AWS environment   
>terraform apply  
>terraform apply -auto-approve

To destroy certain resource in aws have two options  
1. Remove resource definition from terraform file  
2. run terrraform destroy command  

> terraform destroy -target aws_subnet.development-vpc-subnet-2    

Best practise to destroy resource through terraform config file.  

To destroy all resources defined in config file  
> terraform destroy  


To compare actual aws state with terraform config file to see actual state is desired state    
>terraform plan    

To see full state information about resources    

>terraform state list    
>terraform state show development-vpc-subnet-2    

To input certain values of resource ,define variable in config file and supply value from command     
>terraform apply -var "development-vpc-subnet-2-cidr = 10.0.30.0/24"  

To supply input using variables file  
>terraform apply -var-file terraform-dev.tfvars  


Further code examples  
>https://gitlab.com/nanuchi/udemy-terraform-learn  








