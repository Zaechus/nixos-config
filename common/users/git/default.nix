{ username ? ""
, email ? ""
, name ? ""
, ...
}: { ... }:

{
  files."/home/${username}/.config/git/config".text = ''
    [user]
    	email = "${email}"
    	name = "${name}"
  '';
}
