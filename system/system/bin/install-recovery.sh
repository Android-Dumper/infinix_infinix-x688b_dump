#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:40894464:8fd37d54151395a12a4d7b79ca38391ff6fb254a; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:7986efc63dd69da067d5e2ed4617a628eb91c7d6 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:40894464:8fd37d54151395a12a4d7b79ca38391ff6fb254a && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
