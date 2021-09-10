# i-am-jolene-via-elb
For self-learning, I have deployed my personal blog to a high availability infrastructure that has a public-facing ELB, an auto-scaling group associates with a maximum of 3 spot instances in private subnets. Each spot instance has a user_data to run that will serve the static website. This infrastructure is provided and managed by Terraform. 

Infrastructure is as below

![i-am-jolene-via-ELB drawio](https://user-images.githubusercontent.com/84490659/132788263-f0960568-2054-47cd-9a73-86425af4812a.png)

