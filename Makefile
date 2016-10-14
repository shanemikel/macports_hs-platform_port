REPO=https://svn.macports.org/repository/macports/trunk
REV=153494

.PHONY:
checkout: \
  dports/_resources/port1.0/group/haskell-1.0.tcl \
  dports/devel/haskell-platform \
  dports/lang/ghc \
  dports/lang/ghc-bootstrap

dports:
	svn co --depth empty -r${REV} ${REPO}/dports

.ONESHELL:
dports/_resources: dports
	cd dports
	svn co --depth empty -r${REV} ${REPO}/dports/_resources

.ONESHELL:
dports/_resources/port1.0: dports/_resources
	cd dports/_resources
	svn co --depth empty -r${REV} ${REPO}/dports/_resources/port1.0

.ONESHELL:
dports/_resources/port1.0/group: dports/_resources/port1.0
	cd dports/_resources/port1.0
	svn co --depth empty -r${REV} ${REPO}/dports/_resources/port1.0/group

.ONESHELL:
dports/_resources/port1.0/group/haskell-1.0.tcl: dports/_resources/port1.0/group
	cd dports/_resources/port1.0/group
	svn up -r${REV} haskell-1.0.tcl

.ONESHELL:
dports/devel: dports
	cd dports
	svn co --depth empty -r${REV} ${REPO}/dports/devel

.ONESHELL:
dports/devel/haskell-platform: dports/devel
	cd dports/devel
	svn co -r${REV} ${REPO}/dports/devel/haskell-platform

.ONESHELL:
dports/lang: dports
	cd dports
	svn co --depth empty -r${REV} ${REPO}/dports/lang

.ONESHELL:
dports/lang/ghc: dports/lang
	cd dports/lang
	svn co -r${REV} ${REPO}/dports/lang/ghc

.ONESHELL:
dports/lang/ghc-bootstrap: dports/lang
	cd dports/lang
	svn co -r${REV} ${REPO}/dports/lang/ghc-bootstrap

.PHONY:
clean:
	rm -rf dports
