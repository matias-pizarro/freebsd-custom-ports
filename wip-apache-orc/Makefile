# $FreeBSD$

PORTNAME=				orc
PKGNAMEPREFIX=			apache-
DISTVERSIONPREFIX=		rel/release-
DISTVERSION=			1.6.4
CATEGORIES=				databases

MAINTAINER=				matias@pizarro.net
COMMENT=				Self-describing type-aware columnar file format designed for Hadoop workloads

LICENSE=				APACHE20
LICENSE_FILE=			${WRKSRC}/LICENSE

BUILD_DEPENDS=			maven3>0:devel/maven3

USES=					cmake compiler:c++11-lang pkgconfig
USE_LDCONFIG=			yes

USE_GITHUB=	yes
GH_ACCOUNT=	apache

.include <bsd.port.mk>
