# flake.nix
{
  description = "xfeusw nixvim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          # Override bashdb to fix version check and file path
          (final: prev: {
            bashdb = prev.bashdb.overrideAttrs (oldAttrs: {
              patches = (oldAttrs.patches or []) ++ [
                # Patch to relax Bash version check
                (final.writeFile {
                  name = "bashdb-bash-version.patch";
                  text = ''
                    --- a/configure
                    +++ b/configure
                    @@ -3540,7 +3540,7 @@ if test "x$BASHVERS" != x; then
                         case $BASHVERS in
                           4.0) echo "This package does not work with Bash $BASHVERS"
                                exit 1 ;;
                    -      5.0) ;;
                    +      5.*) ;;
                           *) echo "This package is only known to work with Bash 5.0"
                              exit 1 ;;
                         esac
                  '';
                })
              ];
              # Fix path to bashdb-main.inc
              postPatch = ''
                substituteInPlace configure \
                  --replace "/usr/local/bashdb/bashdb-main.inc" "${prev.bashdb}/share/bashdb/bashdb-main.inc"
              '';
            });
          })
        ];
      };
      config = import ./config;
      nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = config;
      };

      # Wrap with necessary metadata
      nvimWithMeta = nvim.overrideAttrs (oldAttrs: {
        meta = (oldAttrs.meta or {}) // {
          description = "Neovim configured with nixvim";
          longDescription = "Custom Neovim configuration built with nixvim";
          homepage = "https://github.com/khamrakulov/nixvim";
          license = pkgs.lib.licenses.mit;
          maintainers = [ ];
          platforms = pkgs.lib.platforms.unix;
        };
      });
    in
    {
      # Export package with metadata
      packages.${system}.default = nvimWithMeta;

      # Export overlay for other flakes to use
      overlays.default = final: prev: {
        nixvim-xfeusw = nvimWithMeta;
      };

      # Check
      checks.${system}.default = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
        nvim = nvimWithMeta;
        name = "A nixvim configuration";
      };

      # Dev shell
      devShells.${system}.default = pkgs.mkShellNoCC {
        shellHook = ''
          echo Welcome to a Neovim dev environment powered by Nixvim
          PS1="Nixvim: \\w \$ "
          alias vim='nvim'
        '';
        packages = [
          nvimWithMeta
          pkgs.dotnet-sdk
          pkgs.dotnet-aspnetcore
        ];
      };
    };
}
