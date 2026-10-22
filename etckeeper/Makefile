include $(TOPDIR)/rules.mk

PKG_NAME:=etckeeper
PKG_VERSION:=1.18.23
PKG_RELEASE:=1

PKG_LICENSE:=GPL-2.0-or-later
PKG_INSTALL:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://distfiles.alpinelinux.org/distfiles/v3.25/
PKG_SOURCE_DATE:=2025-08-16
PKG_HASH:=cfd068f1f7ae64702747e4ea77e089168743c8b889b941577eac8fc67c232e8c

include $(INCLUDE_DIR)/package.mk

define Package/etckeeper
  SECTION:=admin
  CATEGORY:=Administration
  TITLE:=Store your /etc in a VCS repository
  URL:=https://etckeeper.branchable.com/
  PKGARCH:=all
endef

define Package/etckeeper/description
 etckeeper is a tool to let /etc be stored in a Git, Mercurial, or Darcs repository.
 It hooks into apk to automatically commit changes made to /etc during package upgrades.
 It tracks file metadata that version control systems do not normally support, but that is important for /etc, such as the permissions of /etc/shadow.
 It's quite modular and configurable, while also being simple to use if you understand the basics of working with version control.
 etckeeper supports several VCS backends, so this package doesn't explicitly depend on git. You are expected to install it manually.
endef

define Package/conffiles
/etc/etckeeper/
endef

define Build/Compile
	# Do nothing: we're not building bzr or DNF support
endef

define Package/etckeeper/install
	ls -lR $(PKG_BUILD_DIR)
	ls -lR $(PKG_INSTALL_DIR)
	$(INSTALL_DIR) $(1)/etc
	$(CP) $(PKG_INSTALL_DIR)/etc/etckeeper $(1)/etc/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/etckeeper $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/apk/commit_hooks.d
	$(INSTALL_BIN) ./files/apk.hook $(1)/etc/apk/commit_hooks.d/etckeeper
endef
 
$(eval $(call BuildPackage,etckeeper))
