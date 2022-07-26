FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://bash.bashrc"

do_install:append() {
    install -m 0644 "${WORKDIR}/bash.bashrc" "${D}${sysconfdir}/bash.bashrc"
    install -d -m 0755 "${D}${sysconfdir}/bashrc.d"
}

FILES_${PN} += "${sysconfdir}/bash.bashrc"