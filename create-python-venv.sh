#!/bin/bash

while [ -z "$version" ]
do
    echo
    echo "Define the Python version."
    echo "If you want to know the available versions, hit enter with blank."
    # note: read command trim space in head and tail
    read version

    # not blank input
    if [ -n "$version" ]; then
        break
    fi

    # show available versions
    echo "Installed versions:"
    pyenv versions
    echo
    pyenv install --list
done

# when not installed
if ! pyenv versions | sed 's/[ ¥*]//g' | sed 's/(.*)//' | grep -Eq "^${version}$"; then
    # if available, ask the user if he/she will install it.
    if pyenv install --list | grep -v Available | sed 's/[ ¥*]//g' | sed 's/(.*)//' | grep -Eq "^${version}$"; then
        read -p "do you want to install the version? (y/N)" add_version
        case "$add_version" in
            [Yy])
                # install the specified version.
                # when failed, exit this script.
                if ! pyenv install "$version"; then
                    echo "fail to install"
                    exit 2
                fi
                ;;
            [Nn])
                echo "canceled by user"
                exit 1
                ;;
            *)
                echo "invalid operation"
                exit 1
                ;;
        esac
    else
        echo "Version: ${version} is not available"
        exit 2
    fi
fi

# build a virtual environment
pyenv local $version
if ! python -m venv .venv; then
    echo "fail to make venv. check Python version."
    exit 3
fi

echo
echo "Succeeded!"