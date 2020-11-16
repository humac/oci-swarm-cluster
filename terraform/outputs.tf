# Copyright (c) 2019, 2020 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

output "lb_public_url" {
  value = format("http://%s", lookup(oci_load_balancer_load_balancer.oci_swarm_lb.ip_address_details[0], "ip_address"))
}

output "autonomous_database_password" {
  value = random_string.autonomous_database_admin_password.result
}

### Important Security Notice ###
# The private key generated by this resource will be stored unencrypted in your Terraform state file. 
# Use of this resource for production deployments is not recommended. 
# Instead, generate a private key file outside of Terraform and distribute it securely to the system where Terraform will be run.
output "generated_private_key_pem" {
  value = var.generate_public_ssh_key ? tls_private_key.compute_ssh_key.private_key_pem : "No Keys Auto Generated"
}

output "dev" {
  value = "Made with \u2764 by Marcelo Ochoa"
}

output "comments" {
  value = "The application URL will be unavailable for a few minutes after provisioning, while the application is configured"
}

output "deploy_id" {
  value = random_string.deploy_id.result
}

output "deployed_to_region" {
  value = local.region_to_deploy
}

output "oci_swarm_basic_source_code" {
  value = "https://github.com/marcelo-ochoa/oci-swarm-cluster/tree/master/deploy/basic"
}