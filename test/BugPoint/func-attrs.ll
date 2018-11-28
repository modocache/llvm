; RUN: bugpoint -load %llvmshlibdir/BugpointPasses%shlibext %s -output-prefix %t -bugpoint-crashfuncattr -silence-passes
; RUN: llvm-dis %t-reduced-simplified.bc -o - | FileCheck %s
; REQUIRES: loadable_module

; CHECK: f() #0
define void @f() #0 {
  ret void
}

; CHECK: "bugpoint-crash"
; CHECK-NOT: inline
attributes #0 = { noinline "bugpoint-crash" "no-frame-pointer-elim-non-leaf" }
