import os
import os.path as op
from logging import getLogger

import yaml

log = getLogger(__name__)

DEPLOYMENT_PROFILE = os.environ.get('DEPLOYMENT_PROFILE', 'default')

CONFIG_FILE = 'config.yaml'

if op.exists(CONFIG_FILE):
    with open(CONFIG_FILE) as f:
        cfg = yaml.load(f)[DEPLOYMENT_PROFILE]
    cfg['DEPLOYMENT_PROFILE'] = DEPLOYMENT_PROFILE
else:
    log.warning("Config file wasn't found")
    cfg = {}

class ConfigurationManager:
    def __init__(self, config):
        self.config = config

    def get(self, option, default=None):
        return self.config.get(option, default)

settings = ConfigurationManager(cfg)