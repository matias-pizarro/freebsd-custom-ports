PORTNAME=	lumina-photo
DISTVERSIONPREFIX=	v
DISTVERSION=	1.6.0
PORTREVISION=	1
PKGNAMESUFFIX= -devel
CATEGORIES=	mpizarro deskutils

MAINTAINER=	lbartoletti@FreeBSD.org
COMMENT=	Image viewer utility from the Lumina Desktop

LICENSE=	BSD3CLAUSE

USES=		compiler:c++11-lang desktop-file-utils gl qmake qt:5
USE_QT=		buildtools_build concurrent core gui multimedia \
		printsupport network svg widgets x11extras
USE_GL=		gl
USE_GITHUB=	yes
GH_ACCOUNT=	matias-pizarro
GH_PROJECT=	lumina
GH_TAGNAME=	7a8e540a

OPTIONS_DEFINE=		NLS
OPTIONS_SUB=		yes

NLS_USE=	QT=linguist_build
NLS_QMAKE_ON=	CONFIG+=WITH_I18N

WRKSRC_SUBDIR=	src-qt5/desktop-utils/${PORTNAME}

.include <bsd.port.mk>
