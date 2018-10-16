# -*- coding: utf-8 -*-
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

import logging
import requests
import json

#Rasa
from rasa_core_sdk import Action
from rasa_core.policies.fallback import FallbackPolicy
from rasa_core.policies.keras_policy import KerasPolicy
from rasa_core.agent import Agent

#peterbot
from config import *

logger = logging.getLogger(__name__)

fallback = FallbackPolicy(fallback_action_name="action_default_fallback",
                          core_threshold=0.3,
                          nlu_threshold=0.3)

agent = Agent("domain.yml", policies=[KerasPolicy(), fallback])

class ActionJoke(Action):
    def name(self):
        # define the name of the action which can then be included in training stories
        return "action_joke"

    def run(self, dispatcher, tracker, domain):
        # what your action should do
        request = requests.get('http://api.icndb.com/jokes/random').json() #make an apie call
        joke = request['value']['joke'] #extract a joke from returned json response
        dispatcher.utter_message(joke) #send the message back to the user
        return []
