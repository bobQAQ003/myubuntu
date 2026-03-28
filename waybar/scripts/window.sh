#!/bin/bash
# Waybar 当前窗口信息脚本 - 混合方案（彩色图标）

window=$(niri msg --json focused-window 2>/dev/null)
if [ -z "$window" ] || [ "$window" = "null" ]; then
    echo "󱂬  无窗口"
    exit 0
fi

app_id=$(echo "$window" | jq -r '.app_id // "unknown"')
title=$(echo "$window" | jq -r '.title // "Unknown"')
pid=$(echo "$window" | jq -r '.pid // 0')

# 截断标题（最大 50 字符）
max_len=50
if [ ${#title} -gt $max_len ]; then
    title="${title:0:$((max_len-3))}..."
fi

case "$app_id" in
    *firefox*|*Firefox*)
        icon=""; color="#E66000"
        title=$(echo "$title" | sed 's/ — 配置[[:space:]]*[0-9][[:space:]]*— / — /g')
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *chrome*|*chromium*|*Chrome*|*Chromium*)
        icon=""; color="#4285F4"
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *alacritty*|*Alacritty*)
        icon=""; color="#F0A000"
        echo "<span color='$color'>$icon</span> alacritty"
        ;;
    
    *wezterm*|*WezTerm*)
        icon=""; color="#F0A000"
        echo "<span color='$color'>$icon</span> wezterm"
        ;;
    
    *kitty*|*Kitty*)
        icon=""; color="#F0A000"
        echo "<span color='$color'>$icon</span> kitty"
        ;;
    
    *code*|*Code*|*vscode*|*VSCode*)
        icon=""; color="#007ACC"
        clean=$(echo "$title" | sed 's/ - Code$//; s/ - VSCode$//; s/ - Code - OSS$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *cursor*|*Cursor*)
        icon=""; color="#007ACC"
        clean=$(echo "$title" | sed 's/ - Cursor$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *nautilus*|*Nautilus*)
        icon=""; color="#64B5F6"
        clean=$(echo "$title" | sed 's/ - Files$//')
        name=$(basename "$clean" 2>/dev/null || echo "$clean")
        echo "<span color='$color'>$icon</span> $name"
        ;;
    
        *nemo*|*Nemo*)
        icon=""; color="#64B5F6"
        clean=$(echo "$title" | sed 's/ - Nemo$//')
        name=$(basename "$clean" 2>/dev/null || echo "$clean")
        echo "<span color='$color'>$icon</span> $name"
        ;;
    
        *dolphin*|*Dolphin*)
        icon=""; color="#64B5F6"
        clean=$(echo "$title" | sed 's/ - Dolphin$//')
        name=$(basename "$clean" 2>/dev/null || echo "$clean")
        echo "<span color='$color'>$icon</span> $name"
        ;;
    
        *thunar*|*Thunar*)
        icon=""; color="#64B5F6"
        clean=$(echo "$title" | sed 's/ - Thunar$//')
        name=$(basename "$clean" 2>/dev/null || echo "$clean")
        echo "<span color='$color'>$icon</span> $name"
        ;;
    
    *spotify*|*Spotify*)
        icon=""; color="#1DB954"
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *vlc*|*VLC*|*mpv*|*Mpv*)
        icon=""; color="#FF8800"
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *obs*|*OBS*)
        icon=""; color="#FF4444"
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *discord*|*Discord*)
        icon=""; color="#5865F2"
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *telegram*|*Telegram*)
        icon=""; color="#24A1DE"
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *wechat*|*WeChat*)
        icon=""; color="#07C160"
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *gedit*|*Gedit*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - gedit$//; s/ - Gedit$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *mousepad*|*Mousepad*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Mousepad$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *sublime*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Sublime Text$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *vim*|*nvim*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Vim$//; s/ - Neovim$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *emacs*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Emacs$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *atom*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Atom$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *brackets*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Brackets$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *geany*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Geany$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *leafpad*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Leafpad$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *featherpad*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - FeatherPad$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *code-oss*)
        icon=""; color="#8BC34A"
        clean=$(echo "$title" | sed 's/ - Code - OSS$//')
        if [[ "$clean" == *"("*")"* ]]; then
            file=$(echo "$clean" | sed 's/ ([^)]*)$//')
            path=$(echo "$clean" | sed 's/.*[(]//' | sed 's/[)]$//')
            path_short=$(echo "$path" | sed "s|$HOME|~|")
            echo "<span color='$color'>$icon</span> $file ($path_short)"
        else
            echo "<span color='$color'>$icon</span> $clean"
        fi
        ;;
    
    *settings*|*Settings*|*control*|*Control*)
        icon=""; color="#9E9E9E"
        echo "<span color='$color'>$icon</span> $title"
        ;;
    
    *)
        icon="󱂬"; color
        icon="󱂬"; color="#FFFFFF"
        echo "<span color='$color'>$icon</span> $title"
        ;;
esac
