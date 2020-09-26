# $FreeBSD$

PORTNAME=	bcompare
DISTVERSION=	4.3.6
CATEGORIES=	editors linux
MASTER_SITES=	http://scootersoftware.com/
PKGNAMEPREFIX=	linux-
DISTNAME=	${PORTNAME}-${DISTVERSION}.${DISTREVISION}

MAINTAINER=	matias@pizarro.net
COMMENT=	Sophisticated text editor for code, markup and prose

LICENSE=					SCOOTERSOFTWARE
LICENSE_NAME=				Scooter Software License
LICENSE_FILE=				${FILESDIR}/LICENSE.txt
LICENSE_PERMS=				dist-mirror no-dist-sell pkg-mirror no-pkg-sell no-auto-accept

EXTRACT_SUFX=	.x86_64.rpm
USES=		linux:c7 desktop-file-utils shared-mime-info

USE_LINUX=	base:run xorglibs:run qt-x11:run devtools:build
DISTREVISION=	25063

NO_WRKSUBDIR=	true
USE_LINUX_PREFIX=	true

INSTALLS_ICONS=	yes

NO_BUILD=	yes
PLIST_SUB=	LOCALBASE=${LOCALBASE} \
			LINUXBASE=${LINUXBASE}

.include <bsd.port.options.mk>

.if ${ARCH} == i386
PLIST_SUB+=	LIBDIR=lib
.elif ${ARCH} == amd64
PLIST_SUB+=	LIBDIR=lib64
.endif

post-build:
	${ECHO} INSTALL_WRKSRC: ${INSTALL_WRKSRC}

do-install:
	${MKDIR} ${STAGEDIR}${LINUXBASE}
	${CP} -rp ${WRKSRC}/usr ${STAGEDIR}${LINUXBASE}/
# 	${MKDIR} ${STAGEDIR}${LINUXBASE}/usr
# 	${CP} -rp ${WRKSRC}/usr/lib ${STAGEDIR}${LINUXBASE}/usr/
# 	${CP} -rp ${WRKSRC}/usr/lib64 ${STAGEDIR}${LINUXBASE}/usr/
	[ ! -d "${STAGEDIR}${LINUXBASE}/usr/lib64/beyondcompare/ext" ] || ${FIND} ${STAGEDIR}${LINUXBASE}/usr/lib64/beyondcompare/ext -name *.so -exec ${LINUXBASE}/usr/bin/strip {} +
	${LN} -sf libbz2.so.1.0.6 ${STAGEDIR}${LINUXBASE}/usr/lib64/libbz2.so.1.0
	${LINUXBASE}/usr/bin/gcc -Wall -fPIC -shared ${FILESDIR}/nosched.c -ldl -o ${STAGEDIR}${LINUXBASE}/usr/lib64/beyondcompare/nosched.so
# 	${MKDIR} ${STAGEDIR}${LOCALBASE}/usr
# 	${CP} -rp ${WRKSRC}/usr/bin ${STAGEDIR}${LOCALBASE}/
# 	${CP} -rp ${WRKSRC}/usr/share ${STAGEDIR}${LOCALBASE}/
	${MKDIR} ${STAGEDIR}${LOCALBASE}/bin
	${CP} -rp ${WRKSRC}/usr/bin/bcompare ${STAGEDIR}${LOCALBASE}/bin/

.include <bsd.port.mk>
