{
  perSystem = {pkgs, ...}: {
    devShells.reverse = pkgs.mkShell {
      name = "reverse";
      packages = with pkgs; [
        ghidra
        radare2
        gdb
        pwntools
        binutils
        file
        hexyl
        strace
        ltrace
        checksec
      ];
    };
  };
}
