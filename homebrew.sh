#!/bin/bash
echo "❇️  Bienvenido al instalador de mis archivos Dots 👋"

# Xcode CLI
echo "🔎 buscando instalacion de Xcode CLI 🚀"
if ! command -v xcode-select &>/dev/null; then
	echo "‼️   Xcode CLI no está instalado. ⬇️ Instalando..."
	xcode-select --install
else
	echo "Xcode CLI ya está instalado ✅, Siguiente paso ⬇️  "
fi

# Brew
echo "🔎 Buscando instalacion de Brew 🍺"
if ! command -v brew &>/dev/null; then
	echo "‼️   Brew manager no esta instalado. ⬇️ Instalando..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "❇️  Brew ya esta instalado ✅, Siguiente paso ⬇️  "
fi

echo "❇️  Instalaremos los paquetes usuales de la lista 📋"
if [ -e "brew_programs_list.txt" ]; then
	while IFS= read -r package; do
		if brew list "$package" &>/dev/null; then
			echo "$package ya esta instalado, ignorando 😳"
		else
			echo "Instalando $package ⚡️ desde Brew 🍺"
			brew install "$package"
		fi
	done <"brew_programs_list.txt"
else
	echo "‼️ El archivo brew_programs_list.txt no existe, por favor revise. nada de brew se instalara."
fi
echo "❇️  Todo instalado con exito ✅"

# Install Zap-zsh
if ! command -v zap &>/dev/null; then
	echo "❇️  Comienza instalacion de zap-zsh ⚡️"
	zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
else
	echo "❇️  zap-zsh ya esta instalado correctamente ✅"
fi

# Symlinks Dots config
echo "❇️  Crearemos los enlaces simbolicos a los puntos de configuracion de cada programa 🔗"

ConfigDir="$HOME/.config/"  #Directorio destino
DotDir="$HOME/clones/conf/" #Directorio origen (proviene del repositorio Github)
#Lista de configuraciones a evaluar si existen en el destino
ListDots=(
	"bat"
	"btop"
	"fish"
	"kitty"
	"nvim"
	"sketchybar"
	"skhd"
	"wezterm"
	"yabai"
	"zsh"
	# "starship"
)

for item in "${ListDots[@]}"; do
	ConfList="$ConfigDir$item" #  Concatena directorio destino+configuracion para evaluar existencia

	if [ -e "$ConfList" ]; then
		rm -rf "$ConfList" # De existir el destino, lo elimina
	fi

	# Crea el enlace simbolico del origen a destino con las configuracion Dots
	ln -s "$DotDir$item" "$ConfigDir$item"
done

rm -rf $HOME/.config/starship.toml
ln -sf $HOME/clones/conf/starship/My_starship.toml $HOME/.config/starship.toml
rm -rf $HOME/.zshrc
ln -sf $HOME/clones/conf/.zshrc $HOME/.zshrc

echo "❇️  Listo los enlaces simbolicos ✅"
echo "🆗 Eso es todo reinicia y listo ✅✅"
