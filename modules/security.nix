{
  security = {
    doas = {
      enable = false;
      extraRules = [{
        users = [ "rootrim" ];
        keepEnv = true;
      }];
    };
  };
}
