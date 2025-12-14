#!/bin/bash

# Opciones que se mostrarán en Wofi
OPTIONS="lock\nsuspend\nreboot\nshutdown\nlogout"

# Lanzar Wofi para elegir la acción
ACTION=$(echo -e "$OPTIONS" | wofi --dmenu --prompt="Sesión:")

# Borrar el historial de portapapeles antes de cualquier acción de salida
/usr/bin/cliphist wipe

# Ejecutar la acción elegida
case "$ACTION" in
    "lock")
        # Usaremos swaylock (ya instalado)
        exec swaylock
        ;;
    "suspend")
        # Bloquea la pantalla antes de suspender
        exec swaylock & systemctl suspend
        ;;
    "reboot")
        # Reiniciar
        systemctl reboot
        ;;
    "shutdown")
        # Apagar
        systemctl poweroff
        ;;
    "logout")
        # Cerrar sesión de Hyprland (y volver a SDDM)
        hyprctl dispatch exit
        ;;
    *)
        # Cancelar si no se eligió nada
        ;;
esac
