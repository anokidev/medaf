# ./install/install-for-win.ps1
#
# This file is part of MEDAF Installer.
# MEDAF Installer is part of MEDAF.
#
# Copyright (C) 2022, Anokidev.
# Licensed in MIT License.
#
# Website + Documentation: https://medaf.readthedocs.io
# Source code: https://www.github.com/anokidev/medaf




# NOTE: This file is for Powershell enviroment.

# This file is used for WINDOWS ONLY.

# Make sure that Powershell is installed!

# To run it, enter this command:
#
# Windows:
# pwsh ./install/install-for-win.ps1




###### TEXT ######

function Major-Line {

    if (!($args[1])) {
        Write-Host "==> $($args[0])" -ForegroundColor DarkRed
    } else {
        $MajorLine = Write-Host -nonewline "==>" -ForegroundColor green
        Write-Host $MajorLine "$($args[0])"
    }

}

function Minor-Line {

    if (!($args[1])) {
        Write-Host "  -> $($args[0])" -ForegroundColor red
    } else {
        $MinorLine = Write-Host -nonewline "  ->" -ForegroundColor blue
        Write-Host $MinorLine "$($args[0])"
    }

}

function Terminate-Program {
    Write-Host ""
    Write-Host "MEDAF Installer is terminated. Exiting..." -ForegroundColor DarkRed
    exit 1
}

###### BUILD ######

function Option-Build {

    Major-Line "Building MEDAF..." $true

    # Python and PIP.
    Major-Line "Checking if the necessary tools are installed..." $true

        # PyLauncher.
        Minor-Line "Get-Command py -errorAction SilentlyContinue" $true

        # PIP.
        Minor-Line "Get-Command pip -errorAction SilentlyContinue" $true

    # Upgrading build tools.
    Major-Line "Upgrading build tools..." $true

        # Build tools.
        Minor-Line "pip install --upgrade build pip" $true

    Major-Line "Building MEDAF into a package..." $true

        # Run setup.py
        Minor-Line "py -m build" $true

    Write-Host ""

    Write-Host "The building process has been completed!" -ForegroundColor green
    Write-Host "Filename: 'medaf-anokidev-0.0.0a1-py3-none-any.whl'" -ForegroundColor green

}

###### INSTALL ######

function Option-Install {

    # Greeting message.
    Major-Line "Installing the package..." $true

    # Check if the .whl file exist.
    Major-Line "Checking if the package was already built..." $true

    if (!(Test-Path -path "../dist/medaf-anokidev-0.0.0a1-py3-none-any.whl")) {

        Minor-Line "Error! './dist/medaf-anokidev-0.0.0a1-py3-none-any.whl' does not exist." $false
        Major-Line "Error! Can not continue the installation."
        Major-Line "You haven't built the package yet, or you deleted the package file or the 'dist' folder." $false

        Terminate-Program

    };

};

###### HELP ######

function Option-Help {
    Write-Host "MEDAF Installer help message:"
    Write-Host ""
    Write-Host "|---------------------------------------------------------------------------------------|"
    Write-Host "| Command   | Command Alias    | Definition                                             |"
    Write-Host "|-----------|------------------|--------------------------------------------------------|"
    Write-Host "| build     | -b | --build     | Build MEDAF. The result should be a .whl package file. |"
    Write-Host "| install   | -i | --install   | Install MEDAF from the .whl package file.              |"
    Write-Host "| help      | -h | --help      | Show MEDAF Installer help message.                     |"
    Write-Host "| version   | -v | --version   | Show MEDAF and MEDAF Installer release version.        |"
    Write-Host "| changelog | -c | --changelog | Show MEDAF and MEDAF Installer release changelog.      |"
    Write-Host "|---------------------------------------------------------------------------------------|"
}

###### VERSION ######

function Option-Version {
    Write-Host "MEDAF Installer 0.0.0 Alpha 1 - For Windows."
    Write-Host "Part of MEDAF 0.0.0 Alpha 1."
    Write-Host ""
    Write-Host "Website + documentation: https://medaf.readthedocs.io"
    Write-Host "Source code: https://www.github.com/anokidev/medaf"
};

###### CHANGELOG ######

function Option-Changelog {
    Write-Host "MEDAF:"
    Write-Host "- Added the base system."
    Write-Host "- Added the WSGI server."
    Write-Host "- Added the MEDAF installer."
    Write-Host ""
    Write-Host "MEDAF Installer:"
    Write-Host "- Added the Powershell and Bash version of the installer."
    Write-Host "- Added the option build, install, help, version, and changelog."
}

###### ERROR ######

function Option-Empty {

    Major-Line "Error: An argument is expected." $false

    Minor-Line "Type './install/install-for-win.ps1 help' for more info." $false

    Terminate-Program

}


function Option-Invalid {

    Major-Line "Error: Invalid argument." $false

    Minor-Line "Type './install/install-for-win.ps1 help' for more info." $false

    Terminate-Program

}

###### MAIN ######

function Main-Function {

    $option = $args[0]

    # LineBreak.
    Write-Host ""

    if ($option -eq 'build' -or $option -eq '--build' -or $option -eq '-b') {
        Option-Build
    } elseif ($option -eq 'install' -or $option -eq '--install' -or $option -eq '-i') {
        Option-Install
    } elseif ($option -eq 'help' -or $option -eq '--help' -or $option -eq '-h') {
        Option-Help
    } elseif ($option -eq 'version' -or $option -eq '--version' -or $option -eq '-v') {
        Option-Version
    } elseif ($option -eq 'changelog' -or $option -eq '--changelog' -or $option -eq '-c') {
        Option-Changelog
    } elseif ($option -eq '') {
        Option-Empty
    } else {
        Option-Invalid
    }

}

# Get the arguments.
$option = $args[0]

Main-Function $option
