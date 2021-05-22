# Created by: Matías Pizarro <matias@pizarro.net>

PORTNAME=	sublime-text
DISTVERSION=	4107
CATEGORIES= editors linux
MASTER_SITES=	https://download.sublimetext.com/
PKGNAMEPREFIX=	linux-

MAINTAINER=	matias@pizarro.net
COMMENT=	Sophisticated text editor for code, markup and prose

LICENSE=				SUBLIMEHQ
LICENSE_NAME=			End User License Agreement
LICENSE_FILE=			${FILESDIR}/LICENSE.txt
LICENSE_PERMS=			dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

ONLY_FOR_ARCHS=			amd64 arm64
ONLY_FOR_ARCHS_REASON=	Upstream only supports amd64 and arm64

USES=		desktop-file-utils gnome linux tar:xz ssl
USE_LINUX=	gtk3

DISTNAME_amd64=	sublime_text_build_${DISTVERSION}_x64
DISTNAME_arm64=	sublime_text_build_${DISTVERSION}_arm64

INSTALLS_ICONS=	yes
WRKSRC=		${WRKDIR}/sublime_text

CONFLICTS_INSTALL=	linux-sublime[0-9]*

NO_BUILD=	yes
SUB_FILES=	sublime

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR} \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/16x16/apps/ \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/32x32/apps/ \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/48x48/apps/ \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/128x128/apps/ \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/256x256/apps/

	${INSTALL_DATA} ${WRKSRC}/Icon/16x16/sublime-text.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/16x16/apps/
	${INSTALL_DATA} ${WRKSRC}/Icon/32x32/sublime-text.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/32x32/apps/
	${INSTALL_DATA} ${WRKSRC}/Icon/48x48/sublime-text.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/48x48/apps/
	${INSTALL_DATA} ${WRKSRC}/Icon/128x128/sublime-text.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/128x128/apps/
	${INSTALL_DATA} ${WRKSRC}/Icon/256x256/sublime-text.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/256x256/apps/
	${INSTALL_DATA} ${WRKSRC}/sublime_text.desktop ${STAGEDIR}${PREFIX}/share/applications/
	cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${WRKDIR}/sublime ${STAGEDIR}${PREFIX}/bin/sublime
post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/share/sublime-text/libcrypto.so.1.1

.include <bsd.port.mk>
