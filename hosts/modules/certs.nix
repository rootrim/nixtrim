{
  config,
  pkgs,
  lib,
  ...
}:

let
  mebCert = pkgs.runCommand "meb-cert" { } ''
    mkdir -p $out
    cp ${../../dots/certs/MEB_SERTIFIKASI.pem} $out/MEB_SERTIFIKASI.pem
  '';
in
{
  security.pki.certificateFiles = [
    "${mebCert}/MEB_SERTIFIKASI.pem"
  ];

  environment.etc."ssl/certs/MEB_SERTIFIKASI.pem".source = "${mebCert}/MEB_SERTIFIKASI.pem";
}
