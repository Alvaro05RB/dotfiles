#!/bin/bash

# Opciones que se mostrarán en Wofi
OPTIONS="lock\nreboot\nshutdown\n"

# Lanzar Wofi para elegir la acción
ACTION=$(echo -e "$OPTIONS" | wofi --dmenu --prompt="Session:")

# Borrar el historial de portapapeles antes de cualquier acción de salida
/usr/bin/cliphist wipe

# Ejecutar la acción elegida
case "$ACTION" in
    "lock")
	# Usaremos swaylock (ya instalado)
	exec swaylock
	;;
    "reboot")
	# Reiniciar
	systemctl reboot
	;;
    "shutdown")
	# Apagar
	systemctl poweroff
	;;
    *)
	# Cancelar si no se eligió nada
	;;
esac
