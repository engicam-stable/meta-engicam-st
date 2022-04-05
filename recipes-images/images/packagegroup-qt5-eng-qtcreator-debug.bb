# Copyright (C) 2014 O.S. Systems Software LTDA.

SUMMARY = "Remote debugging tools for QtCreator integration"
LICENSE = "MIT"

inherit packagegroup

# Override by distro if needed

RDEPENDS_${PN} = " \
    gdbserver \
    openssh-sftp-server \
    qtdeclarative \
"
