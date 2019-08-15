# Bub

Bub provides systems administration tools targeted at BSD Unices
such as FreeBSD and macOS. The intent of these tools are to rely
heavily upon the correctness of Unix, such as respecting hier(7),
and thus are not expected to work on typical Linux distribitions.
Support for typical Linux distributions is neither desired nor will
patches be considered.

Currently the executable `symlink` changes to the user's home directory,
reads in a sequence of source/target mappings from a YAML file
in `.bub` and attempts to create them. If the target exists
and is a symbolic link it will be removed and replaced, otherwise
`bub` will refuse to clobber it.
