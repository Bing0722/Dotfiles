# 设置所需的最低 CMake 版本为 3.30
cmake_minimum_required(VERSION 3.30)

# 指定使用 clang++ 作为 C++ 编译器
set(CMAKE_CXX_COMPILER clang++)
# 指定使用 clang 作为 C 编译器
set(CMAKE_C_COMPILER clang)

# 定义项目名称、版本、语言
project(Demo VERSION 0.1 LANGUAGES CXX)

# 设置 C++ 标准为 C++23
set(CMAKE_CXX_STANDARD 23)
# 强制使用指定的 C++ 标准
set(CMAKE_CXX_STANDARD_REQUIRED true)
# 生成 compile_commands.json 文件，便于工具分析编译命令
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# 添加头文件搜索路径 include/
include_directories(include)

# 搜索 src/ 目录下所有 .cc 文件，并保存到 SOURCES 变量中
file(GLOB SOURCES "src/*.cc")

# 使用指定源文件创建可执行文件，名称为项目名称
add_executable(${PROJECT_NAME} ${SOURCES})

# 链接目标依赖库（此处未指定库）
target_link_libraries(${PROJECT_NAME})
