# config/web-devicons.nix
{
  plugins.web-devicons = {
    enable = true;
    autoLoad = true;
    settings = {
      color_icons = true;
      strict = true;
    };
  };
}
