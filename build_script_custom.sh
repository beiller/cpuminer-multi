#CC="gcc -DHAVE_CONFIG_H -I.  -pthread    -falign-loops=16 -falign-functions=16 -falign-jumps=16 -falign-labels=16  -Ofast -flto -fuse-linker-plugin -funroll-loops -fvariable-expansion-in-unroller -ftree-loop-if-convert-stores -fmerge-all-constants -fbranch-target-load-optimize2 -fsched2-use-superblocks -maes  -march=native -O2"
#CC2="gcc -falign-loops=16 -falign-functions=16 -falign-jumps=16 -falign-labels=16  -Ofast -flto -fuse-linker-plugin -funroll-loops -fvariable-expansion-in-unroller -ftree-loop-if-convert-stores -fmerge-all-constants -fbranch-target-load-optimize2 -fsched2-use-superblocks -maes  -march=native -O2"
CC="clang -maes -O4 -Ofast -march=native -fomit-frame-pointer -funroll-loops -ffast-math"
CC2="clang -maes -O4 -Ofast -march=native -fomit-frame-pointer -funroll-loops -ffast-math"

$CC -c -o minerd-cpu-miner.o cpu-miner.c

$CC -c -o minerd-util.o util.c

$CC -c -o minerd-cryptonight_common.o cryptonight_common.c

$CC -c -o crypto/minerd-c_keccak.o crypto/c_keccak.c

$CC -c -o crypto/minerd-c_groestl.o crypto/c_groestl.c

$CC -c -o crypto/minerd-c_blake256.o crypto/c_blake256.c

$CC -c -o crypto/minerd-c_jh.o crypto/c_jh.c

$CC -c -o crypto/minerd-c_skein.o crypto/c_skein.c

$CC -c -o minerd-cryptonight.o cryptonight_aesni.c
#$CC -c -o minerd-cryptonight.o cryptonight.c

$CC2 -o minerd2 \
minerd-cpu-miner.o \
minerd-util.o \
minerd-cryptonight_common.o \
crypto/minerd-c_keccak.o \
crypto/minerd-c_groestl.o \
crypto/minerd-c_blake256.o \
crypto/minerd-c_jh.o \
crypto/minerd-c_skein.o \
minerd-cryptonight.o -L/usr/lib/x86_64-linux-gnu -lcurl -ljansson -lpthread


