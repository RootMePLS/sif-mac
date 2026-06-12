# Configuration for the SSH client.
{ pkgs, ...}: {

  home.packages = with pkgs; [
    # Install SSH.
    openssh
  ];

  # Enable SSH's configuration.
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    includes = [
      "~/.orbstack/ssh/config"
    ];

    settings = {
      "*" = {
        IdentityAgent = "~/Library/Group\\ Containers/2BUA8C4S2C.com.1password/t/agent.sock";

        # Automatically add keys to the 1Password agent.
        AddKeysToAgent = "yes";

        # Only use explicitly configured identities.
        IdentitiesOnly = "yes";

        # Accept new host keys automatically but refuse changed keys.
        StrictHostKeyChecking = "accept-new";

        # Enable SSH compression.
        Compression = "yes";

        # Multiplex multiple sessions over a single connection when possible.
        ControlMaster = "auto";

        # The path to the control socket when multiplexing sessions.
        ControlPath = "~/.ssh/control-%r@%h:%p";

        # Keep control sockets open in the background for ten minutes.
        ControlPersist = "10m";

        # Hash hostnames and addresses when adding them to the known hosts file to
        # lessen information leaking.
        HashKnownHosts = "yes";

        # Send a keepalive every 30 seconds.
        ServerAliveInterval = "30";
      };

      "*.revizto.com" = {
        User = "dm";
      };

      "*.revizto-stage.com" = {
        User = "dm";
      };

      "*.infra.revizto.com" = {
        User = "dm";
      };

      "dell" = {
        HostName = "dell.home.arpa";
        User = "fishhead";
      };

      "lenovo" = {
        HostName = "lenovo.home.arpa";
        User = "fishhead";
      };

      "macm1" = {
        HostName = "192.168.1.29";
        User = "fishhead";
        IdentityFile = "~/.ssh/macmini";
      };

      "macm1-ts" = {
        HostName = "100.79.2.17";
        User = "fishhead";
        IdentityFile = "~/.ssh/macmini";
      };
    };
  };
}