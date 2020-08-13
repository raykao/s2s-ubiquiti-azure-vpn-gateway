# Site-to-Site VPN with Ubiquiti EdgeRouter X and Azure VPN Gateway

## Azure Setup
- Login to Azure CLI
- Set to correct/target Azure Subscription (```az account set -s <subscription_id>``` )
- run Terraform commands (requires TF > v0.12.29)
- great success!!!

### Terraform commands
```
terraform init
terraform plan -var-file default.tfvars -out tfplan
terraform apply tfplan
```

## Ubiquiti Router setup
https://help.ui.com/hc/en-us/articles/115012305347-EdgeRouter-Route-Based-Site-to-Site-VPN-to-Azure-VTI-over-IKEv2-IPsec-

- Todo:
    - Add bash script to run on EdgeRouter remotely