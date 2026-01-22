# Hyper-V_audioSolution
Uses Audio over IP to transmit audio between Host OS(Windows) and Guest OS(Linux Mint in my case). Used ffmeg to send audio over a network via UDP.
# Guest OS: Linux (The Sender)
## 1. Creating Audio Source

```bash
# Create a virtual speaker named 'remote'
pactl load-module module-null-sink sink_name=remote
```
## 2. File Location

Store audio_sender.service in your user-level systemd directory: `~/.config/systemd/user/audio-sender.service`
## 3. Configuration

Ensure the ExecStart line in the service file matches your Host's IP address:
```Bash

# Example:
udp://192.168.1.77:18181
```
## 4. Installation

Run the following commands to initialize the service:
```Bash

mkdir -p ~/.config/systemd/user/
# Move your file there
systemctl --user daemon-reload
systemctl --user enable audio-sender.service
systemctl --user start audio-sender.service
```
# Host OS: Windows (The Receiver)
## 1. File Locations

Place audio_receiver.bat anywhere except for `shell:startup`:

    `audio_receiver.bat`
And hide_receiver in the `shell:startup` directory:

    `hide_receiver.vbs`

## 2. Configuration

Edit audio_receiver.bat to ensure the path to ffplay.exe is correct:

```bash
 "C:\PATH\TO\ffplay.exe" -nodisp -fflags nobuffer ...
```
# Management & Troubleshooting
## Viewing Logs

    Linux: journalctl --user -u audio-sender.service -f

# Stopping the Stream

    Linux: systemctl --user stop audio-sender.service

    Windows: Open Task Manager (Ctrl+Shift+Esc) and end the ffplay.exe process.

# Requirements

    Linux: FFmpeg with libpulse support.

    Windows: FFmpeg (gyan.dev builds recommended).

    Network: Both OSs must be on the same local network or virtual bridge.
