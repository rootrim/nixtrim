{
  security.pki.certificates = [
    (builtins.readFile ../../dots/certs/MEB_SERTIFIKASI.pem)
  ];
}
