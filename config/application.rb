require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require :default, Rails.env

module Muckwork
  class Application < Rails::Application
    config.filter_parameters << :password
  end
end
