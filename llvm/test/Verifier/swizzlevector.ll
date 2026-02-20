; RUN: not llvm-as < %s 2>&1 | FileCheck %s

define <16 x i8> @bad_mask_element_type(<16 x i8> %x, <16 x i8> %y, <16 x float> %z) {
; CHECK: invalid swizzlevector operands
  %r = swizzlevector <16 x i8> %x, <16 x i8> %y, <16 x float> %z
  ret <16 x i8> %r
}
