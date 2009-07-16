#!ruby -Ku
#-*- coding: utf-8 -*-

require 'rubygems'
gem 'rhaiker', '0.1.2'
require 'rhaiker'
require 'yaml'
require 'sixamo'

SIXAMO_DICT = 'dict/main'
sixamo = Sixamo.new(SIXAMO_DICT)

CONFIG_FILE = 'list/config.yml'
config = YAML.load_file(CONFIG_FILE)

rh = Rhaiker.new
rh.api_key = config[:haiku_api][:basic_auth][:password]
rh.user_id = config[:haiku_api][:basic_auth][:user_id]
rh.source = config[:haiku_api][:source]
rh.user_agent = "Medaka-ChatterBot(0.1.0)"

BASIC_KEYWORD = rh.source
body = sixamo.talk
result = rh.status_update({:status => body, :keyword => BASIC_KEYWORD})

