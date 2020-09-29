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

USES=		cmake compiler:c++11-lang pkgconfig python
USE_LDCONFIG=	yes

WRKSRC_SUBDIR=	cpp

CMAKE_ARGS=	-DARROW_WITH_BACKTRACE=OFF
CMAKE_OFF=	ARROW_BUILD_STATIC

OPTIONS_GROUP=			COMPRESSION EXTENSIONS
OPTIONS_GROUP_COMPRESSION=	BROTLI BZ2 LZ4 SNAPPY ZLIB ZSTD
OPTIONS_GROUP_EXTENSIONS=	PYTHON COMPUTE JSON CSV FILESYSTEM PARQUET FLIGHT DATASET HDFS GANDIVA BUILD_UTILITIES TESTS
OPTIONS_DEFAULT=		BROTLI BZ2 LZ4 SNAPPY ZLIB ZSTD COMPUTE JSON CSV FILESYSTEM PARQUET FLIGHT
OPTIONS_SUB=			yes
PLIST_SUB=			PYTHON_SUFFIX=${PYTHON_SUFFIX}

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
COMPUTE_BUILD_DEPENDS=		${LOCALBASE}/lib/libutf8proc.so:textproc/utf8proc
COMPUTE_LIB_DEPENDS=		libutf8proc.so:textproc/utf8proc

JSON_DESC=			build Arrow with JSON support
JSON_CMAKE_BOOL=		ARROW_JSON
JSON_BUILD_DEPENDS=		${LOCALBASE}/include/rapidjson/rapidjson.h:devel/rapidjson

CSV_DESC=			build the Arrow CSV Parser Module
CSV_CMAKE_BOOL=			ARROW_CSV

FILESYSTEM_DESC=		build the Arrow Filesystem Layer
FILESYSTEM_CMAKE_BOOL=		ARROW_FILESYSTEM

PARQUET_DESC=			build the Parquet libraries
PARQUET_USES=			ssl
PARQUET_CMAKE_BOOL=		ARROW_PARQUET PARQUET_REQUIRE_ENCRYPTION
PARQUET_BUILD_DEPENDS=		${LOCALBASE}/lib/libutf8proc.so:textproc/utf8proc
PARQUET_LIB_DEPENDS=		libutf8proc.so:textproc/utf8proc \
				libthrift-0.11.0.so:devel/thrift-cpp

FLIGHT_DESC=			build the Arrow Flight RPC System
FLIGHT_USES=			ssl
FLIGHT_CMAKE_BOOL=		ARROW_FLIGHT
FLIGHT_LIB_DEPENDS=		libgflags.so:devel/gflags \
				libprotobuf.so:devel/protobuf \
				libabsl_base.so:devel/abseil \
				libcares.so:dns/c-ares \
				libgrpc.so:devel/grpc

DATASET_DESC=			build the Arrow Dataset Modules
DATASET_CMAKE_BOOL=		ARROW_DATASET
DATASET_BUILD_DEPENDS=		${LOCALBASE}/lib/libutf8proc.so:textproc/utf8proc
DATASET_LIB_DEPENDS=		libutf8proc.so:textproc/utf8proc

HDFS_DESC=			build the Arrow HDFS bridge
HDFS_CMAKE_BOOL=		ARROW_HDFS

GANDIVA_DESC=			build the Gandiva libraries
GANDIVA_CMAKE_BOOL=		ARROW_GANDIVA
GANDIVA_BUILD_DEPENDS=		${LOCALBASE}/lib/clang10:devel/llvm10
GANDIVA_LIB_DEPENDS=		libgrpc.so:devel/grpc \
				libre2.so:devel/re2

BUILD_UTILITIES_DESC=		build Arrow commandline utilities
BUILD_UTILITIES_CMAKE_BOOL=	ARROW_BUILD_UTILITIES

PYTHON_DESC=			build the Arrow CPython extensions
PYTHON_CMAKE_BOOL=		ARROW_PYTHON
PYTHON_BUILD_DEPENDS=		${LOCALBASE}/lib/libutf8proc.so:textproc/utf8proc \
				${PYTHON_PKGNAMEPREFIX}numpy>0:math/py-numpy@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}cython>0:lang/cython@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
				${PYTHON_PKGNAMEPREFIX}setuptools_scm>0:devel/py-setuptools_scm@${PY_FLAVOR}
PYTHON_LIB_DEPENDS=		libutf8proc.so:textproc/utf8proc

TESTS_DESC=			build the Arrow TESTS adapter
TESTS_CMAKE_ON=			-DARROW_BUILD_EXAMPLES:BOOL=ON \
				-DARROW_BUILD_TESTS:BOOL=ON \
				-DARROW_ENABLE_TIMING_TESTS:BOOL=ON \
				-DARROW_BUILD_INTEGRATION:BOOL=ON \
				-DARROW_BUILD_BENCHMARKS:BOOL=OFF \
				-DARROW_BUILD_BENCHMARKS_REFERENCE=OFF \
				-DARROW_TEST_LINKAGE:STRING=shared \
				-DARROW_FUZZING:BOOL=OFF \
				-DARROW_LARGE_MEMORY_TESTS:BOOL=ON
TESTS_CMAKE_OFF=		-DARROW_BUILD_EXAMPLES:BOOL=OFF \
				-DARROW_BUILD_TESTS:BOOL=OFF \
				-DARROW_ENABLE_TIMING_TESTS:BOOL=ON \
				-DARROW_BUILD_INTEGRATION:BOOL=OFF \
				-DARROW_BUILD_BENCHMARKS:BOOL=OFF \
				-DARROW_BUILD_BENCHMARKS_REFERENCE=OFF \
				-DARROW_TEST_LINKAGE:STRING=shared \
				-DARROW_FUZZING:BOOL=OFF \
				-DARROW_LARGE_MEMORY_TESTS:BOOL=OFF
TESTS_BUILD_DEPENDS=		${LOCALBASE}/include/gtest/gtest.h:devel/googletest \
				${LOCALBASE}/include/benchmark/benchmark.h:devel/benchmark
TESTS_LIB_DEPENDS=		${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR}
TESTS_LIB_DEPENDS=		libgtest.so:devel/googletest

ORC_DESC=			build the Arrow ORC adapter
ORC_CMAKE_BOOL=			ARROW_ORC
ORC_LIB_DEPENDS=		liborc-0.4.so:devel/orc

S3_DESC=			build Arrow with S3 support
S3_USES=			ssl
S3_CMAKE_BOOL=			ARROW_S3
S3_LIB_DEPENDS=			libaws-cpp-sdk-s3.so:devel/aws-sdk-cpp \
				libaws-c-common.so:devel/aws-c-common \
				libaws-c-event-stream.so:devel/aws-c-event-stream \
				libaws-checksums.so:devel/aws-checksums

pre-configure:
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../ci/appveyor-cpp-build.bat
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../cpp/cmake_modules/FindArrowPython.cmake
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../cpp/cmake_modules/FindArrowPythonFlight.cmake
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../cpp/src/arrow/python/arrow-python-flight.pc.in
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../cpp/src/arrow/python/arrow-python.pc.in
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../cpp/src/arrow/python/ArrowPythonConfig.cmake.in
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../cpp/src/arrow/python/ArrowPythonFlightConfig.cmake.in
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../cpp/src/arrow/python/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/release/rat_exclude_files.txt
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/release/verify-apt.sh
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/release/verify-yum.sh
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/conda-recipes/arrow-cpp/meta.yaml
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian.ubuntu-xenial/changelog
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian.ubuntu-xenial/control
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian.ubuntu-xenial/libarrow-python-dev.install
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian.ubuntu-xenial/libarrow-python100.install
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian/changelog
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian/control
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian/libarrow-python-dev.install
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian/libarrow-python-flight-dev.install
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian/libarrow-python-flight100.install
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/debian/libarrow-python100.install
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/linux-packages/apache-arrow/yum/arrow.spec.in
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../dev/tasks/tasks.yml
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../docs/source/developers/python.rst
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../python/cmake_modules/FindArrowPython.cmake
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../python/cmake_modules/FindArrowPythonFlight.cmake
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../python/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../python/pyarrow/__init__.py
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../python/pyarrow/plasma.py
	@${REINPLACE_CMD} -e 's|arrow_python|arrow_python'${PYTHON_SUFFIX}'|g; s|arrow-python|arrow-python'${PYTHON_SUFFIX}'|g' ${WRKSRC}/../python/setup.py
	@${MV} ${WRKSRC}/src/arrow/python/arrow-python.pc.in ${WRKSRC}/src/arrow/python/arrow-python${PYTHON_SUFFIX}.pc.in
	@${MV} ${WRKSRC}/src/arrow/python/arrow-python-flight.pc.in ${WRKSRC}/src/arrow/python/arrow-python${PYTHON_SUFFIX}-flight.pc.in

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MPYTHON} == "PYTHON" && ${PORT_OPTIONS:MFLIGHT} == "FLIGHT"
    PLIST_SUB+=	PYTHONFLIGHT=""
.else
    PLIST_SUB+=	PYTHONFLIGHT="@comment "
.endif

.if ${PORT_OPTIONS:MTESTS} && ${PORT_OPTIONS:MFLIGHT} == "FLIGHT"
    PLIST_SUB+=	TESTSFLIGHT=""
.else
    PLIST_SUB+=	TESTSFLIGHT="@comment "
.endif

.include <bsd.port.mk>
