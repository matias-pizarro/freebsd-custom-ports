# $FreeBSD$

PORTNAME=			bcompare
DISTVERSION=		4.3.6
CATEGORIES=			editors linux
MASTER_SITES=		http://scootersoftware.com/
PKGNAMEPREFIX=		linux-
DISTNAME=			${PORTNAME}-${DISTVERSION}.${DISTREVISION}

MAINTAINER=			matias@pizarro.net
COMMENT=			Compare, sync, and merge files and folders

LICENSE=			SCOOTERSOFTWARE
LICENSE_NAME=		Scooter Software License
LICENSE_FILE=		${FILESDIR}/LICENSE.txt
LICENSE_PERMS=		dist-mirror no-dist-sell pkg-mirror no-pkg-sell no-auto-accept

EXTRACT_SUFX=		.x86_64.rpm
USES=				linux:c7 desktop-file-utils shared-mime-info shebangfix

USE_LINUX=			base:run xorglibs:run qt-x11:run devtools:build
DISTREVISION=		25063

NO_WRKSUBDIR=		true

INSTALLS_ICONS=		yes

NO_BUILD=			yes
PLIST_SUB=			LOCALBASE=${LOCALBASE}

 SHEBANG_FILES=		${WRKSRC}/usr/lib64/beyondcompare/bcmount.sh \
 					${WRKSRC}/usr/lib64/beyondcompare/kde_context_menu

.include <bsd.port.options.mk>

.if ${ARCH} == 		i386
PLIST_SUB+=			LIBDIR=lib
.elif ${ARCH} ==	amd64
PLIST_SUB+=			LIBDIR=lib64
.endif

do-install:
	${MKDIR} ${STAGEDIR}${LOCALBASE}/lib
	${CP} -rp ${WRKSRC}/usr/lib64/beyondcompare ${STAGEDIR}${LOCALBASE}/lib/
	${CP} -rp ${WRKSRC}/usr/bin ${STAGEDIR}${LOCALBASE}/
	${CP} -rp ${WRKSRC}/usr/share ${STAGEDIR}${LOCALBASE}/
	${MKDIR} ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/16x16/apps
	${MKDIR} ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/32x32/apps
	${MKDIR} ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/48x48/apps
	${LN} -sf ../../../../pixmaps/bcompare.png ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/16x16/apps/bcompare.png
	${LN} -sf ../../../../pixmaps/bcomparefull32.png ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/32x32/apps/bcompare.png
	${LN} -sf ../../../../pixmaps/bcompare.png ${STAGEDIR}${LOCALBASE}/share/icons/hicolor/48x48/apps/bcompare.png
# 	${MKDIR} ${STAGEDIR}${LINUXBASE}/usr
# 	${CP} -rp ${WRKSRC}/usr/lib ${STAGEDIR}${LINUXBASE}/usr/
# 	${CP} -rp ${WRKSRC}/usr/lib64 ${STAGEDIR}${LINUXBASE}/usr/
	[ ! -d "${STAGEDIR}${LOCALBASE}/lib/beyondcompare/ext" ] || ${FIND} ${STAGEDIR}${LOCALBASE}/lib/beyondcompare/ext -name *.so -exec ${LINUXBASE}/usr/bin/strip {} +
	${LINUXBASE}/usr/bin/gcc -Wall -fPIC -shared ${FILESDIR}/nosched.c -ldl -o ${STAGEDIR}${LOCALBASE}/lib/beyondcompare/nosched.so
	${LN} -sf ${LINUXBASE}/usr/lib64/libbz2.so.1.0.6 ${STAGEDIR}${LOCALBASE}/lib/beyondcompare/libbz2.so.1.0
# 	${MKDIR} ${STAGEDIR}${LOCALBASE}/usr
# 	${CP} -rp ${WRKSRC}/usr/bin ${STAGEDIR}${LOCALBASE}/
# 	${CP} -rp ${WRKSRC}/usr/share ${STAGEDIR}${LOCALBASE}/

.include <bsd.port.mk>
