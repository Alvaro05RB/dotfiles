#!/bin/bash

# Directorio de capturas robusto
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

# Ruta y nombre del archivo (timestamp para evitar sobrescribir)
FILE="$SCREENSHOT_DIR/$(date +%s_grim.png)"

# Asegurarse de que el directorio existe
mkdir -p "$SCREENSHOT_DIR"

# Usar slurp para seleccionar un área
SLURP_OUT=$(slurp)

# Si la selección no está vacía (no fue cancelada)
if [ -n "$SLURP_OUT" ]; then
    # 1. Capturar el área seleccionada y guardarla
    grim -g "$SLURP_OUT" "$FILE"

    # 2. Copiar la imagen al portapapeles (wl-copy)
    # Importante: wl-copy acepta la imagen desde la entrada estándar
    wl-copy < "$FILE"

    # 3. Notificar al usuario (con icono de la propia captura)
    dunstify -u low -i "$FILE" "Captura Exitosa" "Área capturada y copiada al portapapeles."
else
    dunstify -u low "Captura Cancelada" "Selección de área cancelada."
fi
