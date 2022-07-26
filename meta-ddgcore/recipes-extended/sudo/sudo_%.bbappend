do_install:append () {
    install -d -m 0710 "${D}${sysconfdir}/sudoers.d"
    echo "${ADMIN_USERNAME} ALL=(ALL) NOPASSWD: ALL" > "${D}${sysconfdir}/sudoers.d/0001_${ADMIN_USERNAME}"
    chmod 0440 "${D}${sysconfdir}/sudoers.d/0001_${ADMIN_USERNAME}"
}

FILES_${PN} += "${sysconfdir}/sudoers.d \
                ${sysconfdir}/sudoers.d/0001_${ADMIN_USERNAME}"