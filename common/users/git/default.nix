{ username
, email
, name
, ...
}: { ... }:

{
  users.users.${username}.files.".config/git/config".text = ''
    [user]
    	email = "${email}"
    	name = "${name}"
  '';
}
