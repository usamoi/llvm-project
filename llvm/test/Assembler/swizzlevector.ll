; RUN: llvm-as < %s | llvm-dis | FileCheck %s

define <4 x i32> @swizzle(<4 x i32> %x, <4 x i32> %y, <4 x i8> %mask) {
; CHECK-LABEL: @swizzle(
; CHECK: swizzlevector <4 x i32> %x, <4 x i32> %y, <4 x i8> %mask
  %r = swizzlevector <4 x i32> %x, <4 x i32> %y, <4 x i8> %mask
  ret <4 x i32> %r
}
