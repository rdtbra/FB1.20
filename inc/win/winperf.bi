#pragma once

#define _WINPERF_
const PERF_DATA_VERSION = 1
const PERF_DATA_REVISION = 1

type _PERF_DATA_BLOCK
	Signature as wstring * 4
	LittleEndian_ as DWORD
	Version as DWORD
	Revision as DWORD
	TotalByteLength as DWORD
	HeaderLength as DWORD
	NumObjectTypes as DWORD
	DefaultObject as LONG
	SystemTime as SYSTEMTIME
	PerfTime as LARGE_INTEGER
	PerfFreq as LARGE_INTEGER
	PerfTime100nSec as LARGE_INTEGER
	SystemNameLength as DWORD
	SystemNameOffset as DWORD
end type

type PERF_DATA_BLOCK as _PERF_DATA_BLOCK
type PPERF_DATA_BLOCK as _PERF_DATA_BLOCK ptr

type _PERF_OBJECT_TYPE
	TotalByteLength as DWORD
	DefinitionLength as DWORD
	HeaderLength as DWORD
	ObjectNameTitleIndex as DWORD

	#ifdef __FB_64BIT__
		ObjectNameTitle as DWORD
	#else
		ObjectNameTitle as LPWSTR
	#endif

	ObjectHelpTitleIndex as DWORD

	#ifdef __FB_64BIT__
		ObjectHelpTitle as DWORD
	#else
		ObjectHelpTitle as LPWSTR
	#endif

	DetailLevel as DWORD
	NumCounters as DWORD
	DefaultCounter as LONG
	NumInstances as LONG
	CodePage as DWORD
	PerfTime as LARGE_INTEGER
	PerfFreq as LARGE_INTEGER
end type

type PERF_OBJECT_TYPE as _PERF_OBJECT_TYPE
type PPERF_OBJECT_TYPE as _PERF_OBJECT_TYPE ptr
const PERF_NO_INSTANCES = -1
const PERF_SIZE_DWORD = &h00000000
const PERF_SIZE_LARGE = &h00000100
const PERF_SIZE_ZERO = &h00000200
const PERF_SIZE_VARIABLE_LEN = &h00000300
const PERF_TYPE_NUMBER = &h00000000
const PERF_TYPE_COUNTER = &h00000400
const PERF_TYPE_TEXT = &h00000800
const PERF_TYPE_ZERO = &h00000C00
const PERF_NUMBER_HEX = &h00000000
const PERF_NUMBER_DECIMAL = &h00010000
const PERF_NUMBER_DEC_1000 = &h00020000
const PERF_COUNTER_VALUE = &h00000000
const PERF_COUNTER_RATE = &h00010000
const PERF_COUNTER_FRACTION = &h00020000
const PERF_COUNTER_BASE = &h00030000
const PERF_COUNTER_ELAPSED = &h00040000
const PERF_COUNTER_QUEUELEN = &h00050000
const PERF_COUNTER_HISTOGRAM = &h00060000
const PERF_COUNTER_PRECISION = &h00070000
const PERF_TEXT_UNICODE = &h00000000
const PERF_TEXT_ASCII = &h00010000
const PERF_TIMER_TICK = &h00000000
const PERF_TIMER_100NS = &h00100000
const PERF_OBJECT_TIMER = &h00200000
const PERF_DELTA_COUNTER = &h00400000
const PERF_DELTA_BASE = &h00800000
const PERF_INVERSE_COUNTER = &h01000000
const PERF_MULTI_COUNTER = &h02000000
const PERF_DISPLAY_NO_SUFFIX = &h00000000
const PERF_DISPLAY_PER_SEC = &h10000000
const PERF_DISPLAY_PERCENT = &h20000000
const PERF_DISPLAY_SECONDS = &h30000000
const PERF_DISPLAY_NOSHOW = &h40000000
#define PERF_COUNTER_COUNTER (((((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_TICK) or PERF_DELTA_COUNTER) or PERF_DISPLAY_PER_SEC)
#define PERF_COUNTER_TIMER (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_TICK) or PERF_DELTA_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_COUNTER_QUEUELEN_TYPE (((((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_QUEUELEN) or PERF_TIMER_TICK) or PERF_DELTA_COUNTER) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_LARGE_QUEUELEN_TYPE (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_QUEUELEN) or PERF_TIMER_TICK) or PERF_DELTA_COUNTER) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_100NS_QUEUELEN_TYPE (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_QUEUELEN) or PERF_TIMER_100NS) or PERF_DELTA_COUNTER) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_OBJ_TIME_QUEUELEN_TYPE (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_QUEUELEN) or PERF_OBJECT_TIMER) or PERF_DELTA_COUNTER) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_BULK_COUNT (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_TICK) or PERF_DELTA_COUNTER) or PERF_DISPLAY_PER_SEC)
#define PERF_COUNTER_TEXT (((PERF_SIZE_VARIABLE_LEN or PERF_TYPE_TEXT) or PERF_TEXT_UNICODE) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_RAWCOUNT (((PERF_SIZE_DWORD or PERF_TYPE_NUMBER) or PERF_NUMBER_DECIMAL) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_LARGE_RAWCOUNT (((PERF_SIZE_LARGE or PERF_TYPE_NUMBER) or PERF_NUMBER_DECIMAL) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_RAWCOUNT_HEX (((PERF_SIZE_DWORD or PERF_TYPE_NUMBER) or PERF_NUMBER_HEX) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_LARGE_RAWCOUNT_HEX (((PERF_SIZE_LARGE or PERF_TYPE_NUMBER) or PERF_NUMBER_HEX) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_SAMPLE_FRACTION (((((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_FRACTION) or PERF_DELTA_COUNTER) or PERF_DELTA_BASE) or PERF_DISPLAY_PERCENT)
#define PERF_SAMPLE_COUNTER (((((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_TICK) or PERF_DELTA_COUNTER) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_NODATA (PERF_SIZE_ZERO or PERF_DISPLAY_NOSHOW)
#define PERF_COUNTER_TIMER_INV ((((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_TICK) or PERF_DELTA_COUNTER) or PERF_INVERSE_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_SAMPLE_BASE ((((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_BASE) or PERF_DISPLAY_NOSHOW) or &h00000001)
#define PERF_AVERAGE_TIMER (((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_FRACTION) or PERF_DISPLAY_SECONDS)
#define PERF_AVERAGE_BASE ((((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_BASE) or PERF_DISPLAY_NOSHOW) or &h00000002)
#define PERF_AVERAGE_BULK (((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_FRACTION) or PERF_DISPLAY_NOSHOW)
#define PERF_OBJ_TIME_TIMER (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_OBJECT_TIMER) or PERF_DELTA_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_100NSEC_TIMER (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_100NS) or PERF_DELTA_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_100NSEC_TIMER_INV ((((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_100NS) or PERF_DELTA_COUNTER) or PERF_INVERSE_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_COUNTER_MULTI_TIMER ((((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_DELTA_COUNTER) or PERF_TIMER_TICK) or PERF_MULTI_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_COUNTER_MULTI_TIMER_INV (((((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_RATE) or PERF_DELTA_COUNTER) or PERF_MULTI_COUNTER) or PERF_TIMER_TICK) or PERF_INVERSE_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_COUNTER_MULTI_BASE ((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_BASE) or PERF_MULTI_COUNTER) or PERF_DISPLAY_NOSHOW)
#define PERF_100NSEC_MULTI_TIMER ((((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_DELTA_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_100NS) or PERF_MULTI_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_100NSEC_MULTI_TIMER_INV (((((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_DELTA_COUNTER) or PERF_COUNTER_RATE) or PERF_TIMER_100NS) or PERF_MULTI_COUNTER) or PERF_INVERSE_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_RAW_FRACTION (((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_FRACTION) or PERF_DISPLAY_PERCENT)
#define PERF_LARGE_RAW_FRACTION (((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_FRACTION) or PERF_DISPLAY_PERCENT)
#define PERF_RAW_BASE ((((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_BASE) or PERF_DISPLAY_NOSHOW) or &h00000003)
#define PERF_LARGE_RAW_BASE (((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_BASE) or PERF_DISPLAY_NOSHOW)
#define PERF_ELAPSED_TIME ((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_ELAPSED) or PERF_OBJECT_TIMER) or PERF_DISPLAY_SECONDS)
const PERF_COUNTER_HISTOGRAM_TYPE = &h80000000
#define PERF_COUNTER_DELTA ((((PERF_SIZE_DWORD or PERF_TYPE_COUNTER) or PERF_COUNTER_VALUE) or PERF_DELTA_COUNTER) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_COUNTER_LARGE_DELTA ((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_VALUE) or PERF_DELTA_COUNTER) or PERF_DISPLAY_NO_SUFFIX)
#define PERF_PRECISION_SYSTEM_TIMER (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_PRECISION) or PERF_TIMER_TICK) or PERF_DELTA_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_PRECISION_100NS_TIMER (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_PRECISION) or PERF_TIMER_100NS) or PERF_DELTA_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_PRECISION_OBJECT_TIMER (((((PERF_SIZE_LARGE or PERF_TYPE_COUNTER) or PERF_COUNTER_PRECISION) or PERF_OBJECT_TIMER) or PERF_DELTA_COUNTER) or PERF_DISPLAY_PERCENT)
#define PERF_PRECISION_TIMESTAMP PERF_LARGE_RAW_BASE
const PERF_DETAIL_NOVICE = 100
const PERF_DETAIL_ADVANCED = 200
const PERF_DETAIL_EXPERT = 300
const PERF_DETAIL_WIZARD = 400

type _PERF_COUNTER_DEFINITION
	ByteLength as DWORD
	CounterNameTitleIndex as DWORD

	#ifdef __FB_64BIT__
		CounterNameTitle as DWORD
	#else
		CounterNameTitle as LPWSTR
	#endif

	CounterHelpTitleIndex as DWORD

	#ifdef __FB_64BIT__
		CounterHelpTitle as DWORD
	#else
		CounterHelpTitle as LPWSTR
	#endif

	DefaultScale as LONG
	DetailLevel as DWORD
	CounterType as DWORD
	CounterSize as DWORD
	CounterOffset as DWORD
end type

type PERF_COUNTER_DEFINITION as _PERF_COUNTER_DEFINITION
type PPERF_COUNTER_DEFINITION as _PERF_COUNTER_DEFINITION ptr
const PERF_NO_UNIQUE_ID = -1

type _PERF_INSTANCE_DEFINITION
	ByteLength as DWORD
	ParentObjectTitleIndex as DWORD
	ParentObjectInstance as DWORD
	UniqueID as LONG
	NameOffset as DWORD
	NameLength as DWORD
end type

type PERF_INSTANCE_DEFINITION as _PERF_INSTANCE_DEFINITION
type PPERF_INSTANCE_DEFINITION as _PERF_INSTANCE_DEFINITION ptr

type _PERF_COUNTER_BLOCK
	ByteLength as DWORD
end type

type PERF_COUNTER_BLOCK as _PERF_COUNTER_BLOCK
type PPERF_COUNTER_BLOCK as _PERF_COUNTER_BLOCK ptr
#define PERF_QUERY_OBJECTS cast(LONG, &h80000000)
#define PERF_QUERY_GLOBAL cast(LONG, &h80000001)
#define PERF_QUERY_COSTLY cast(LONG, &h80000002)
#define MAX_PERF_OBJECTS_IN_QUERY_FUNCTION __MSABI_LONG(64)
const WINPERF_LOG_NONE = 0
const WINPERF_LOG_USER = 1
const WINPERF_LOG_DEBUG = 2
const WINPERF_LOG_VERBOSE = 3
