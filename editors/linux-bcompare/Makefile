# $FreeBSD$

PORTNAME=				bcompare
DISTVERSION=			4.3.6
DISTVERSIONSUFFIX=		.25063
CATEGORIES=				editors devel linux
MASTER_SITES=			http://scootersoftware.com/
PKGNAMEPREFIX=			linux-
EXTRACT_SUFX=			.rpm

MAINTAINER=				matias@pizarro.net
COMMENT=				Compare, sync, and merge files and folders (X11)

LICENSE=				SCOOTERSOFTWARE
LICENSE_NAME=			Scooter Software License
LICENSE_FILE=			${FILESDIR}/LICENSE.txt
LICENSE_PERMS=			dist-mirror no-dist-sell pkg-mirror no-pkg-sell no-auto-accept

ONLY_FOR_ARCHS=			amd64 i386
ONLY_FOR_ARCHS_REASON=	Upstream only supports amd64 and i386

USES=					linux desktop-file-utils shared-mime-info shebangfix
USE_LINUX=				base:run xorglibs:run qt-x11:run devtools:build

DISTNAME_amd64=			${DISTNAME}.x86_64
DISTNAME_i386=			${DISTNAME}.i386

NO_WRKSUBDIR=			true
NO_BUILD=				yes
PLIST_SUB=				LOCALBASE=${LOCALBASE}

INSTALLS_ICONS=			yes

.include <bsd.port.options.mk>

.if ${ARCH} == i386
LIBDIR=					lib
.elif ${ARCH} == amd64
LIBDIR=					lib64
.endif

SHEBANG_FILES=			${WRKSRC}/usr/${LIBDIR}/beyondcompare/bcmount.sh \
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
