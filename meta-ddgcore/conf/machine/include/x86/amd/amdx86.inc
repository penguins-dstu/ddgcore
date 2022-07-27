PREFERRED_PROVIDER_virtual/kernel ?= "${@bb.utils.contains('RT_KERNEL_AMD', 'yes', 'linux-yocto-rt', 'linux-yocto', d)}"

require conf/machine/include/x86/amd/amd-common-configurations.inc

MACHINE_FEATURES:remove = "screen alsa"
MACHINE_EXTRA_RRECOMMENDS:remove = " rtc-test alsa-utils"

# Disable the graphical console when machine does not have a screen.
# This allows the serial console to be used for installation.
APPEND:remove="${@bb.utils.contains('MACHINE_FEATURES', 'screen-console', '', 'console=tty0', d)}"

MACHINEOVERRIDES =. "amd:amdx86:"