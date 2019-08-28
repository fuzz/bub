# Wu wei

Wu wei provides systems administration tools targeted at Unices that comply
with [Recommendations for Safety and Composability in Operating Systems](https://github.com/fuzz/rescos).
macOS and BSD Unices comply out of the box; more effort is required for Linux.
The status of Windows and other operating systems is not known at this time.

Currently the executable `ww` changes to the user's home directory,
reads in a sequence of source/target mappings from a YAML file
in `.ww` and attempts to create them. If the target exists
and is a symbolic link it will be removed and replaced, otherwise
`ww` will refuse to clobber it.

Example `.ww` files for macOS and FreeBSD are located in `examples/`.
