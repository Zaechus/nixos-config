{ username
, email
, name
, ...
}: { ... }:

{
  # TODO
  users.users.${username}.files.".config/git/config".text = ''
    [user]
    	email = "${email}"
    	name = "${name}"
  '';
}
