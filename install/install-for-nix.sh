#!/usr/bin/bash

# ./install/install-for-nix.sh
#
# This file is part of MEDAF Installer.
# MEDAF Installer is part of MEDAF.
#
# Copyright (C) 2022, Anokidev.
# Licensed in MIT License.
#
# Website + Documentation: https://medaf.readthedocs.io
# Source code: https://www.github.com/anokidev/medaf




# NOTE: This file is for Bash enviroment.
#
# This file is used for *NIX USERS ONLY (Mac OS, Linux, BSD, etc).
#
# Make sure that GNU Bash is installed!
#
# To run it, enter this command:
# sudo chmod u+x ./install/install-for-nix.sh
# ./install/install-for-nix.sh

dark_red="\e[0;31m"
light_red="\e[0;91m"

green="\e[0;32m"
blue="\e[0;34m"
white="\e[0:97m"

function major_line {

    local text=$1
    local success=$2

    if [["$success" = false]]; then
        echo "$dark_red==> $text"
    else
        echo "$green==> $white $text"
    fi

}

function minor_line {

    local text=$1
    local success=$2

    if [["$success" = false]]; then
        echo "$light_red  -> $text"
    else
        echo "$blue  -> $white $text"
    fi

}

function terminate_program {
    echo "$dark_red MEDAF Installer is terminated. Exiting..."
    exit 1
}

function option_build {
    echo ""

}

function option_install {
    echo ""
}

function option_help {
    echo "MEDAF Installer help message:"
    echo ""
    echo "|---------------------------------------------------------------------------------------|"
    echo "| Command   | Command Alias    | Definition                                             |"
    echo "|-----------|------------------|--------------------------------------------------------|"
    echo "| build     | -b | --build     | Build MEDAF. The result should be a .whl package file. |"
    echo "| install   | -i | --install   | Install MEDAF from the .whl package file.              |"
    echo "| help      | -h | --help      | Show MEDAF Installer help message.                     |"
    echo "| version   | -v | --version   | Show MEDAF and MEDAF Installer release version.        |"
    echo "| changelog | -c | --changelog | Show MEDAF and MEDAF Installer release changelog.      |"
    echo "|---------------------------------------------------------------------------------------|"

}

function option_version {
    echo "MEDAF Installer 0.0.0 Alpha 1."
    echo "Part of MEDAF 0.0.0 Alpha 1."
    echo ""
    echo "Website + documentation: https://medaf.readthedocs.io"
    echo "Source code: https://www.github.com/anokidev/medaf"
}

function option_changelog {
    echo "MEDAF:"
    echo "- Added the base system."
    echo "- Added the WSGI server."
    echo "- Added the MEDAF installer."
    echo ""
    echo "MEDAF Installer:"
    echo "- Added the Powershell and Bash version of the installer."
    echo "- Added the option build, install, help, version, and changelog."
}

function option_empty {
    major_line "Error: An argument is expected." false

    minor_line "Type './install/install-for-win.ps1 help' for more info." false

    terminate_program
}

function option_invalid {
    major_line "Error: Invalid argument." false

    minor_line "Type './install/install-for-win.ps1 help' for more info." false

    terminate_program
}

function main {

    echo ""

    local option="$1"

    if [[ "$option" = "build" ]] || [[ "$option" = "--build" ]] || [[ "$option" = "-b" ]]; then
        option_build
    elif [[ "$option" = "install" ]] || [[ "$option" = "--install" ]] || [[ "$option" = "-i" ]]; then
        option_install
    elif [[ "$option" = "help" ]] || [[ "$option" = "--help" ]] || [[ "$option" = "-h" ]]; then
        option_help
    elif [[ "$option" = "version" ]] || [[ "$option" = "--version" ]] || [[ "$option" = "-v" ]]; then
        option_version
    elif [[ "$option" = "changelog" ]] || [[ "$option" = "--changelog" ]] || [[ "$option" = "-c" ]]; then
        option_changelog
    elif [[ "$option" = "" ]]; then
        option_empty
    else
        option_invalid
    fi

}

arg="$1"
main $arg
