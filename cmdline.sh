#!/bin/bash

cd /peterbot
python -m rasa_core.run -d models/current/dialogue -u models/current/nlu --endpoints endpoints.yml
