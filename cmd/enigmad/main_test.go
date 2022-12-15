package main

import (
	"testing"
	"time"

	"github.com/furyunderverse/enigma/testutil/integration"
)

var bootstrappingTimeout = time.Minute // nolint:gochecknoglobals

func TestInitAndRunChain(t *testing.T) {
	// run enigma chain
	enigmaChain, err := integration.NewEnigmaChain()
	if err != nil {
		t.Fatal(err)
	}

	if err := enigmaChain.Start(bootstrappingTimeout); err != nil {
		t.Fatal(err)
	}
}
