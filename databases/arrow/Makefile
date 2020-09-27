# $FreeBSD$

PORTNAME=	arrow
DISTVERSION=	1.0.1
PORTREVISION=	2
CATEGORIES=	databases
MASTER_SITES=	https://mirrors.advancedhosters.com/apache/${PORTNAME}/${PORTNAME}-${DISTVERSION}/
DISTNAME=	apache-${PORTNAME}-${DISTVERSION}

MAINTAINER=	yuri@FreeBSD.org
COMMENT=	Columnar in-memory analytics layer for big data

LICENSE=	APACHE20
LICENSE_FILE=	${WRKSRC}/../LICENSE.txt

LIB_DEPENDS=	libboost_system.so:devel/boost-libs

USES=		cmake compiler:c++11-lang pkgconfig ssl
USE_LDCONFIG=	yes

WRKSRC_SUBDIR=	cpp

CMAKE_ARGS=	-DARROW_WITH_BACKTRACE=OFF
CMAKE_OFF=	ARROW_BUILD_STATIC

OPTIONS_GROUP=			COMPRESSION EXTENSIONS
OPTIONS_GROUP_COMPRESSION=	BROTLI BZ2 LZ4 SNAPPY ZLIB ZSTD
OPTIONS_GROUP_EXTENSIONS=	COMPUTE JSON CSV FILESYSTEM PARQUET FLIGHT DATASET HDFS GANDIVA BUILD_UTILITIES
OPTIONS_DEFAULT=		BROTLI BZ2 LZ4 SNAPPY ZLIB ZSTD COMPUTE JSON CSV FILESYSTEM PARQUET FLIGHT
OPTIONS_SUB=			yes

COMPRESSION_DESC=		Compression support:
EXTENSIONS_DESC=		Extensions:

BROTLI_CMAKE_BOOL=		ARROW_WITH_BROTLI
BROTLI_LIB_DEPENDS=		libbrotlicommon.so:archivers/brotli

BZ2_DESC=			bz2 compression support
BZ2_CMAKE_BOOL=			ARROW_WITH_BZ2

LZ4_CMAKE_BOOL=			ARROW_WITH_LZ4
LZ4_LIB_DEPENDS=		liblz4.so:archivers/liblz4

SNAPPY_CMAKE_BOOL=		ARROW_WITH_SNAPPY
SNAPPY_LIB_DEPENDS=		libsnappy.so:archivers/snappy

ZLIB_CMAKE_BOOL=		ARROW_WITH_ZLIB

ZSTD_DESC=			zstd compression support
ZSTD_CMAKE_BOOL=		ARROW_WITH_ZSTD
ZSTD_LIB_DEPENDS=		libzstd.so:archivers/zstd

COMPUTE_DESC=			build the Arrow Compute Modules
COMPUTE_CMAKE_BOOL=		ARROW_COMPUTE

JSON_DESC=			build Arrow with JSON support
JSON_CMAKE_BOOL=		ARROW_JSON
JSON_BUILD_DEPENDS=		${LOCALBASE}/include/rapidjson/rapidjson.h:devel/rapidjson

CSV_DESC=			build the Arrow CSV Parser Module
CSV_CMAKE_BOOL=			ARROW_CSV

FILESYSTEM_DESC=		build the Arrow Filesystem Layer
FILESYSTEM_CMAKE_BOOL=		ARROW_FILESYSTEM

PARQUET_DESC=			build the Parquet libraries
PARQUET_CMAKE_BOOL=		ARROW_PARQUET
PARQUET_LIB_DEPENDS=		libthrift-0.11.0.so:devel/thrift-cpp \
				libutf8proc.so:textproc/utf8proc

FLIGHT_DESC=			build the Arrow Flight RPC System
FLIGHT_CMAKE_BOOL=		ARROW_FLIGHT
FLIGHT_LIB_DEPENDS=		libgflags.so:devel/gflags \
				libprotobuf.so:devel/protobuf \
				libabsl_base.so:devel/abseil \
				libcares.so:dns/c-ares \
				libgrpc.so:devel/grpc

DATASET_DESC=			build the Arrow Dataset Modules
DATASET_CMAKE_BOOL=		ARROW_DATASET
DATASET_LIB_DEPENDS=		libutf8proc.so:textproc/utf8proc

HDFS_DESC=			build the Arrow HDFS bridge
HDFS_CMAKE_BOOL=		ARROW_HDFS

GANDIVA_DESC=			build the Gandiva libraries
GANDIVA_CMAKE_BOOL=		ARROW_GANDIVA
GANDIVA_BUILD_DEPENDS=		clang10:devel/llvm10
GANDIVA_LIB_DEPENDS=		libgrpc.so:devel/grpc \
				libre2.so:devel/re2

BUILD_UTILITIES_DESC=		build Arrow commandline utilities
BUILD_UTILITIES_CMAKE_BOOL=	ARROW_BUILD_UTILITIES

.include <bsd.port.mk>
