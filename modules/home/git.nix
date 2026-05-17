{...}:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Joachim Le Fournis";
      email = "joachim@le-fournis.fr";
    };
    ignores = [
      ".vscode/*"
    ];
  };
}
