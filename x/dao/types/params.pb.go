// Code generated by protoc-gen-gogo. DO NOT EDIT.
// source: enigma/dao/v1/params.proto

package types

import (
	fmt "fmt"
	io "io"
	math "math"
	math_bits "math/bits"

	github_com_cosmos_cosmos_sdk_types "github.com/cosmos/cosmos-sdk/types"
	_ "github.com/gogo/protobuf/gogoproto"
	proto "github.com/gogo/protobuf/proto"
)

// Reference imports to suppress errors if they are not otherwise used.
var (
	_ = proto.Marshal
	_ = fmt.Errorf
	_ = math.Inf
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion3 // please upgrade the proto package

// Params defines the parameters for the module.
type Params struct {
	// the period of blocks to withdraw the dao staking reward
	WithdrawRewardPeriod int64 `protobuf:"varint,1,opt,name=withdraw_reward_period,json=withdrawRewardPeriod,proto3" json:"withdraw_reward_period,omitempty" yaml:"withdraw_reward_period"`
	// the rate of total dao's staking coins to keep unstaked
	PoolRate github_com_cosmos_cosmos_sdk_types.Dec `protobuf:"bytes,2,opt,name=pool_rate,json=poolRate,proto3,customtype=github.com/cosmos/cosmos-sdk/types.Dec" json:"pool_rate" yaml:"pool_rate"`
	// the max rage of total dao's staking coins to be allowed in proposals
	MaxProposalRate github_com_cosmos_cosmos_sdk_types.Dec `protobuf:"bytes,3,opt,name=max_proposal_rate,json=maxProposalRate,proto3,customtype=github.com/cosmos/cosmos-sdk/types.Dec" json:"max_proposal_rate" yaml:"max_proposal_rate"`
	// the max validator's commission to be staked by the dao
	MaxValCommission github_com_cosmos_cosmos_sdk_types.Dec `protobuf:"bytes,4,opt,name=max_val_commission,json=maxValCommission,proto3,customtype=github.com/cosmos/cosmos-sdk/types.Dec" json:"max_val_commission" yaml:"max_val_commission"`
}

func (m *Params) Reset()      { *m = Params{} }
func (*Params) ProtoMessage() {}
func (*Params) Descriptor() ([]byte, []int) {
	return fileDescriptor_1367893a600edc4a, []int{0}
}

func (m *Params) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}

func (m *Params) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_Params.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}

func (m *Params) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Params.Merge(m, src)
}

func (m *Params) XXX_Size() int {
	return m.Size()
}

func (m *Params) XXX_DiscardUnknown() {
	xxx_messageInfo_Params.DiscardUnknown(m)
}

var xxx_messageInfo_Params proto.InternalMessageInfo

func (m *Params) GetWithdrawRewardPeriod() int64 {
	if m != nil {
		return m.WithdrawRewardPeriod
	}
	return 0
}

func init() {
	proto.RegisterType((*Params)(nil), "enigma.dao.v1.Params")
}

func init() { proto.RegisterFile("enigma/dao/v1/params.proto", fileDescriptor_1367893a600edc4a) }

var fileDescriptor_1367893a600edc4a = []byte{
	// 358 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x94, 0x92, 0xc1, 0x4e, 0xea, 0x40,
	0x14, 0x86, 0xdb, 0x0b, 0x21, 0xf7, 0x36, 0x37, 0xb9, 0xdc, 0x86, 0x98, 0x6a, 0x62, 0x0b, 0x5d,
	0x18, 0x62, 0x62, 0x27, 0xc4, 0x1d, 0xcb, 0xca, 0x4a, 0x37, 0xa4, 0x0b, 0x4d, 0xdc, 0x34, 0x87,
	0xb6, 0x81, 0xc6, 0x0e, 0x67, 0x32, 0x53, 0x4b, 0xfb, 0x16, 0x2e, 0x5d, 0xfa, 0x1e, 0xbe, 0x00,
	0x4b, 0x96, 0xc6, 0x45, 0x63, 0xe0, 0x0d, 0x78, 0x02, 0xc3, 0x80, 0x28, 0xd1, 0x0d, 0xab, 0x9e,
	0x7e, 0xe7, 0x9f, 0xff, 0xdb, 0x1c, 0xad, 0x85, 0x63, 0xa4, 0x05, 0xe3, 0x98, 0x62, 0x80, 0x09,
	0x09, 0x01, 0x49, 0xd6, 0x21, 0x0c, 0x38, 0x50, 0xe1, 0x48, 0xac, 0x37, 0x76, 0x22, 0x4e, 0x08,
	0xe8, 0x64, 0x9d, 0xa3, 0xc6, 0x10, 0x87, 0x28, 0x21, 0x59, 0x4d, 0xeb, 0xac, 0xfd, 0x5c, 0xd1,
	0x6a, 0x7d, 0xf9, 0x58, 0xbf, 0xd1, 0x0e, 0x26, 0x71, 0x3a, 0x0a, 0x39, 0x4c, 0x7c, 0x1e, 0x4d,
	0x80, 0x87, 0x3e, 0x8b, 0x78, 0x8c, 0xa1, 0xa1, 0x36, 0xd5, 0x76, 0xc5, 0x6d, 0x2d, 0x4b, 0xeb,
	0xb8, 0x00, 0x9a, 0x74, 0xed, 0x9f, 0x73, 0xb6, 0xd7, 0xf8, 0x58, 0x78, 0x92, 0xf7, 0x25, 0xd6,
	0x7d, 0xed, 0x0f, 0x43, 0x4c, 0x7c, 0x0e, 0x69, 0x64, 0xfc, 0x6a, 0xaa, 0xed, 0xbf, 0xae, 0x3b,
	0x2d, 0x2d, 0xe5, 0xb5, 0xb4, 0x4e, 0x86, 0x71, 0x3a, 0xba, 0x1f, 0x38, 0x01, 0x52, 0x12, 0xa0,
	0xa0, 0x28, 0x36, 0x9f, 0x33, 0x11, 0xde, 0x91, 0xb4, 0x60, 0x91, 0x70, 0x7a, 0x51, 0xb0, 0x2c,
	0xad, 0xfa, 0xda, 0xbc, 0x2d, 0xb2, 0xbd, 0xdf, 0xab, 0xd9, 0x83, 0x34, 0xd2, 0x33, 0xed, 0x3f,
	0x85, 0xdc, 0x67, 0x1c, 0x19, 0x0a, 0xd8, 0x88, 0x2a, 0x52, 0x74, 0xb9, 0xb7, 0xc8, 0x58, 0x8b,
	0xbe, 0x15, 0xda, 0xde, 0x3f, 0x0a, 0x79, 0x7f, 0x83, 0xa4, 0xb7, 0xd0, 0xf4, 0x55, 0x2c, 0x83,
	0xc4, 0x0f, 0x90, 0xd2, 0x58, 0x88, 0x18, 0xc7, 0x46, 0x55, 0x8a, 0xaf, 0xf6, 0x16, 0x1f, 0x7e,
	0x8a, 0x77, 0x1b, 0x6d, 0xaf, 0x4e, 0x21, 0xbf, 0x86, 0xe4, 0x62, 0x8b, 0xba, 0xd5, 0xc7, 0x27,
	0x4b, 0x71, 0x7b, 0xd3, 0xb9, 0xa9, 0xce, 0xe6, 0xa6, 0xfa, 0x36, 0x37, 0xd5, 0x87, 0x85, 0xa9,
	0xcc, 0x16, 0xa6, 0xf2, 0xb2, 0x30, 0x95, 0xdb, 0xd3, 0x2f, 0xda, 0xdd, 0x8b, 0x91, 0x7f, 0x24,
	0x97, 0x97, 0x23, 0xf5, 0x83, 0x9a, 0xdc, 0x9d, 0xbf, 0x07, 0x00, 0x00, 0xff, 0xff, 0x16, 0xbc,
	0x25, 0x78, 0x5b, 0x02, 0x00, 0x00,
}

func (m *Params) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *Params) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *Params) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	{
		size := m.MaxValCommission.Size()
		i -= size
		if _, err := m.MaxValCommission.MarshalTo(dAtA[i:]); err != nil {
			return 0, err
		}
		i = encodeVarintParams(dAtA, i, uint64(size))
	}
	i--
	dAtA[i] = 0x22
	{
		size := m.MaxProposalRate.Size()
		i -= size
		if _, err := m.MaxProposalRate.MarshalTo(dAtA[i:]); err != nil {
			return 0, err
		}
		i = encodeVarintParams(dAtA, i, uint64(size))
	}
	i--
	dAtA[i] = 0x1a
	{
		size := m.PoolRate.Size()
		i -= size
		if _, err := m.PoolRate.MarshalTo(dAtA[i:]); err != nil {
			return 0, err
		}
		i = encodeVarintParams(dAtA, i, uint64(size))
	}
	i--
	dAtA[i] = 0x12
	if m.WithdrawRewardPeriod != 0 {
		i = encodeVarintParams(dAtA, i, uint64(m.WithdrawRewardPeriod))
		i--
		dAtA[i] = 0x8
	}
	return len(dAtA) - i, nil
}

func encodeVarintParams(dAtA []byte, offset int, v uint64) int {
	offset -= sovParams(v)
	base := offset
	for v >= 1<<7 {
		dAtA[offset] = uint8(v&0x7f | 0x80)
		v >>= 7
		offset++
	}
	dAtA[offset] = uint8(v)
	return base
}

func (m *Params) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	if m.WithdrawRewardPeriod != 0 {
		n += 1 + sovParams(uint64(m.WithdrawRewardPeriod))
	}
	l = m.PoolRate.Size()
	n += 1 + l + sovParams(uint64(l))
	l = m.MaxProposalRate.Size()
	n += 1 + l + sovParams(uint64(l))
	l = m.MaxValCommission.Size()
	n += 1 + l + sovParams(uint64(l))
	return n
}

func sovParams(x uint64) (n int) {
	return (math_bits.Len64(x|1) + 6) / 7
}

func sozParams(x uint64) (n int) {
	return sovParams(uint64((x << 1) ^ uint64((int64(x) >> 63))))
}

func (m *Params) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowParams
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: Params: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: Params: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 0 {
				return fmt.Errorf("proto: wrong wireType = %d for field WithdrawRewardPeriod", wireType)
			}
			m.WithdrawRewardPeriod = 0
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowParams
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				m.WithdrawRewardPeriod |= int64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
		case 2:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field PoolRate", wireType)
			}
			var byteLen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowParams
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				byteLen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if byteLen < 0 {
				return ErrInvalidLengthParams
			}
			postIndex := iNdEx + byteLen
			if postIndex < 0 {
				return ErrInvalidLengthParams
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			if err := m.PoolRate.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		case 3:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field MaxProposalRate", wireType)
			}
			var byteLen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowParams
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				byteLen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if byteLen < 0 {
				return ErrInvalidLengthParams
			}
			postIndex := iNdEx + byteLen
			if postIndex < 0 {
				return ErrInvalidLengthParams
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			if err := m.MaxProposalRate.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		case 4:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field MaxValCommission", wireType)
			}
			var byteLen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowParams
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				byteLen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if byteLen < 0 {
				return ErrInvalidLengthParams
			}
			postIndex := iNdEx + byteLen
			if postIndex < 0 {
				return ErrInvalidLengthParams
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			if err := m.MaxValCommission.Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipParams(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthParams
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}

func skipParams(dAtA []byte) (n int, err error) {
	l := len(dAtA)
	iNdEx := 0
	depth := 0
	for iNdEx < l {
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return 0, ErrIntOverflowParams
			}
			if iNdEx >= l {
				return 0, io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		wireType := int(wire & 0x7)
		switch wireType {
		case 0:
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowParams
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				iNdEx++
				if dAtA[iNdEx-1] < 0x80 {
					break
				}
			}
		case 1:
			iNdEx += 8
		case 2:
			var length int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowParams
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				length |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if length < 0 {
				return 0, ErrInvalidLengthParams
			}
			iNdEx += length
		case 3:
			depth++
		case 4:
			if depth == 0 {
				return 0, ErrUnexpectedEndOfGroupParams
			}
			depth--
		case 5:
			iNdEx += 4
		default:
			return 0, fmt.Errorf("proto: illegal wireType %d", wireType)
		}
		if iNdEx < 0 {
			return 0, ErrInvalidLengthParams
		}
		if depth == 0 {
			return iNdEx, nil
		}
	}
	return 0, io.ErrUnexpectedEOF
}

var (
	ErrInvalidLengthParams        = fmt.Errorf("proto: negative length found during unmarshaling")
	ErrIntOverflowParams          = fmt.Errorf("proto: integer overflow")
	ErrUnexpectedEndOfGroupParams = fmt.Errorf("proto: unexpected end of group")
)
