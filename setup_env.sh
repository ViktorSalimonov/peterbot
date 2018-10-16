#!/bin/bash

PY_VERSION="3.6.6"
echo "Installation..."
pyenv install -s $PY_VERSION
pyenv local $PY_VERSION
eval "$(pyenv init -)"

str="$(pyenv version)"
if ! [[ $str = *$PY_VERSION* ]]; then
  echo "Could not setup Python"
  exit 1
fi
echo "Python installed successfully"

echo "Installation of Rasa Core..."
pip install rasa_core

echo "Installation of Rasa Natural Language Understanding engine..."
pip install rasa_nlu[tensorflow]

echo "Installing dependencies"
pip install -r requirements.txt

echo "Installin spaCy English mode"
python -m spacy download en

