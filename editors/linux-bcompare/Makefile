# $FreeBSD$

PORTNAME=			bcompare
DISTVERSION=		4.3.6
CATEGORIES=			editors linux
MASTER_SITES=		http://scootersoftware.com/
PKGNAMEPREFIX=		linux-

MAINTAINER=			matias@pizarro.net
COMMENT=			Compare, sync, and merge files and folders

LICENSE=			SCOOTERSOFTWARE
LICENSE_NAME=		Scooter Software License
LICENSE_FILE=		${FILESDIR}/LICENSE.txt
LICENSE_PERMS=		dist-mirror no-dist-sell pkg-mirror no-pkg-sell no-auto-accept

EXTRACT_SUFX=		.rpm
USES=				linux:c7 desktop-file-utils shared-mime-info shebangfix

USE_LINUX=			base:run xorglibs:run qt-x11:run devtools:build
DISTREVISION=		25063
DISTNAME_amd64=		${PORTNAME}-${DISTVERSION}.${DISTREVISION}.x86_64
DISTNAME_i386=		${PORTNAME}-${DISTVERSION}.${DISTREVISION}.i386

NO_WRKSUBDIR=		true

INSTALLS_ICONS=		yes

NO_BUILD=			yes
PLIST_SUB=			LOCALBASE=${LOCALBASE}

.include <bsd.port.options.mk>

.if ${ARCH} == i386
LIBDIR=				lib
.elif ${ARCH} == amd64
LIBDIR=				lib64
.endif

SHEBANG_FILES=		${WRKSRC}/usr/${LIBDIR}/beyondcompare/bcmount.sh \
					${WRKSRC}/usr/${LIBDIR}/beyondcompare/kde_context_menu

do-install:
	${MKDIR} ${STAGEDIR}${LOCALBASE}/lib
	${CP} -rp ${WRKSRC}/usr/${LIBDIR}/beyondcompare ${STAGEDIR}${LOCALBASE}/lib/
	${CP} -rp ${WRKSRC}/usr/bin ${STAGEDIR}${LOCALBASE}/
	${CP} -rp ${WRKSRC}/usr/share ${STAGEDIR}${LOCALBASE}/
	${MKDIR} ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/16x16/apps
	${MKDIR} ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/32x32/apps
	${MKDIR} ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/48x48/apps
	${LN} -sf ../../../../pixmaps/bcompare.png ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/16x16/apps/bcompare.png
	${LN} -sf ../../../../pixmaps/bcomparefull32.png ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/32x32/apps/bcompare.png
	${LN} -sf ../../../../pixmaps/bcompare.png ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/48x48/apps/bcompare.png
	[ ! -d "${STAGEDIR}${LOCALBASE}/lib/beyondcompare/ext" ] || ${FIND} ${STAGEDIR}${LOCALBASE}/lib/beyondcompare/ext -name *.so -exec ${LINUXBASE}/usr/bin/strip {} +
	${LINUXBASE}/usr/bin/gcc -Wall -fPIC -shared ${FILESDIR}/nosched.c -ldl -o ${STAGEDIR}${LOCALBASE}/lib/beyondcompare/nosched.so
	${LN} -sf ${LINUXBASE}/usr/${LIBDIR}/libbz2.so.1.0.6 ${STAGEDIR}${LOCALBASE}/lib/beyondcompare/libbz2.so.1.0

.include <bsd.port.mk>
