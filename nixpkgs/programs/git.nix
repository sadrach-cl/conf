{ config, pkgs, ... }:

{
programs.git = { 
  enable = true;
  userName = "sadrach";
  userEmail = "sadrachfza@gmail.com";
};
}