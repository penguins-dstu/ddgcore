do_install:append () {
    install -d -m 0710 "${D}/etc/sudoers.d"
    echo "${ADMIN_USERNAME} ALL=(ALL) NOPASSWD: ALL" > "${D}/etc/sudoers.d/0001_${ADMIN_USERNAME}"
    chmod 0440 "${D}/etc/sudoers.d/0001_${ADMIN_USERNAME}"
}

FILES_${PN} += "/etc/sudoers.d \
                /etc/sudoers.d/0001_${ADMIN_USERNAME}"