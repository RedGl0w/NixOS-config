{...}:
{
  services.keyd = {
    enable = true;

    keyboards.keychron = {
      ids = [ "3434:0233:fbe5fb8a" ];
      settings.main = {
        "`" = "102nd";
      };
    };
  };
}
