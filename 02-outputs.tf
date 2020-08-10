# # Private Keys
# output "private-key-ca" {
#     value = tls_private_key.ca.private_key_pem
# }

# output "private-key-client-1" {
#     value = tls_private_key.client-1.private_key_pem
# }

# output "private-key-client-2" {
#     value = tls_private_key.client-2.private_key_pem
# }

# # Public Signed Certificates
# output "public-cert-ca" {
#     value = tls_self_signed_cert.ca.cert_pem
# }

# output "public-cert-client-1" {
#     value = tls_locally_signed_cert.client-1.cert_pem
# }

# output "public-cert-client-2" {
#     value = tls_locally_signed_cert.client-2.cert_pem
# }

# VPN Gateway Info

output "vpn-gateway-pip" {
    value = azurerm_public_ip.core.ip_address
}

output "psk" {
    value = local.pre-shared-key
}