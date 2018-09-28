XGO_DIR=`dirname "$(realpath "${BASH_SOURCE[0]}")"`

export PATH=$PATH:$XGO_DIR/bin
export GOPATH=/mac/go/pkgs
export GOCACHE=$XGO_DIR/go-build
export CGO_ENABLED=1
export "CGO_LDFLAGS_ALLOW=-s"
export "CC=gcc -O3"
export "CGO_CFLAGS=-O3 -Wno-builtin-requires-header"
export "CGO_CXXFLAGS=$CGO_CFLAGS"
export CGO_FFLAGS=-O3
export CGO_LDFLAGS=-O3
