# Configuration for the SSH client.
{ pkgs, ...}: {

  home.packages = with pkgs; [
    # Install SSH.
    openssh
  ];

  # Enable SSH's configuration.
  programs.ssh = {
    enable = true;

    # Enable SSH compression.
    compression = true;

      # Multiplex multiple sessions over a single connection when possible.
    controlMaster = "auto";

      # The path to the control socket when multiplexing sessions.
    controlPath = "~/.ssh/control-%r@%h:%p";

      # Keep control sockets open in the background for ten minutes.
    controlPersist = "10m";

      # Hash hostnames and addresses when adding them to the known hosts file to
      # lessen information leaking.
    hashKnownHosts = true;

      # Send a keepalive every 30 seconds.
    serverAliveInterval = 30;

    includes = [
      "~/.orbstack/ssh/config"
    ];

    matchBlocks = {
      "*" = {
        identityFile = "~/Library/Group\\ Containers/2BUA8C4S2C.com.1password/t/agent.sock";
      };

      "*.revizto.com" = {
        user = "dm";
      };

      "*.revizto-stage.com" = {
        user = "dm";
      };

      "*.infra.revizto.com" = {
        user = "dm";
      };

      "dell" = {
        hostname = "dell.home.arpa";
        user = "fishhead";
      };

      "lenovo" = {
        hostname = "lenovo.home.arpa";
        user = "fishhead";
      };

      "pi3" = {
        hostname = "192.168.1.151";
        user = "fishhead";
      };
    };
  };
}