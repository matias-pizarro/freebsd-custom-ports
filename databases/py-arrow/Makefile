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
							libarrow_python.so:databases/arrow

BUILD_DEPENDS=				${LOCALBASE}/lib/libarrow.so:databases/arrow \
							${LOCALBASE}/lib/libarrow_python.so:databases/arrow \
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
PARQUET_BUILD_DEPENDS=		${LOCALBASE}/lib/libparquet.so:databases/arrow
PARQUET_LIB_DEPENDS=		libparquet.so:databases/arrow \
							libthrift-0.11.0.so:devel/thrift-cpp \
							libutf8proc.so:textproc/utf8proc

GANDIVA_DESC=				Gandiva support
GANDIVA_BUILD_DEPENDS=		${LOCALBASE}/lib/libgandiva.so:databases/arrow
GANDIVA_LIB_DEPENDS=		libgandiva.so:databases/arrow \
							libgrpc.so:devel/grpc \
							libre2.so:devel/re2

HDFS_DESC=					Arrow HDFS bridge support

DATASET_DESC=				Arrow Dataset Modules support
DATASET_BUILD_DEPENDS=		${LOCALBASE}/lib/libarrow_dataset.so:databases/arrow
DATASET_LIB_DEPENDS=		libarrow_dataset.so:databases/arrow

FLIGHT_DESC=				Arrow Flight RPC System support
FLIGHT_BUILD_DEPENDS=		${LOCALBASE}/lib/libarrow_python_flight.so:databases/arrow \
							${LOCALBASE}/lib/libarrow_flight.so:databases/arrow
FLIGHT_LIB_DEPENDS=			libarrow_flight.so:databases/arrow \
							libarrow_python_flight.so:databases/arrow \
							libgflags.so:devel/gflags \
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

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MPARQUET}
PYARROW_WITH_PARQUET?=1
.else
PYARROW_WITH_PARQUET?=0
.endif

.if ${PORT_OPTIONS:MFLIGHT}
PYARROW_WITH_FLIGHT?=1
.else
PYARROW_WITH_FLIGHT?=0
.endif

.if ${PORT_OPTIONS:MDATASET}
PYARROW_WITH_DATASET?=1
.else
PYARROW_WITH_DATASET?=0
.endif

.if ${PORT_OPTIONS:MHDFS}
PYARROW_WITH_HDFS?=1
.else
PYARROW_WITH_HDFS?=0
.endif

.if ${PORT_OPTIONS:MGANDIVA}
PYARROW_WITH_GANDIVA?=1
.else
PYARROW_WITH_GANDIVA?=0
.endif

do-build:
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
		PYARROW_WITH_PARQUET=${PYARROW_WITH_PARQUET} \
		PYARROW_WITH_FLIGHT=${PYARROW_WITH_FLIGHT} \
		PYARROW_WITH_DATASET=${PYARROW_WITH_DATASET} \
		PYARROW_WITH_HDFS=${PYARROW_WITH_HDFS} \
		PYARROW_WITH_GANDIVA=${PYARROW_WITH_GANDIVA} \
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
	[ ! -d "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow" ] || ${FIND} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow -name *.so -exec ${STRIP_CMD} {} +
	[ ! -d "${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow" ] || ${FIND} ${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow -name *.so -exec ${STRIP_CMD} {} +
	[ ! -d "${BUILD_WRKSRC}/build" ] || ${FIND} ${BUILD_WRKSRC}/build -name *.so -exec ${STRIP_CMD} {} +
	[ ! -d "${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow" ] || ${CP} ${BUILD_WRKSRC}/build/lib.freebsd-*-${PYTHON_VER}/pyarrow/*.so ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow/
	[ ! -d "${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow" ] || ${CP} ${BUILD_WRKSRC}/build/lib.freebsd-*-${PYTHON_VER}/pyarrow/*.so ${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow/
	for _file in $$(${FIND} ${STAGEDIR}${PYTHON_SITELIBDIR}/pyarrow -type f -depth 1 -name '*.so*' | ${TR} '\n' ' '); do \
		_new_file=$$(${ECHO_CMD} $${_file} | rev | cut -d / -f 1 | rev); \
		[ ! -f "${LOCALBASE}/lib/$${_new_file}" ] || ${ECHO_CMD} "${LOCALBASE}/lib/$${_new_file} exists => deleting $${_file}"; \
		[ ! -f "${LOCALBASE}/lib/$${_new_file}" ] || ${RM} "$${_file}"; \
	done
	${FIND} ${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/pyarrow -type f >> ${WRKDIR}/mytmplist1
	${SED} -i '' '/.*\/$$/d' ${_PYTHONPKGLIST}
	${CAT} ${TMPPLIST } ${_PYTHONPKGLIST} ${WRKDIR}/mytmplist1 | ${SORT} | uniq >> ${WRKDIR}/mytmplist2
	${SED} 's|'${STAGEDIR}'||g' ${WRKDIR}/mytmplist2 | ${SORT} | uniq > ${_PYTHONPKGLIST}

.include <bsd.port.mk>
