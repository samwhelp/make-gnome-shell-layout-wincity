#!/usr/bin/env bash




#echo "run: ${0}"




##
## ## Link
##
## * https://github.com/samwhelp/make-gnome-shell-layout-wincity/blob/main/part/make-gnome-shell-style/make-gnome-shell-style.sh
## * https://raw.githubusercontent.com/samwhelp/make-gnome-shell-layout-wincity/refs/heads/main/part/make-gnome-shell-style/make-gnome-shell-style.sh
##




##
## ## Args
##

DEFAULT_MASTER_DISTRO="debian"
REF_MASTER_DISTRO="${REF_MASTER_DISTRO:=$DEFAULT_MASTER_DISTRO}"

DEFAULT_MASTER_STYLE="vimix"
REF_MASTER_STYLE="${REF_MASTER_STYLE:=$DEFAULT_MASTER_STYLE}"




##
##
################################################################################
##
##




##
## ## Portal / Style
##

portal_gnome_shell_style_install () {

	echo
	echo
	echo "##"
	echo "## ## portal_gnome_shell_style_install"
	echo "##"
	echo
	echo

	mod_theme_install

	return 0
}




##
## ## Model / Theme
##

mod_theme_install () {

	sys_theme_install_wallpaper

	sys_theme_install_fluent_gtk_theme

	sys_theme_install_fluent_icon_theme

}

sys_theme_install_fluent_gtk_theme () {

	#sys_theme_install_fluent_gtk_theme_via_git_clone

	sys_theme_install_fluent_gtk_theme_via_wget_archive

}

sys_theme_install_fluent_gtk_theme_via_git_clone () {


	if [ -e "${HOME}/.themes/Fluent-round" ]; then
		return 0
	fi


	git clone https://github.com/vinceliuice/Fluent-gtk-theme /tmp/fluent-gtk-theme




	cd /tmp/fluent-gtk-theme

	./install.sh --tweaks noborder round --theme all

	cd "${OLDPWD}"

}

sys_theme_install_fluent_gtk_theme_via_wget_archive () {


	if [ -e "${HOME}/.themes/Fluent-round" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Fluent-gtk-theme/archive/refs/heads/master.tar.gz' -O '/tmp/Fluent-gtk-theme-master.tar.gz'




	cd /tmp

	tar xf Fluent-gtk-theme-master.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Fluent-gtk-theme-master

	./install.sh --tweaks noborder round --theme all

	cd "${OLDPWD}"

}

sys_theme_install_fluent_icon_theme () {

	#sys_theme_install_fluent_icon_theme_via_git_clone

	sys_theme_install_fluent_icon_theme_via_wget_archive

}

sys_theme_install_fluent_icon_theme_via_git_clone () {


	if [ -e "${HOME}/.local/share/icons/Fluent" ]; then
		return 0
	fi


	git clone https://github.com/vinceliuice/Fluent-icon-theme /tmp/fluent-icon-theme




	cd /tmp/fluent-icon-theme

	./install.sh --all

	cd "${OLDPWD}"




	cd /tmp/fluent-icon-theme/cursors

	./install.sh

	cd "${OLDPWD}"

}

sys_theme_install_fluent_icon_theme_via_wget_archive () {


	if [ -e "${HOME}/.local/share/icons/Fluent" ]; then
		return 0
	fi


	wget -c 'https://github.com/vinceliuice/Fluent-icon-theme/archive/refs/heads/master.tar.gz' -O '/tmp/Fluent-icon-theme-master.tar.gz'




	cd /tmp

	tar xf Fluent-icon-theme-master.tar.gz

	cd "${OLDPWD}"




	cd /tmp/Fluent-icon-theme-master

	./install.sh --all

	cd "${OLDPWD}"




	cd /tmp/Fluent-icon-theme-master/cursors

	./install.sh

	cd "${OLDPWD}"

}




##
## ## Model / Wallpaper
##

sys_theme_install_wallpaper () {


	## config via dconf
	dconf write /org/gnome/desktop/background/picture-uri "'/usr/share/backgrounds/default.png'"
	dconf write /org/gnome/desktop/background/picture-uri-dark "'/usr/share/backgrounds/default.png'"
	dconf write /org/gnome/desktop/screensaver/picture-uri "'/usr/share/backgrounds/default-login.png'"


	if [ -e "/usr/share/backgrounds/Fluent-round-dark.png" ]; then
		return 0
	fi


	echo
	echo sudo mkdir -p "/usr/share/backgrounds"
	echo
	sudo mkdir -p "/usr/share/backgrounds"


	cd "/usr/share/backgrounds"


	echo
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Fluent-kde/refs/heads/main/wallpaper/Fluent-round-dark/contents/images/3840x2160.png" -O "./Fluent-round-dark.png"
	echo
	sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Fluent-kde/refs/heads/main/wallpaper/Fluent-round-dark/contents/images/3840x2160.png" -O "./Fluent-round-dark.png"


	echo
	echo sudo wget -c "https://raw.githubusercontent.com/vinceliuice/MacTahoe-kde/refs/heads/main/wallpapers/MacTahoe-Light/contents/images/3840x2160.jpeg" -O "./Fluent-round-light.png"
	echo
	sudo wget -c "https://raw.githubusercontent.com/vinceliuice/Fluent-kde/refs/heads/main/wallpaper/Fluent-round-light/contents/images/3840x2160.png" -O "./Fluent-round-light.png"


	sudo ln -sf Fluent-round-dark.png next.png
	sudo ln -sf next.png default.png
	sudo ln -sf next.png default-login.png
	sudo ln -sf next.png default-grub.png


	cd "${OLDPWD}"

}




##
##
################################################################################
##
##




##
## ## Portal
##

portal_gnome_shell_install () {

	portal_gnome_shell_style_install

}


##
## ## Main
##

__main__ () {

	portal_gnome_shell_install

}

__main__
