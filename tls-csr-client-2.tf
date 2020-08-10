resource "tls_private_key" "client-2" {
  algorithm   = "RSA"
  ecdsa_curve = "2048"
}

resource "tls_cert_request" "client-2" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.client-2.private_key_pem

  subject {
    common_name  = "client-2"
    organization = "Kao Corp"
  }
}

resource "tls_locally_signed_cert" "client-2" {
  cert_request_pem   = tls_cert_request.client-2.cert_request_pem
  ca_key_algorithm   = "RSA"
  ca_private_key_pem = tls_private_key.ca.private_key_pem
  ca_cert_pem = tls_self_signed_cert.ca.cert_pem

  validity_period_hours = 4380
  
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
    "ipsec_end_system",
    "ipsec_tunnel",
    "ipsec_user"
  ]
}