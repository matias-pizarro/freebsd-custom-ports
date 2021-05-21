# Created by: Matías Pizarro <matias@pizarro.net>

PORTNAME=	sublime-merge
DISTVERSION=	2056
CATEGORIES=	mpizarro editors linux
MASTER_SITES=	https://download.sublimetext.com/
PKGNAMEPREFIX=	linux-
DISTNAME_amd64=	sublime_merge_build_${DISTVERSION}_x64

MAINTAINER=	matias@pizarro.net
COMMENT=	Sophisticated Git client by the creators of Sublime Text

LICENSE=				SUBLIMEHQ
LICENSE_NAME=			End User License Agreement
LICENSE_FILE=			${FILESDIR}/LICENSE.txt
LICENSE_PERMS=			dist-mirror no-dist-sell pkg-mirror no-pkg-sell

ONLY_FOR_ARCHS=			amd64
ONLY_FOR_ARCHS_REASON=	Upstream only supports amd64

USES=		desktop-file-utils gnome linux tar:xz
USE_LINUX=	gtk3

INSTALLS_ICONS=	yes
WRKSRC=		${WRKDIR}/sublime_merge

NO_BUILD=	yes
SUB_FILES=	sublime

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR} \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/16x16/apps/ \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/32x32/apps/ \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/48x48/apps/ \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/128x128/apps/ \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/256x256/apps/

	${INSTALL_DATA} ${WRKSRC}/Icon/16x16/sublime-merge.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/16x16/apps/
	${INSTALL_DATA} ${WRKSRC}/Icon/32x32/sublime-merge.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/32x32/apps/
	${INSTALL_DATA} ${WRKSRC}/Icon/48x48/sublime-merge.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/48x48/apps/
	${INSTALL_DATA} ${WRKSRC}/Icon/128x128/sublime-merge.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/128x128/apps/
	${INSTALL_DATA} ${WRKSRC}/Icon/256x256/sublime-merge.png ${STAGEDIR}${PREFIX}/share/icons/hicolor/256x256/apps/
	${INSTALL_DATA} ${WRKSRC}/sublime_merge.desktop ${STAGEDIR}${PREFIX}/share/applications/
	cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR}
	${INSTALL_SCRIPT} ${WRKDIR}/sublime ${STAGEDIR}${PREFIX}/bin/sublime_merge

.include <bsd.port.mk>
