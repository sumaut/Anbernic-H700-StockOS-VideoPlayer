# FFplay to MPV Script

This script converts the original FFplay.sh script to use MPV instead of FFplay, with custom key mappings optimized for handheld devices.

## Features

- **MPV Integration**: Uses MPV instead of FFplay for better performance and features
- **Custom Key Mappings**: Optimized for handheld device controls
- **Error Logging**: Detailed logs for debugging
- **Display Mode Switching**: Support for different display modes (fullscreen, stretch, crop)
- **Playback Speed Control**: Adjust playback speed with shoulder buttons
- **Remember Position**: Save playback position when exiting

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/ffplayer-to-mpv.git
   cd ffplayer-to-mpv
   ```

2. **Make the script executable**:
   ```bash
   chmod +x FFplay.sh
   ```

3. **Backup original script**:
   ```bash
   # On the device
   cp /mnt/vendor/bin/video/FFplay.sh /mnt/vendor/bin/video/FFplay.sh.bak
   ```

4. **Copy the script to device**:
   ```bash
   # Transfer the script to your device and then run:
   cp FFplay.sh /mnt/vendor/bin/video/
   ```

## Note
- The device already has MPV pre-installed, so no need to install it separately
- Always backup the original FFplay.sh before replacing it
- The script is designed to work with the device's existing hardware and key mappings

## Usage

The script is called automatically by the device when playing videos. You can also run it manually:

```bash
/mnt/vendor/bin/video/FFplay.sh <video_file> [hdmi]
```

- `<video_file>`: Path to the video file you want to play
- `[hdmi]`: Optional parameter to use HDMI audio output

## Key Mappings

### Basic Controls
- **START** (f): Play/Pause
- **SELECT** (l): Mute/Unmute
- **A** (p): Cycle display modes (fullscreen/stretch/crop)
- **B** (s): Screenshot
- **X** (PGDWN): Cycle audio tracks
- **Y** (PGUP): Cycle subtitles

### Directional Pad
- **↑** (UP): Volume +5
- **↓** (DOWN): Volume -5
- **←** (LEFT): Seek -10 seconds
- **→** (RIGHT): Seek +10 seconds

### Shoulder Buttons
- **L** (a): Decrease playback speed by 0.1
- **R** (c): Increase playback speed by 0.1
- **L2** (v): Show detailed video information
- **R2** (t): Cycle OSD level

### Power Button
- **POWER**: Exit MPV
- **Q**: Exit MPV and remember playback position

### Combination Keys (M键为Ctrl)
- **Ctrl+UP**: Seek +600 seconds (10 minutes)
- **Ctrl+DOWN**: Seek -600 seconds (10 minutes)

## Configuration

The script generates a temporary `mpv_input.conf` file with the key mappings. You can modify the key mappings by editing the script directly.

## Logging

The script generates log files in the `logs/` directory. These logs can help debug any issues with playback or key mappings.

## Troubleshooting

- **No video playback**: Check if MPV is installed correctly and the video file exists
- **No sound**: Try using the `hdmi` parameter if you're using an HDMI connection
- **Key mappings not working**: Check the log files for any errors

## Contributing

Feel free to submit issues or pull requests to improve the script.

## License

MIT License
