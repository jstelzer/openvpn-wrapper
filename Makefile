SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >
all:
> cargo build --release
clean:
> cargo clean

install:
> sudo cp target/release/vpn-wrapper /usr/local/bin/vpn-wrapper
> sudo chown root:root /usr/local/bin/vpn-wrapper
> sudo chmod u+s /usr/local/bin/vpn-wrapper
