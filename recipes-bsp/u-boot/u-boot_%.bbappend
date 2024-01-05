FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRCREV = "43f2873fa98b1da6eb56d756315c7bd7db63db27"

SRC_URI:append:rpi = " \
    file://fw_env.config \
"

SRC_URI:append:raspberrypi5 = " \
	file://0001-rpi5-add-initial-memory-map-for-bcm2712.patch \
	file://0002-rpi5-Use-devicetree-as-alternative-way-to-read-IO-ba.patch \
	file://0003-rpi5-Use-devicetree-to-retrieve-board-revision.patch \
	file://0004-bcm2835-brcm-bcm2708-fb-device-is-using-r5g6b5-forma.patch \
	file://0005-mmc-bcmstb-Add-support-for-bcm2712-SD-controller.patch \
	file://0006-configs-rpi_arm64-enable-SDHCI-BCMSTB-driver.patch \
	file://0007-pci-pcie-brcmstb-Add-bcm2712-PCIe-controller-support.patch \
	file://0008-configs-rpi_5_arm64_defconfig-bcm2712-rpi-5-b.dts.patch \
"

SRC_URI:append:rpi = " file://0001-rpi-always-set-fdt_addr-with-firmware-provided-FDT-address.patch"

DEPENDS:append:rpi = " u-boot-default-script"

do_install:append:rpi () {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}
