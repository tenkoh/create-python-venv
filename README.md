# create-python-venv
Shell command to switch python versions and build a virtual environment (venv) with the specified python version.

**Note: Linux or Mac ONLY**

## what does this script do?
1. Switch the Python version using `pyenv`. If the specified version is not installed, ask the user whether to install the version or not.
1. Create a virtual environment using `venv`.

Brief example is here. This script provides a conversational guide to build a development environment.
```
pyenv local 3.9.6
python -m venv .venv
```

Afrer building a environment, you could develop a Python project in a closed environment. (**keep your global environment clean!**)

## installation
1. Clone this repository.
1. Move `create-python-venv.sh` to a directory which you like. (Add path to the directory would make you happy:) )
1. Make a project root directory and move into it.
1. Execute `create-python-venv.sh`.

**Note**

Before using this script, you have to install `pyenv`.