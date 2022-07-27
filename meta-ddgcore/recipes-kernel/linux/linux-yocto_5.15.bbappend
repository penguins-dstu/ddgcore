require recipes-kernel/linux/linux-yocto_5.15.inc

PR := "${INC_PR}.1"

KBRANCH:amd ?= "v5.15/standard/base"
SRCREV_machine:amd ?= "ebfb1822e9f9726d8c587fc0f60cfed43fa0873e"
