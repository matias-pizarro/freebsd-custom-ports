# $FreeBSD$


PORTNAME=				sublime-merge
PORTVERSION=			2039
CATEGORIES=				editors devel linux
MASTER_SITES=			http://download.sublimetext.com/
PKGNAMEPREFIX=			linux-
DISTNAME=				sublime_merge_build_${PORTVERSION}_x64



MAINTAINER=				matias@pizarro.net
COMMENT=				Git client from the makers of Sublime Text

ONLY_FOR_ARCHS=			amd64
ONLY_FOR_ARCHS_REASON=	Upstream only supports amd64

USES=					desktop-file-utils gnome linux tar:xz
USE_LINUX=	gtk3

INSTALLS_ICONS=			yes
WRKSRC=					${WRKDIR}/sublime_merge

NO_BUILD=				yes

.include <bsd.port.mk>
