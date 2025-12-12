{
  security = {
    doas = {
      enable = true;
      extraRules = [{
        users = [ "rootrim" ];
        keepEnv = true;
      }];
    };
  };
}
