#!/bin/bash
PROG_DIR=$(dirname "$0")

if [ -f "$1" ]; then
	VIDEO="$1"
else
	echo "---no video file, and exit --"
	exit 0
fi

#echo "---${PROG_DIR}--"

cd $PROG_DIR

# 创建日志目录
LOG_DIR="${PROG_DIR}/logs"
mkdir -p "${LOG_DIR}"

# 生成日志文件名
LOG_FILE="${LOG_DIR}/mpv_$(date +%Y%m%d_%H%M%S).log"

echo "--- Starting mpv with log: ${LOG_FILE} --"

# 创建临时按键配置文件
cat > "${PROG_DIR}/mpv_input.conf" << 'EOF'
# Select和Start按键
f cycle pause             # 显示信息（原START键）
l cycle mute              # 静音/恢复（原SELECT键）

# 方向键（不需要改，原生支持）
# UP                      # 快进60秒（原↑键）
# DOWN                    # 快退60秒（原↓键）
# LEFT                    # 快退10秒（原←键）
# RIGHT                   # 快进10秒（原→键）

# ABXY按键
p cycle video-unscaled    # 切换显示模式（全屏/拉伸/裁剪）（原A键）
s screenshot              # 拍照（原B键）
PGDWN cycle audio         # 切换音轨（原X键）
PGUP cycle sub            # 切换字幕（原Y键）

# 肩键LR
a add speed -0.1          # 降低播放速度（原L键）
c add speed 0.1           # 提高播放速度（原R键）

# 肩键L2,R2
v show-progress           # 显示详细信息（原L2键）
t cycle osd-level         # 显示/隐藏OSD（原R2键）

# Power 按键
# POWER quit-watch-later  # 本来就是退出

# 组合键（M键为Ctrl）
Ctrl+UP seek 600           # 快进10分钟（原Ctrl+↑键）
Ctrl+DOWN seek -600        # 快退10分钟（原Ctrl+↓键）

EOF

# 暂时禁用按键测试模式
MPV_INPUT_TEST=""
# 如需启用按键测试模式，请取消注释下面一行
#MPV_INPUT_TEST="--input-test"

if [ x"$2" == x"hdmi" ]
then
	
    SDL_NOMOUSE=1 SDL_AUDIO_CHANNELS=2 AUDIODEV=hw:2,0 \
	mpv --fullscreen --no-stop-screensaver --msg-level=all=info --input-conf="${PROG_DIR}/mpv_input.conf" ${MPV_INPUT_TEST} "${VIDEO}" > "${LOG_FILE}" 2>&1
	
else
	
	#HOME=${PROG_DIR} SDL_NOMOUSE=1 SDL_AUDIO_CHANNELS=2 
	SDL_NOMOUSE=1 SDL_AUDIO_CHANNELS=2 \
	mpv --fullscreen --no-stop-screensaver --msg-level=all=info --input-conf="${PROG_DIR}/mpv_input.conf" ${MPV_INPUT_TEST} "${VIDEO}" > "${LOG_FILE}" 2>&1
fi

# 清理临时配置文件
rm -f "${PROG_DIR}/mpv_input.conf"

echo "--- mpv finished. Check log file for details. --"

sync
