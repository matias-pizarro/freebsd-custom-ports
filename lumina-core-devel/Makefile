# Created by: Ken Moore <ken@pcbsd.org>

PORTNAME=	lumina-core
DISTVERSIONPREFIX=	v
DISTVERSION=	1.6.0
PORTREVISION=	2
PKGNAMESUFFIX= -devel
CATEGORIES=	mpizarro x11

MAINTAINER=	lbartoletti@FreeBSD.org
COMMENT=	Lumina Desktop Environment

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/../../LICENSE

BUILD_DEPENDS=	git>=0:devel/git

RUN_DEPENDS=	fluxbox>=0:x11-wm/fluxbox \
		xscreensaver>=0:x11/xscreensaver \
		xbrightness>=0:x11/xbrightness \
		compton>=0:x11-wm/compton \
		xrandr>=0:x11/xrandr \
		numlockx>=0:x11/numlockx
LIB_DEPENDS+=	libxcb-ewmh.so:x11/xcb-util-wm \
		libxcb-icccm.so:x11/xcb-util-wm \
		libxcb-image.so:x11/xcb-util-image \
		libxcb-util.so:x11/xcb-util \
		libXcursor.so:x11/libXcursor

USES=		compiler:c++11-lang gl qmake qt:5 xorg
USE_GL=		gl
USE_XORG=	x11 xdamage xcb
USE_LDCONFIG=	yes
USE_QT=		buildtools_build concurrent core dbus gui imageformats \
		multimedia network svg widgets x11extras
USE_GITHUB=	yes
GH_ACCOUNT=	matias-pizarro
GH_PROJECT=	lumina
GH_TAGNAME=	974014b6
# GH_TAGNAME=	1e0c1d8 # https://github.com/matias-pizarro/lumina/commit/1e0c1d8
# GH_TAGNAME=	3dbfc71 # https://github.com/matias-pizarro/lumina/commit/3dbfc71
# GH_TAGNAME=	300ed02 # https://github.com/matias-pizarro/lumina/commit/300ed02
# GH_TAGNAME=	82901d3 # https://github.com/matias-pizarro/lumina/commit/82901d3
# GH_TAGNAME=	f4675cd # https://github.com/matias-pizarro/lumina/commit/f4675cd
# GH_TAGNAME=	3b5852b # https://github.com/matias-pizarro/lumina/commit/3b5852b
# GH_TAGNAME=	f747ac8 # https://github.com/matias-pizarro/lumina/commit/f747ac8
# GH_TAGNAME=	a12bd68 # https://github.com/matias-pizarro/lumina/commit/a12bd68
# GH_TAGNAME=	915e684 # https://github.com/matias-pizarro/lumina/commit/915e684
# GH_TAGNAME=	bf545b9 # https://github.com/matias-pizarro/lumina/commit/bf545b9
# GH_TAGNAME=	ee85f9b # https://github.com/matias-pizarro/lumina/commit/ee85f9b

OPTIONS_DEFINE=		MULTIMEDIA TRUEOS NLS
OPTIONS_DEFAULT=	MULTIMEDIA
OPTIONS_SUB=		yes

MULTIMEDIA_DESC=	Install multimedia support backend (gstreamer)
TRUEOS_DESC=		Use the TrueOS system interface settings.

TRUEOS_QMAKE_ON=	DEFAULT_SETTINGS=TrueOS

MULTIMEDIA_RUN_DEPENDS=	gstreamer1-plugins-core>=0:multimedia/gstreamer1-plugins-core

NLS_USE=	QT=linguist_build
NLS_QMAKE_ON=	CONFIG+=WITH_I18N

WRKSRC_SUBDIR=	src-qt5/core

CONFLICTS_INSTALL=	lumina-core lumina-1.2.*

.include <bsd.port.mk>
