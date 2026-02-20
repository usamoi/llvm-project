; RUN: llc -global-isel=0 -mtriple=x86_64-unknown-linux-gnu -mattr=+ssse3 -O2 < %s | FileCheck %s --check-prefix=SSSE3
; RUN: llc -global-isel=0 -mtriple=x86_64-unknown-linux-gnu -mattr=-ssse3 -O2 < %s | FileCheck %s --check-prefix=NOSSSE3

define <16 x i8> @swizzle_dyn(<16 x i8> %x, <16 x i8> %mask) {
; SSSE3-LABEL: swizzle_dyn:
; SSSE3: {{[[:space:]]pshufb[[:space:]]}}
; NOSSSE3-LABEL: swizzle_dyn:
; NOSSSE3-NOT: {{[[:space:]]pshufb[[:space:]]}}
  %res = swizzlevector <16 x i8> %x, <16 x i8> poison, <16 x i8> %mask
  ret <16 x i8> %res
}
