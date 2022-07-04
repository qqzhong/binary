# xygcc
Shorthand bash script for building assembly or C files for x86 i386, x86_64, ARM32, aarch64. See **/test** for examples.

Supported targets: aarch64, arm32, x86_64, x86 i386 (32-bit)

Supported build methods: gcc and as/ld for .c and .s

Will verify dependencies on run with `dpkg -l <package>`. See $env variable definition for list of packages. This was tested on an Ubuntu 20.04 VM. Let me know if you find that you need other packages/fewer packages. Thanks!


```
~/$ ./xygcc --usage
Usage: xygcc [options] <input file[s]>
        cross compiles on ubuntu x86_64 (tested on 20.04).

        --help|-h|--usage
           output this message

        --setup
           install dependencies for qemu aarch32/aarch64

        --quiet|-q
           suppress output except for errors

        --compiler|-c (default)
           compile with gcc and link into executable

        --assembler|-a
           assemble with as and link into executable

        --aarch64|-a64
           target aarch64
           cannot be used with other target request args

        --aarch32|-a32
           target aarch32
           cannot be used with other target request args

        --x86_64|-x64
           target x86_64
           cannot be used with other target request args

        --x86_32|-x32
           target x86_32
           cannot be used with other target request args

        --dynamic|-d (default)
           dynamically-linked libraries
           cannot be used with --static|-s

        --static|-s
           statically-linked libraries
           cannot be used with --dynamic|-d

        --output|-o <filename>
           specific output filename (a.out default)

        --exec|-e
           execute once built
```
