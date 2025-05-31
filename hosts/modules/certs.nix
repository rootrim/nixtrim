{
  environment.etc."ssl/certs/MEB_SERTIFIKASI.pem".source = ../../dots/certs/MEB_SERTIFIKASI.pem;

  security.pki.certificateFiles = [
    "/etc/ssl/certs/MEB_SERTIFIKASI.pem"
  ];
}
