do_install:append:stm32mpcommon() {
   # Add symlinks for newest kernel compatibility
   rm brcmfmac4373-sdio.st,stm32mp215f-dk.bin
   ln -sf brcmfmac4373-sdio.bin brcmfmac4373-sdio.st,stm32mp157a-ugea-microdev-mx.bin
}

FILES:${PN}-bcm4373:remove:stm32mpcommon = " \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.st,stm32mp215f-dk.* \
"

FILES:${PN}-bcm4373:append:stm32mpcommon = " \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4373-sdio.st,stm32mp157a-ugea-microdev-mx.* \
"

