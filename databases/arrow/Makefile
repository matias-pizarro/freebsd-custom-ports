# $FreeBSD$

PORTNAME=					arrow
DISTVERSION=				1.0.1
PORTREVISION=				2
CATEGORIES=					databases
MASTER_SITES=				https://mirrors.advancedhosters.com/apache/${PORTNAME}/${PORTNAME}-${DISTVERSION}/
DISTNAME=					apache-${PORTNAME}-${DISTVERSION}

MAINTAINER=					yuri@FreeBSD.org
COMMENT=					Columnar in-memory analytics layer for big data

LICENSE=					APACHE20
LICENSE_FILE=				${WRKSRC}/../LICENSE.txt

LIB_DEPENDS=				libboost_system.so:devel/boost-libs

USES=						cmake compiler:c++11-lang pkgconfig ssl
USE_LDCONFIG=				yes

WRKSRC_SUBDIR=				cpp

CMAKE_ARGS=					-DARROW_WITH_BACKTRACE=OFF
CMAKE_OFF=					ARROW_BUILD_STATIC

OPTIONS_GROUP=				COMPRESSION EXTENSIONS
OPTIONS_GROUP_COMPRESSION=	BROTLI BZ2 LZ4 SNAPPY ZLIB ZSTD
OPTIONS_GROUP_EXTENSIONS=	COMPUTE JSON CSV FILESYSTEM PYTHON PARQUET FLIGHT DATASET HDFS GANDIVA BUILD_UTILITIES
OPTIONS_DEFAULT=			BROTLI BZ2 LZ4 SNAPPY ZLIB ZSTD COMPUTE JSON CSV FILESYSTEM PYTHON PARQUET FLIGHT

COMPRESSION_DESC=			Compression support:
EXTENSIONS_DESC=			Extensions:

BROTLI_CMAKE_BOOL=			ARROW_WITH_BROTLI
BROTLI_LIB_DEPENDS=			libbrotlicommon.so:archivers/brotli

BZ2_DESC=					bz2 compression support
BZ2_CMAKE_BOOL=				ARROW_WITH_BZ2

LZ4_CMAKE_BOOL=				ARROW_WITH_LZ4
LZ4_LIB_DEPENDS=			liblz4.so:archivers/liblz4

SNAPPY_CMAKE_BOOL=			ARROW_WITH_SNAPPY
SNAPPY_LIB_DEPENDS=			libsnappy.so:archivers/snappy

ZLIB_CMAKE_BOOL=			ARROW_WITH_ZLIB

ZSTD_DESC=					zstd compression support
ZSTD_CMAKE_BOOL=			ARROW_WITH_ZSTD
ZSTD_LIB_DEPENDS=			libzstd.so:archivers/zstd

PARQUET_DESC=				build the Parquet libraries
PARQUET_CMAKE_BOOL=			ARROW_PARQUET
PARQUET_LIB_DEPENDS=		libthrift-0.11.0.so:devel/thrift-cpp \
							libutf8proc.so:textproc/utf8proc

GANDIVA_DESC=				build the Gandiva libraries
GANDIVA_CMAKE_BOOL=			ARROW_GANDIVA
GANDIVA_BUILD_DEPENDS=		clang10:devel/llvm10
GANDIVA_LIB_DEPENDS=		libgrpc.so:devel/grpc \
							libre2.so:devel/re2

ORC_DESC=					build the Arrow ORC adapter
ORC_CMAKE_BOOL=				ARROW_ORC
ORC_LIB_DEPENDS=			liborc-0.4.so:devel/orc

S3_DESC=					build Arrow with S3 support
S3_CMAKE_BOOL=				ARROW_S3
S3_LIB_DEPENDS=				libaws-cpp-sdk-s3.so:devel/aws-sdk-cpp \
							libaws-c-common.so:devel/aws-c-common \
							libaws-c-event-stream.so:devel/aws-c-event-stream \
							libaws-checksums.so:devel/aws-checksums

CSV_DESC=					build the Arrow CSV Parser Module
CSV_CMAKE_BOOL=				ARROW_CSV

JSON_DESC=					build Arrow with JSON support
JSON_CMAKE_BOOL=			ARROW_JSON
JSON_BUILD_DEPENDS=			${LOCALBASE}/include/rapidjson/rapidjson.h:devel/rapidjson

HDFS_DESC=					build the Arrow HDFS bridge
HDFS_CMAKE_BOOL=			ARROW_HDFS

COMPUTE_DESC=				build the Arrow Compute Modules
COMPUTE_CMAKE_BOOL=			ARROW_COMPUTE

FILESYSTEM_DESC=			build the Arrow Filesystem Layer
FILESYSTEM_CMAKE_BOOL=		ARROW_FILESYSTEM

DATASET_DESC=				build the Arrow Dataset Modules
DATASET_CMAKE_BOOL=			ARROW_DATASET

PYTHON_DESC=				build the Arrow CPython extensions
PYTHON_CMAKE_BOOL=			ARROW_PYTHON
# PYTHON_BUILD_DEPENDS=		${PYTHON_PKGNAMEPREFIX}numpy>0:math/py-numpy@${PY_FLAVOR} \
# 							${PYTHON_PKGNAMEPREFIX}cython>0:lang/cython@${PY_FLAVOR} \
# 							${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
# 							${PYTHON_PKGNAMEPREFIX}setuptools_scm>0:devel/py-setuptools_scm@${PY_FLAVOR} \

FLIGHT_DESC=				build the Arrow Flight RPC System
FLIGHT_CMAKE_BOOL=			ARROW_FLIGHT
FLIGHT_LIB_DEPENDS=			libgflags.so:devel/gflags \
							libprotobuf.so:devel/protobuf \
							libabsl_base.so:devel/abseil \
							libcares.so:dns/c-ares \
							libgrpc.so:devel/grpc

BUILD_UTILITIES_DESC=		build Arrow commandline utilities
BUILD_UTILITIES_CMAKE_BOOL=	ARROW_BUILD_UTILITIES

.include <bsd.port.mk>
