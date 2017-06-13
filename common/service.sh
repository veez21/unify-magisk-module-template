#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
# If magisk.img is not detected, $MODDIR will be blank"" to avoid conflict
# That way you don't have to complicate things yourself by changing $MODDIR
MODDIR=${0%/*}
if [ "${MODDIR%/*}" != "/magisk" ]; then
  MODDIR=""
fi

# This script will be executed in late_start service mode
# More info in the main Magisk thread
# If installed in system, it will be executed almost the same time as post-fs-data
