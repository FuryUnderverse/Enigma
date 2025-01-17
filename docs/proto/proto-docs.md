<!-- This file is auto-generated. Please do not modify it yourself. -->
# Protobuf Documentation
<a name="top"></a>

## Table of Contents

- [enigma/dao/v1/dao.proto](#enigma/dao/v1/dao.proto)
    - [CoinsExchangePair](#enigma.dao.v1.CoinsExchangePair)
    - [ExchangeWithTreasuryProposal](#enigma.dao.v1.ExchangeWithTreasuryProposal)
    - [FundAccountProposal](#enigma.dao.v1.FundAccountProposal)
    - [FundTreasuryProposal](#enigma.dao.v1.FundTreasuryProposal)
  
- [enigma/dao/v1/params.proto](#enigma/dao/v1/params.proto)
    - [Params](#enigma.dao.v1.Params)
  
- [enigma/dao/v1/genesis.proto](#enigma/dao/v1/genesis.proto)
    - [GenesisState](#enigma.dao.v1.GenesisState)
  
- [enigma/dao/v1/query.proto](#enigma/dao/v1/query.proto)
    - [QueryParamsRequest](#enigma.dao.v1.QueryParamsRequest)
    - [QueryParamsResponse](#enigma.dao.v1.QueryParamsResponse)
    - [QueryTreasuryRequest](#enigma.dao.v1.QueryTreasuryRequest)
    - [QueryTreasuryResponse](#enigma.dao.v1.QueryTreasuryResponse)
  
    - [Query](#enigma.dao.v1.Query)
  
- [Scalar Value Types](#scalar-value-types)



<a name="enigma/dao/v1/dao.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## enigma/dao/v1/dao.proto



<a name="enigma.dao.v1.CoinsExchangePair"></a>

### CoinsExchangePair
CoinsExchangePair is an ask/bid coins pair to exchange.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `coin_ask` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) |  |  |
| `coin_bid` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) |  |  |






<a name="enigma.dao.v1.ExchangeWithTreasuryProposal"></a>

### ExchangeWithTreasuryProposal
ExchangeWithTreasuryProposal details a dao exchange with treasury proposal.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `sender` | [string](#string) |  |  |
| `title` | [string](#string) |  |  |
| `description` | [string](#string) |  |  |
| `coins_pairs` | [CoinsExchangePair](#enigma.dao.v1.CoinsExchangePair) | repeated |  |






<a name="enigma.dao.v1.FundAccountProposal"></a>

### FundAccountProposal
FundAccountProposal details a dao fund account proposal.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `recipient` | [string](#string) |  |  |
| `title` | [string](#string) |  |  |
| `description` | [string](#string) |  |  |
| `amount` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) | repeated |  |






<a name="enigma.dao.v1.FundTreasuryProposal"></a>

### FundTreasuryProposal
FundTreasuryProposal details a dao fund treasury proposal.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `sender` | [string](#string) |  |  |
| `title` | [string](#string) |  |  |
| `description` | [string](#string) |  |  |
| `amount` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) | repeated |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="enigma/dao/v1/params.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## enigma/dao/v1/params.proto



<a name="enigma.dao.v1.Params"></a>

### Params
Params defines the parameters for the module.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `withdraw_reward_period` | [int64](#int64) |  | the period of blocks to withdraw the dao staking reward |
| `pool_rate` | [bytes](#bytes) |  | the rate of total dao's staking coins to keep unstaked |
| `max_proposal_rate` | [bytes](#bytes) |  | the max rage of total dao's staking coins to be allowed in proposals |
| `max_val_commission` | [bytes](#bytes) |  | the max validator's commission to be staked by the dao |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="enigma/dao/v1/genesis.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## enigma/dao/v1/genesis.proto



<a name="enigma.dao.v1.GenesisState"></a>

### GenesisState
GenesisState defines the dao module's genesis state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `params` | [Params](#enigma.dao.v1.Params) |  | the dao module managed params |
| `treasury_balance` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) | repeated | the list of dao module coins |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="enigma/dao/v1/query.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## enigma/dao/v1/query.proto



<a name="enigma.dao.v1.QueryParamsRequest"></a>

### QueryParamsRequest
QueryParamsRequest is request type for the Query/Params RPC method.






<a name="enigma.dao.v1.QueryParamsResponse"></a>

### QueryParamsResponse
QueryParamsResponse is response type for the Query/Params RPC method.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `params` | [Params](#enigma.dao.v1.Params) |  | params holds all the parameters of this module. |






<a name="enigma.dao.v1.QueryTreasuryRequest"></a>

### QueryTreasuryRequest
QueryTreasuryRequest is request type for the Query/Treasury RPC method.






<a name="enigma.dao.v1.QueryTreasuryResponse"></a>

### QueryTreasuryResponse
QueryTreasuryResponse is response type for the Query/Treasury RPC method.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `treasury_balance` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) | repeated |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="enigma.dao.v1.Query"></a>

### Query
Query defines the gRPC querier service.

| Method Name | Request Type | Response Type | Description | HTTP Verb | Endpoint |
| ----------- | ------------ | ------------- | ------------| ------- | -------- |
| `Params` | [QueryParamsRequest](#enigma.dao.v1.QueryParamsRequest) | [QueryParamsResponse](#enigma.dao.v1.QueryParamsResponse) | Parameters queries the parameters of the module. | GET|/enigma/dao/v1/params|
| `Treasury` | [QueryTreasuryRequest](#enigma.dao.v1.QueryTreasuryRequest) | [QueryTreasuryResponse](#enigma.dao.v1.QueryTreasuryResponse) | Treasury queries the dao treasury. | GET|/enigma/dao/v1/treasury|

 <!-- end services -->



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

