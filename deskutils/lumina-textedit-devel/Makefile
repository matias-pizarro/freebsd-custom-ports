# Created by: Ken Moore <ken@pcbsd.org>

PORTNAME=	lumina-textedit
DISTVERSIONPREFIX=	v
DISTVERSION=	1.6.0
PORTREVISION=	2
PKGNAMESUFFIX=	-devel
CATEGORIES=	deskutils

MAINTAINER=	lbartoletti@FreeBSD.org
COMMENT=	Plaintext editor from the Lumina Desktop

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/../../../LICENSE

USES=		compiler:c++11-lang desktop-file-utils gl qmake qt:5
USE_QT=		buildtools_build concurrent core gui multimedia \
		network printsupport svg widgets x11extras
USE_GL=		gl
USE_GITHUB=	yes
GH_ACCOUNT=	matias-pizarro
GH_PROJECT=	lumina
GH_TAGNAME=	424e3719

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USE=	QT=linguist_build
NLS_QMAKE_ON=	CONFIG+=WITH_I18N

CONFLICTS_INSTALL=	lumina-textedit lumina-1.2.*

WRKSRC_SUBDIR=	src-qt5/desktop-utils/${PORTNAME}

.include <bsd.port.mk>
