# TWRP for Lenovo TB-J706F

独立的原版 TWRP 构建项目，不集成 OrangeFox。

- Device: Lenovo TB-J706F
- Codename: pearl_prc_wifi (device tree product: J706F)
- SoC: Qualcomm SM7150 / Snapdragon 730G
- Base tree: HK4567/twrp_device_lenovo_TB-J706F, branch Android-10
- Build system: minimal-manifest-twrp/platform_manifest_twrp_omni, branch twrp-10.0-deprecated
- Build target: recoveryimage
- Required feature: userspace fastbootd

## Build

GitHub Actions starts on pushes to main and can also be started manually from the Actions tab.

The workflow uses the upstream J706F Android 10 device tree and its checked-in prebuilt kernel, DTB and DTBO. It also syncs TeamWin's Android 10 Qualcomm common recovery trees.

## Important

A successful compile is not proof that the image is safe to flash or that fastbootd works on the tablet. The first artifact is for boot/testing only. Verify recovery boot, touch, ADB, USB, partition mapping and fastbootd on the actual TB-J706F before any partition flashing.

No J716F images or partition assumptions are used.
