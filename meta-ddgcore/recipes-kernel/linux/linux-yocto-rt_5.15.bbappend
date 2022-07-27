require recipes-kernel/linux/linux-yocto_5.15.inc

PR := "${INC_PR}.1"

KBRANCH:amd ?= "v5.15/standard/preempt-rt/base"
SRCREV_machine:amd ?= "0222cbb8d40318cf5377875017e32eebefa59ab8"
