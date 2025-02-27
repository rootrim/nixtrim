{
    inputs,
    pkgs,
    config,
    ...
}:
{
    imports = [
        ./git.nix
        ./kitty.nix
        ./spicetify.nix
    ];

}
