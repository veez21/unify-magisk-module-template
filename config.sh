##########################################################################################
#
# Magisk
# by topjohnwu
#
# SYSTEM/LESS Installation
# by veez21
# 
# This is a template zip for developers
#
##########################################################################################
##########################################################################################
# 
# Instructions:
# 
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (common/config.sh)
# 4. For advanced features, add shell commands into the script files under common:
#    post-fs-data.sh, service.sh
# 5. For changing props, add your additional/modified props into common/system.prop
# 
##########################################################################################
custom_template_version="0.4"
##########################################################################################
# Defines
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

# This will be the folder name under /magisk
# This should also be the same as the id in your module.prop to prevent confusion
MODID=template

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
# ** When system install is used, this will also be used 
#    as a flag if system modding will be done.
AUTOMOUNT=true

# Set to true if you need to load system.prop
# ** When system install is used, the props in
#    system.prop will be put to a script or directly to /system/build.prop (more info below)
PROPFILE=false

# Set to true if you need post-fs-data script
# ** When system install is used, the scripts will
#    go to /su/su.d, /system/su.d (if SuperSU is installed)
#    or /system/etc/init.d
POSTFSDATA=false

# Set to true if you need late_start service script
# ** When system install is used, the scripts will
#    go to /su/su.d, /system/su.d (if SuperSU is installed)
#    or /system/etc/init.d
LATESTARTSERVICE=false

# The minimum and maximum APIs that will be used by the module
# ** Do not make MINAPI greater than MAXAPI or the other way around!
#    Make MINAPI & MAXAPI equal if you want it soecific to only one Android version
#    Leave blank to disable detection
MINAPI=21
MAXAPI=

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "******************************"
  ui_print " System/Less Module Template  "
  ui_print "******************************"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# By default Magisk will merge your files with the original system
# Directories listed here however, will be directly mounted to the correspond directory in the system
# ** When system install is used, the directories listed will be renamed to 'previous-foldername.bak'.
#    Example: /system/app/Youtube -> /system/app/Youtube.bak
#    If PERMANENTDELETE variable is set to true, it will permanently delete the folder from /system.

# You don't need to remove the example below, these values will be overwritten by your own list
# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will overwrite the example
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
"

##########################################################################################
# Install Configuration
##########################################################################################

# You can tweak your installation process by putting Overridable variables (shell) below or in /dev/.config
#   #variables (shell)    #type       #values          #description
#
#   MAGISKINSTALL         magisk      true/false     - forces magisk installation (might conflict with SYSTEMINSTALL)
#   SYSTEMINSTALL         system      true/false     - forces system installation (might conflict with MAGISKINSTALL)
#   INITPATH              system      directories    - sets path to install scripts if system install
#                                                      applies to: post-fs-data.sh, service.sh, prop script
#   BUILDPROP             system      true/false     - sets properties from system.prop directly to build.prop
#   PERMANENTDELETE       system      true/false     - PERMANENTLY delete folders in $REPLACE
#   ERROREXIT          magisk/system  true/false     - exits with an error on every failed attempt to install to Magisk (enabled by default)
#                                                      if disabled, the installer will proceed with installing to /system (if possible)

# The configuration here will be overwritten in /dev/.config
# Leave it blank if you don't need it.
# MAGISKINSTALL is enabled by default to prioritize Magisk.
# To enable auto-detection of installation, leave MAGISKINSTALL and SYSTEMINSTALL blank and ERROREXIT to false.
MAGISKINSTALL=true
SYSTEMINSTALL=
INITPATH=
BUILDPROP=
PERMANENTDELETE=
ERROREXIT=

##########################################################################################
# Permissions
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_permissions() {
  # Default permissions, don't remove them
  set_perm_recursive  $MODPATH  0  0  0755  0644

  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Some templates if you have no idea what to do:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644
}

set_permissions_system() {
  # THIS WILL ONLY GET INVOKED WHEN SYSTEM INSTALL IS USED
  # USE THIS TO SET PERMISSIONS TO SYSTEM FILES
  # SEE set_permissions for instructions.

  # Default permissions, don't remove them
  set_perm  /system/build.prop  0  0  0644
  
  # Add commands below
  
}
