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

BUILD_DEPENDS=				${LOCALBASE}/lib/libarrow.so:databases/arrow \
							${LOCALBASE}/lib/libarrow_dataset.so:databases/arrow \
							${LOCALBASE}/lib/libarrow_flight.so:databases/arrow \
							${LOCALBASE}/lib/libarrow_python_flight.so:databases/arrow \
							${LOCALBASE}/lib/libarrow_python.so:databases/arrow \
							${LOCALBASE}/lib/libgandiva.so:databases/arrow \
							${LOCALBASE}/lib/libparquet.so:databases/arrow \
							${PYTHON_PKGNAMEPREFIX}keras-preprocessing>0:math/py-keras-preprocessing@${PY_FLAVOR} \
							${PYTHON_PKGNAMEPREFIX}pandas>0:math/py-pandas@${PY_FLAVOR} \
							${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=						compiler:c++11-lang pkgconfig ssl python
USE_LDCONFIG=				yes
USE_PYTHON=					concurrent distutils flavors autoplist

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

do-build:
	# echo "BUILD_WRKSRC: ${BUILD_WRKSRC}"
	# echo "SETENV: ${SETENV}"
	# echo "MAKE_ENV: ${MAKE_ENV}"
	# echo "PYTHON_CMD: ${PYTHON_CMD}"
	# echo "PYDISTUTILS_SETUP: ${PYDISTUTILS_SETUP}"
	# echo "PYDISTUTILS_BUILD_TARGET: ${PYDISTUTILS_BUILD_TARGET}"
	# echo "PYDISTUTILS_BUILDARGS: ${PYDISTUTILS_BUILDARGS}"
	@(cd ${BUILD_WRKSRC}; \
		ARROW_HOME=${LOCALBASE} \
		ARROW_INCLUDE_DIR=${LOCALBASE}/include/arrow \
		ARROW_LIB_DIR=${LOCALBASE}/lib \
		ARROW_PYTHON_INCLUDE_DIR=${LOCALBASE}/include/arrow/python \
		ARROW_PYTHON_LIB_DIR=${LOCALBASE}/lib \
		PYARROW_CMAKE_OPTIONS="-Wno-dev -I${LOCALBASE}/include -L${LOCALBASE}/lib" \
		PYARROW_CXXFLAGS= \
		PYARROW_BUILD_TYPE=release \
		PYARROW_GENERATE_COVERAGE=0 \
		PYARROW_BUNDLE_ARROW_CPP=0 \
		PYARROW_BUNDLE_CYTHON_CPP=0 \
		PYARROW_BUNDLE_BOOST=0 \
		PYARROW_WITH_S3=0 \
		PYARROW_WITH_CUDA=0 \
		PYARROW_WITH_PLASMA=0 \
		PYARROW_WITH_TENSORFLOW=0 \
		PYARROW_WITH_ORC=0 \
		PYARROW_WITH_STATIC_PARQUET=0 \
		PYARROW_WITH_STATIC_BOOST=0 \
		${MAKE_ENV} ${PYTHON_CMD} ${PYDISTUTILS_SETUP} ${PYDISTUTILS_BUILD_TARGET} ${PYDISTUTILS_BUILDARGS} \
	)

post-install:
	ls -al ${WRKDIR}
	[ ! -d "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow" ] || ${FIND} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow -name *.so -exec ${STRIP_CMD} {} +
	[ ! -d "${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow" ] || ${FIND} ${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow -name *.so -exec ${STRIP_CMD} {} +
	[ ! -d "${BUILD_WRKSRC}/build" ] || ${FIND} ${BUILD_WRKSRC}/build -name *.so -exec ${STRIP_CMD} {} +
	[ ! -d "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow" ] || ${CP} ${BUILD_WRKSRC}/build/lib.freebsd-*-${PYTHON_VER}/pyarrow/*.so ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/
	[ ! -d "${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow" ] || ${CP} ${BUILD_WRKSRC}/build/lib.freebsd-*-${PYTHON_VER}/pyarrow/*.so ${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow/
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_dataset.so.100" ] || ${RM} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_dataset.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_flight.so.100" ] || ${RM} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_flight.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_python_flight.so.100" ] || ${RM} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_python_flight.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_python.so.100" ] || ${RM} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow_python.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow.so.100" ] || ${RM} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libarrow.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libgandiva.so.100" ] || ${RM} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libgandiva.so.100
	[ ! -f "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libparquet.so.100" ] || ${RM} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/libparquet.so.100
	${FIND} ${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow -type f >> ${WRKDIR}/mytmplist1
	${SED} -i '' '/.*\/$$/d' ${_PYTHONPKGLIST}
	${CAT} ${TMPPLIST } ${_PYTHONPKGLIST} ${WRKDIR}/mytmplist1 | ${SORT} | uniq >> ${WRKDIR}/mytmplist2
	${SED} 's|'${STAGEDIR}'||g' ${WRKDIR}/mytmplist2 | ${SORT} | uniq > ${_PYTHONPKGLIST}

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
