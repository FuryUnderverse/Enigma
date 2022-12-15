package keeper_test

import (
	"testing"

	"github.com/stretchr/testify/require"

	"github.com/furyunderverse/enigma/testutil/simapp"
	"github.com/furyunderverse/enigma/x/dao/types"
)

func TestKeeper_GetAndSetParams(t *testing.T) {
	type args struct {
		params types.Params
	}

	tests := []struct {
		name string
		args args
	}{
		{
			name: "positive",
			args: args{
				params: types.DefaultParams(),
			},
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			simApp := simapp.Setup()
			ctx := simApp.NewContext()

			simApp.EnigmaApp().DaoKeeper.SetParams(ctx, tt.args.params)
			got := simApp.EnigmaApp().DaoKeeper.GetParams(ctx)

			require.Equal(t, tt.args.params, got)
		})
	}
}
