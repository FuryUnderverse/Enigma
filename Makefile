PACKAGES=$(shell go list ./... | grep -v '/simulation')
VERSION := $(shell git describe --abbrev=6 --dirty --always --tags)
COMMIT := $(shell git log -1 --format='%H')
IMPORT_PREFIX=github.com/furyunderverse
SCAN_FILES := $(shell find . -type f -name '*.go' -not -name '*mock.go' -not -name '*_gen.go' -not -path "*/vendor/*")

build_tags = netgo
ifeq ($(LEDGER_ENABLED),true)
  ifeq ($(OS),Windows_NT)
    GCCEXE = $(shell where gcc.exe 2> NUL)
    ifeq ($(GCCEXE),)
      $(error gcc.exe not installed for ledger support, please install or set LEDGER_ENABLED=false)
    else
      build_tags += ledger
    endif
  else
    UNAME_S = $(shell uname -s)
    ifeq ($(UNAME_S),OpenBSD)
      $(warning OpenBSD detected, disabling ledger support (https://github.com/cosmos/cosmos-sdk/issues/1988))
    else
      GCC = $(shell command -v gcc 2> /dev/null)
      ifeq ($(GCC),)
        $(error gcc not installed for ledger support, please install or set LEDGER_ENABLED=false)
      else
        build_tags += ledger
      endif
    endif
  endif
endif

ifeq (cleveldb,$(findstring cleveldb,$(ENIGMA_BUILD_OPTIONS)))
  build_tags += gcc
endif
build_tags += $(BUILD_TAGS)
build_tags := $(strip $(build_tags))

whitespace :=
whitespace += $(whitespace)
comma := ,
build_tags_comma_sep := $(subst $(whitespace),$(comma),$(build_tags))

ldflags = -X github.com/cosmos/cosmos-sdk/version.Name=enigma \
	-X github.com/cosmos/cosmos-sdk/version.AppName=enigma \
	-X github.com/cosmos/cosmos-sdk/version.Version=$(VERSION) \
	-X github.com/cosmos/cosmos-sdk/version.Commit=$(COMMIT) \
	-X "github.com/cosmos/cosmos-sdk/version.BuildTags=$(build_tags_comma_sep)" \

BUILD_FLAGS := -ldflags '$(ldflags)' -gcflags="all=-N -l"

.PHONY: all
all: lint proto-lint test install

.PHONY: build
build: go.sum
		go build $(BUILD_FLAGS) ./cmd/enigmad

.PHONY: install
install: go.sum
		go install $(BUILD_FLAGS) ./cmd/enigmad

.PHONY: go.sum
go.sum: go.mod
		@echo "--> Ensure dependencies have not been modified"
		GO111MODULE=on go mod verify

.PHONY: test
test:
	@go test -mod=readonly $(PACKAGES)

# ALCHEMY_KEY env variable is required for the tests execution
.PHONY: test-integration
test-integration:
	@go test -v ./tests/... -tags=integration

.PHONY: build-load-test
build-load-test:
	go build -tags tmload -o build/enigma-load-test ./tests/tm-load-test/enigma-load-test/

.PHONY: lint
lint:
	golangci-lint -c .golangci.yml run
	gofmt -d -s $(SCAN_FILES)

.PHONY: format
format:
	gofumpt -lang=1.6 -extra -s -w $(SCAN_FILES)
	gogroup -order std,other,prefix=$(IMPORT_PREFIX) -rewrite $(SCAN_FILES)

###############################################################################
###                                Protobuf                                 ###
###############################################################################

.PHONY: proto-gen-all
proto-gen-all: proto-gen-go proto-gen-openapi

.PHONY: proto-gen-openapi
proto-gen-openapi:
	bash ./dev/scripts/protoc-swagger-gen.sh

.PHONY: proto-gen-go
proto-gen-go:
	bash ./dev/scripts/protocgen.sh
	go mod tidy
	make format

.PHONY: proto-lint
proto-lint:
	buf lint proto --config buf.yaml

###############################################################################
###                      Docker wrapped commands                            ###
###############################################################################

.PHONY: in-docker
in-docker:
	docker build -t enigma-dev-utils ./dev/tools -f dev/tools/devtools.Dockerfile
	docker run -i --rm \
		-v ${PWD}:/go/src/github.com/furyunderverse/enigma:delegated \
		--mount source=dev-tools-cache,destination=/cache/,consistency=delegated enigma-dev-utils bash -x -c "\
		$(ARGS)"

.PHONY: lint-in-docker
lint-in-docker:
	make in-docker ARGS="make lint"

.PHONY: format-in-docker
format-in-docker:
	make in-docker ARGS="make format"

.PHONY: all-in-docker
all-in-docker:
	make in-docker ARGS="make all"

.PHONY: proto-gen-all-in-docker
proto-gen-all-in-docker:
	make in-docker ARGS="make proto-gen-all"