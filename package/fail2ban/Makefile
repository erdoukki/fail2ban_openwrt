#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fail2ban
PKG_VERSION:=0.11.2
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=$(PKG_VERSION)
PKG_SOURCE_URL:=https://github.com/fail2ban/fail2ban
PKG_MIRROR_HASH:=1899888a178e2a7d8b7234afcd96387559a7781fb4aa621c9288258e74753f47
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
#PKG_BUILD_DEPENDS:=python3

PKG_INSTALL:=1
HOST_BUILD_DEPENDS:=python3/host

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE.txt
PKG_MAINTAINER:=Gerald Kerma <gandalf@gk2.net>

#PKG_UNPACK=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)
#HOST_UNPACK=$(HOST_TAR) -C $(HOST_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

include $(TOPDIR)/feeds/packages/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python3-package.mk

define Package/fail2ban
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Fail2Ban: ban hosts that cause multiple authentication errors
	URL:=https://www.fail2ban.org/
	DEPENDS:= \
		+libinotifytools	\
		+python3		\
		+python3-dns		\
		+python3-ctypes		\
		+python3-distutils	\
		+python3-email		\
		+python3-logging	\
		+python3-sqlite3	\
		+python3-urllib		\
		+python3-lib2to3
#	PKGARCH:=all
endef

define Package/fail2ban/description
Fail2Ban scans log files like /var/log/auth.log and bans IP addresses conducting too many failed login attempts.
endef

define Package/fail2ban/conffiles
/etc/fail2ban/
/etc/config/fail2ban
endef

#define Build/Compile
#	$(call Build/Compile/Py3Mod,,install --prefix=/usr --root="$(PKG_INSTALL_DIR)")
#endef

define Build/InstallDev
	$(call HostPython3/Run,,$(HOST_PYTHON3_PIP_INSTALL_HOST) pyinotify)
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	cd $(PKG_BUILD_DIR) && ./fail2ban-2to3
endef

define Package/fail2ban/install
#define Py3Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/fail2ban/action.d
	$(INSTALL_DIR) $(1)/etc/fail2ban/fail2ban.d
	$(CP) ./files/etc/init.d/fail2ban.init $(1)/etc/init.d/fail2ban
	$(CP) ./files/etc/fail2ban/action.d/* $(1)/etc/fail2ban/action.d/
	$(CP) ./files/etc/fail2ban/fail2ban.d/uci.conf $(1)/etc/fail2ban/fail2ban.d/uci.conf
	$(INSTALL_CONF) ./files/etc/config/fail2ban $(1)/etc/config/fail2ban
endef

#define Host/Compile
#	$(call HostPython3/ModSetup,,install --prefix="/usr" --root="$(STAGING_DIR_HOSTPKG)")
#endef

#Host/Install:=

#$(eval $(call HostBuild))

$(eval $(call Py3Package,fail2ban))
$(eval $(call BuildPackage,fail2ban))
#$(eval $(call BuildPackage,fail2ban-src))
