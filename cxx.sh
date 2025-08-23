#!/usr/bin/bash

# set -e

# 检查 gum
if ! command -v gum &>/dev/null; then
	echo "❌ 未检测到 gum，请先安装：https://github.com/charmbracelet/gum"
	exit 1
fi

# 自动查找项目根目录（包含 CMakeLists.txt）
find_project_root() {
	local dir="$PWD"
	while [ "$dir" != "/" ]; do
		if [ -f "$dir/CMakeLists.txt" ]; then
			echo "$dir"
			return 0
		fi
		dir=$(dirname "$dir")
	done
	return 1
}

PROJECT_ROOT=$(find_project_root)

# 固定模板目录（你可以改成你自己的模板路径）
TEMPLATE_DIR="$HOME/MyFile/template/cpp"
# 构建目录
BUILD_DIR="$PROJECT_ROOT/build"
# 默认构建类型
BUILD_TYPE="Debug"
# 运行标志
RUN_AFTER_BUILD=false
# 清理标志
CLEAN=false
# 编译标志
DO_CMAKE=false
# 初始化标志和目标目录
DO_INIT=false
INIT_TARGET_DIR=""

APP="cxx"

# 如果无参数，打印用法
if [ $# -eq 0 ]; then
	echo "用法:"
	echo "  $APP --cmake [--type Debug|Release]     构建并编译项目"
	echo "  $APP --clean                            清除构建目录"
	echo "  $APP --init  <目录名>                   初始化模板目录"
	echo "  $APP --run                              运行构建项目"
	exit 0
fi

# 参数解析
while [[ $# -gt 0 ]]; do
	case "$1" in
	--init)
		DO_INIT=true
		INIT_TARGET_DIR="$2"
		if [ -z "$INIT_TARGET_DIR" ]; then
			gum style --foreground 196 "❌ --init 需要一个目录名参数"
			exit 1
		fi
		shift 2
		;;
	--clean)
		CLEAN=true
		shift
		;;
	--run)
		RUN_AFTER_BUILD=true
		shift
		;;
	--type)
		if [[ "$2" != "Debug" && "$2" != "Release" ]]; then
			gum style --foreground 196 "❌ --type 参数必须是 Debug 或 Release"
			exit 1
		fi
		if ! $DO_CMAKE; then
			gum style --foreground 208 "⚠️ --type 参数必须与 --cmake 一起使用"
			exit 1
		fi
		BUILD_TYPE="$2"
		shift 2
		;;
	--cmake)
		DO_CMAKE=true
		shift
		;;
	*)
		gum style --foreground 196 "未知参数: $1"
		echo "用法:"
		echo "  $APP --cmake [--type Debug|Release]     构建并编译项目"
		echo "  $APP --clean                            清除构建目录"
		echo "  $APP --init  <目录名>                   初始化模板目录"
		echo "  $APP --run                              运行构建项目"
		exit 1
		;;
	esac
done

# 执行初始化逻辑
if $DO_INIT; then
	if [ ! -d "$TEMPLATE_DIR" ]; then
		gum style --foreground 196 "❌ 模板目录不存在: $TEMPLATE_DIR"
		exit 1
	fi

	if mkdir -p "$INIT_TARGET_DIR"; then
		gum style --foreground 10 "✅ 目录 '$INIT_TARGET_DIR' 创建成功"
	else
		gum style --foreground 196 "❌ 目录 '$INIT_TARGET_DIR' 创建失败"
		exit 1
	fi

	# 等待动画
	gum spin --spinner dot --title "正在初始化文件..." -- sleep 1

	# 启用 dotglob 复制隐藏文件
	shopt -s dotglob

	# 复制文件（包括隐藏文件）
	cp -r "$TEMPLATE_DIR"/* "$INIT_TARGET_DIR/"
	cp -r "$TEMPLATE_DIR"/.[!.]* "$INIT_TARGET_DIR/" 2>/dev/null || true

	gum style --foreground 10 "✅ 初始化完成：$INIT_TARGET_DIR"
	exit 0
fi

if [ -z "$PROJECT_ROOT" ]; then
	gum style --foreground 196 "❌ 未在当前路径中找到 CMake 项目"
	exit 1
fi

cd "$PROJECT_ROOT" || exit

# 清理逻辑
if $CLEAN; then
	if [ ! -d "$BUILD_DIR" ]; then
		gum style --foreground 208 "⚠️ 构建目录 '$BUILD_DIR' 不存在，无需删除。"
		exit 0
	fi

	if gum confirm "🧹 确认要删除构建目录 '$BUILD_DIR' 吗？"; then
		gum style --foreground 208 "🗑 正在删除 $BUILD_DIR..."
		rm -rf "$BUILD_DIR"
		gum style --foreground 35 "✅ 已成功删除构建目录"
	else
		gum style --foreground 220 "🚫 清理操作已取消"
	fi
	exit 0
fi

# 编译逻辑
if $DO_CMAKE; then
	if [ ! -d "$BUILD_DIR" ]; then
		gum style --foreground 39 "📁 创建构建目录: $BUILD_DIR"
		mkdir "$BUILD_DIR"
	fi

	cd "$BUILD_DIR" || {
		gum style --foreground 196 "❌ 进入构建目录失败"
		exit 1
	}

	gum style --foreground 39 "🔧 运行 cmake .. -DCMAKE_BUILD_TYPE=$BUILD_TYPE"
	cmake .. -DCMAKE_BUILD_TYPE="$BUILD_TYPE"

	gum style --foreground 39 "🔨 构建项目中..."
	cmake --build .

	gum style --foreground 10 "✅ 构建完成！"
fi

# 运行逻辑
if $RUN_AFTER_BUILD; then
	if [ ! -d "$BUILD_DIR" ]; then
		gum style --foreground 208 "⚠️ 构建目录 '$BUILD_DIR' 不存在，无法运行程序"
		exit 1
	fi

	cd "$BUILD_DIR" || {
		gum style --foreground 196 "❌ 进入构建目录失败"
		exit 1
	}

	EXECUTABLE=$(find . -maxdepth 1 -type f -executable | head -n 1)
	if [ -x "$EXECUTABLE" ]; then
		gum style --foreground 45 "🚀 运行程序: $EXECUTABLE"
		"$EXECUTABLE"
	else
		gum style --foreground 208 "⚠️ 没有找到可执行文件，跳过运行"
	fi
fi
