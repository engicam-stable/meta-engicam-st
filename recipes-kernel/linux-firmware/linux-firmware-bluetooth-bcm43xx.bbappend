do_install:append:stm32mp15common() {
    install -d ${D}${nonarch_base_libdir}/firmware/brcm/

    # Remove 43430 files
    #rm ${D}${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd
    #rm ${D}${nonarch_base_libdir}/firmware/LICENCE.cypress_bcm4343
    #rm ${D}${nonarch_base_libdir}/firmware/brcm/BCM.st,stm32mp157f-dk2.hcd
    #rm ${D}${nonarch_base_libdir}/firmware/brcm/BCM.st,stm32mp135f-dk.hcd

    # 4373
    install -m 644 ${S}/LICENCE.cypress ${D}${nonarch_base_libdir}/firmware/LICENCE.cypress_bcm4373
    install -m 644 ${S}/BCM4373A0_001.001.025.0103.0155.FCC.CE.2AE.hcd ${D}${nonarch_base_libdir}/firmware/brcm/BCM4373A0.hcd
    cd ${D}${nonarch_base_libdir}/firmware/brcm/
    ln -sf BCM4373A0.hcd BCM.st,stm32mp157a-ugea-microgea-mx.hcd
}

do_install:append:stm32mp2common() {
    install -d ${D}${nonarch_base_libdir}/firmware/brcm/

    # 43430
    install -m 644 ${S}/BCM43430A1_001.002.009.0159.0528.1DX.hcd ${D}${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd
    install -m 644 ${S}/LICENCE.cypress ${D}${nonarch_base_libdir}/firmware/LICENCE.cypress_bcm4343
    cd ${D}${nonarch_base_libdir}/firmware/brcm/
    ln -sf BCM43430A1.hcd BCM.st,stm32mp257f-icore-edimm2-mx.hcd
    ln -sf BCM43430A1.hcd BCM.st,stm32mp257d-icored-edimm2-mx.hcd
}
