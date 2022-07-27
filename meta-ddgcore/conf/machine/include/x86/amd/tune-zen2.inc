require conf/machine/include/x86/amd/tune-amd64.inc

TUNEVALID[zen2] = "Enable AMD x86 (64 bit) Zen 2 Core Architecture specific optimizations."
TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'zen2', ' -march=znver2', '', d)}"
TUNE_FEATURES:tune-amd64 = "m64 zen2"