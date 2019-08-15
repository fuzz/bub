# Wu wei

Wu wei provides systems administration tools targeted at BSD Unices
such as FreeBSD and macOS. The intent of these tools are to rely
heavily upon the correctness of Unix, such as respecting hier(7),
and thus are not expected to work on typical Linux distribitions.

Currently the executable `pao` changes to the user's home directory,
reads in a sequence of source/target mappings from a YAML file
in `.pao` and attempts to create them. If the target exists
and is a symbolic link it will be removed and replaced, otherwise
`pao` will refuse to clobber it.
