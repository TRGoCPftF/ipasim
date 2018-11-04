list (APPEND CMAKE_MODULE_PATH "${SOURCE_DIR}/scripts")
include (CommonVariables)

file (MAKE_DIRECTORY "${IPASIM_CMAKE_DIR}")
execute_process (
    COMMAND cmake -G Ninja
        -DSUPERBUILD=Off
        "-DCMAKE_C_COMPILER=${CLANG_EXE}"
        -DCMAKE_C_COMPILER_ID=Clang
        "-DCMAKE_CXX_COMPILER=${CLANG_EXE}"
        -DCMAKE_CXX_COMPILER_ID=Clang
        "-DCMAKE_LINKER=${LLD_LINK_EXE}"
        "-DCMAKE_AR=${LLVM_BIN_DIR}/llvm-ar.exe"
        -DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY
        "-DCLANG_CMAKE_DIR=${CLANG_CMAKE_DIR}"
        "-DSOURCE_DIR=${SOURCE_DIR}"
        "-DBINARY_DIR=${BINARY_DIR}"
        -DCMAKE_EXPORT_COMPILE_COMMANDS=On
        "${SOURCE_DIR}"
    WORKING_DIRECTORY "${IPASIM_CMAKE_DIR}")
