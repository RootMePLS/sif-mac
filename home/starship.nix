{ config
, lib
, pkgs
, ... }: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
      };
      aws = {
        format = "on [$symbol$profile]($style) ";
        style = "bold blue";
        symbol = "🅰 ";
      };

      git_branch = {
        symbol = "🌱 ";
        truncation_length = 4;
        truncation_symbol = "";
        ignore_branches = "main";
      };

      git_commit = {
        hash_length = 4;
        hash_symbol = "🔖 ";
      };

      git_status = {
        ahead = "🏎💨";
        behind = "😰";
        conflicted = "🏳";
        deleted = "🗑";
        diverged = "😵";
        modified = "📝";
        renamed = "👅";
        staged = "[++\\($count\\)](green)";
        stashed = "📦";
        untracked = "🤷";
        up_to_date = "✓";
      };

      python = {
        symbol = "🐍 ";
        pyenv_version_name = true;
        python_binary = "python3";
      };
      
    };
  };
}
