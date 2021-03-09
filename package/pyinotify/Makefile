#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-pyinotify
PKG_VERSION:=0.9.6
PKG_RELEASE:=1

PYPI_NAME:=pyinotify
PKG_HASH:=skip

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Gerald Kerma <gandalf@gk2.net>

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/python3-pyinotify
	SUBMENU:=Python
	SECTION:=lang
	CATEGORY:=Languages
	TITLE:=Pyinotify is a Python module for monitoring filesystems changes.
	URL:=http://github.com/seb-m/pyinotify
	DEPENDS:= +python3-light
endef

define Package/python3-pyinotify/description
Pyinotify is a Python module for monitoring filesystems changes.
endef

$(eval $(call Py3Package,python3-pyinotify))
$(eval $(call BuildPackage,python3-pyinotify))
$(eval $(call BuildPackage,python3-pyinotify-src))
