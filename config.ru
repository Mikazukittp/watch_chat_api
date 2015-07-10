# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

# Rpushをrailsと同時に動作させるための記述
Rpush.embed
