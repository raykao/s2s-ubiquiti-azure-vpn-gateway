resource "tls_private_key" "ca" {
  algorithm   = "RSA"
  ecdsa_curve = "4096"
}

resource "tls_self_signed_cert" "ca" {
  private_key_pem = tls_private_key.ca.private_key_pem
  key_algorithm   = "RSA"

  subject {
    common_name  = "Kao Root-CA"
    organization = "Kao Corp"
  }

  validity_period_hours = 175200
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "ipsec_end_system",
    "ipsec_tunnel",
    "ipsec_user"
  ]

  is_ca_certificate = true 
}