# $FreeBSD$

PORTNAME=					arrow
DISTVERSION=				1.0.1
CATEGORIES=					databases
MASTER_SITES=				https://mirrors.advancedhosters.com/apache/${PORTNAME}/${PORTNAME}-${DISTVERSION}/
PKGNAMEPREFIX=				${PYTHON_PKGNAMEPREFIX}
DISTNAME=					apache-${PORTNAME}-${DISTVERSION}

MAINTAINER=					matias@pizarro.net
COMMENT=					Columnar in-memory analytics layer for big data

LICENSE=					APACHE20
LICENSE_FILE=				${WRKSRC}/../LICENSE.txt

LIB_DEPENDS=				libboost_system.so:devel/boost-libs \
							libbrotlicommon.so:archivers/brotli \
							liblz4.so:archivers/liblz4 \
							libsnappy.so:archivers/snappy \
							libzstd.so:archivers/zstd \
							libarrow.so:databases/arrow \
							libarrow_dataset.so:databases/arrow \
							libarrow_flight.so:databases/arrow \
							libarrow_python_flight.so:databases/arrow \
							libarrow_python.so:databases/arrow \
							libgandiva.so:databases/arrow \
							libparquet.so:databases/arrow

BUILD_DEPENDS=				${PREFIX}/lib/libarrow.so:databases/arrow \
							${PREFIX}/lib/libarrow_dataset.so:databases/arrow \
							${PREFIX}/lib/libarrow_flight.so:databases/arrow \
							${PREFIX}/lib/libarrow_python_flight.so:databases/arrow \
							${PREFIX}/lib/libarrow_python.so:databases/arrow \
							${PREFIX}/lib/libgandiva.so:databases/arrow \
							${PREFIX}/lib/libparquet.so:databases/arrow \
							${PYTHON_PKGNAMEPREFIX}keras-preprocessing>0:math/py-keras-preprocessing@${PY_FLAVOR} \
							${PYTHON_PKGNAMEPREFIX}pandas>0:math/py-pandas@${PY_FLAVOR} \
							${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=						compiler:c++11-lang pkgconfig ssl python
USE_LDCONFIG=				yes
USE_PYTHON=					concurrent distutils flavors autoplist

CONFIGURE_ENV=				ARROW_HOME=${PREFIX} \
							ARROW_INCLUDE_DIR=${ARROW_HOME}/include/arrow \
							ARROW_LIB_DIR=${ARROW_HOME}/lib \
							ARROW_PYTHON_INCLUDE_DIR=${ARROW_HOME}/include/arrow/python \
							ARROW_PYTHON_LIB_DIR=${ARROW_HOME}/lib \
							PYARROW_CMAKE_OPTIONS=-Wno-dev \
							PYARROW_CXXFLAGS= \
							PYARROW_BUILD_TYPE=release \
							PYARROW_GENERATE_COVERAGE=0 \
							PYARROW_BUNDLE_ARROW_CPP=1 \
							PYARROW_BUNDLE_CYTHON_CPP=1 \
							PYARROW_BUNDLE_BOOST=0 \
							PYARROW_WITH_S3=0 \
							PYARROW_WITH_CUDA=0 \
							PYARROW_WITH_PLASMA=0 \
							PYARROW_WITH_TENSORFLOW=0 \
							PYARROW_WITH_ORC=0 \
							PYARROW_WITH_STATIC_PARQUET=0 \
							PYARROW_WITH_STATIC_BOOST=0

WRKSRC_SUBDIR=				python

OPTIONS_GROUP=				EXTENSIONS
OPTIONS_GROUP_EXTENSIONS=	PARQUET FLIGHT DATASET HDFS GANDIVA
OPTIONS_DEFAULT=			PARQUET FLIGHT

EXTENSIONS_DESC=			Extensions:

PARQUET_DESC=				Parquet support
PARQUET_LIB_DEPENDS=		libthrift-0.11.0.so:devel/thrift-cpp \
							libutf8proc.so:textproc/utf8proc

GANDIVA_DESC=				Gandiva support
GANDIVA_LIB_DEPENDS=		libgrpc.so:devel/grpc \
							libre2.so:devel/re2

HDFS_DESC=					Arrow HDFS bridge support

DATASET_DESC=				Arrow Dataset Modules support

FLIGHT_DESC=				Arrow Flight RPC System support
FLIGHT_LIB_DEPENDS=			libgflags.so:devel/gflags \
							libprotobuf.so:devel/protobuf \
							libabsl_base.so:devel/abseil \
							libcares.so:dns/c-ares \
							libgrpc.so:devel/grpc

ORC_DESC=					build the Arrow ORC adapter
ORC_LIB_DEPENDS=			liborc-0.4.so:devel/orc

S3_DESC=					build Arrow with S3 support
S3_LIB_DEPENDS=				libaws-cpp-sdk-s3.so:devel/aws-sdk-cpp \
							libaws-c-common.so:devel/aws-c-common \
							libaws-c-event-stream.so:devel/aws-c-event-stream \
							libaws-checksums.so:devel/aws-checksums

pre-build:
export ARROW_HOME=${PREFIX}
export ARROW_INCLUDE_DIR=${ARROW_HOME}/include/arrow
export ARROW_LIB_DIR=${ARROW_HOME}/lib
export ARROW_PYTHON_INCLUDE_DIR=${ARROW_HOME}/include/arrow/python
export ARROW_PYTHON_LIB_DIR=${ARROW_HOME}/lib
export PYARROW_CMAKE_OPTIONS=-Wno-dev
export PYARROW_CXXFLAGS=
export PYARROW_BUILD_TYPE=release
export PYARROW_GENERATE_COVERAGE=0
export PYARROW_BUNDLE_ARROW_CPP=0
export PYARROW_BUNDLE_CYTHON_CPP=0
export PYARROW_BUNDLE_BOOST=0
export PYARROW_WITH_S3=0
export PYARROW_WITH_CUDA=0
export PYARROW_WITH_PLASMA=0
export PYARROW_WITH_TENSORFLOW=0
export PYARROW_WITH_ORC=0
export PYARROW_WITH_STATIC_PARQUET=0
export PYARROW_WITH_STATIC_BOOST=0

post-install:
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/lib.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/lib.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_compute.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_compute.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_csv.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_csv.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_fs.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_fs.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_json.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_json.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_parquet.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_parquet.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_flight.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_flight.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/gandiva.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/gandiva.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_dataset.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_dataset.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_hdfs.so" ] || ${STRIP_CMD} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/_hdfs.so
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_dataset.so.100" ] || rm -f ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_dataset.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_flight.so.100" ] || rm -f ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_flight.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_python_flight.so.100" ] || rm -f ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_python_flight.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_python.so.100" ] || rm -f ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_python.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow.so.100" ] || rm -f ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libgandiva.so.100" ] || rm -f ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libgandiva.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libparquet.so.100" ] || rm -f ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libparquet.so.100
	${SED} -i '' '/.*\/$$/d' ${WRKDIR}/.PLIST.pymodtmp

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MPARQUET}
pre-build:
export PYARROW_WITH_PARQUET=1
.else
pre-build:
export PYARROW_WITH_PARQUET=0
.endif

.if ${PORT_OPTIONS:MFLIGHT}
pre-build:
export PYARROW_WITH_FLIGHT=1
.else
pre-build:
export PYARROW_WITH_FLIGHT=0
.endif

.if ${PORT_OPTIONS:MDATASET}
pre-build:
export PYARROW_WITH_DATASET=1
.else
pre-build:
export PYARROW_WITH_DATASET=0
.endif

.if ${PORT_OPTIONS:MHDFS}
pre-build:
export PYARROW_WITH_HDFS=1
.else
pre-build:
export PYARROW_WITH_HDFS=0
.endif

.if ${PORT_OPTIONS:MGANDIVA}
pre-build:
export PYARROW_WITH_GANDIVA=1
.else
pre-build:
export PYARROW_WITH_GANDIVA=0
.endif

.include <bsd.port.mk>
