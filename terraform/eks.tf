module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "java-eks-cluster"
  cluster_version = "1.29"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  eks_managed_node_groups = {
    default_node_group = {
      instance_types = ["t3.medium"]
      desired_capacity = 2
    }
  }
}