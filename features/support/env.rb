require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'
require 'capybara/poltergeist'
require 'without_accents'
require 'os'
require 'net/https'
require 'uri'
require 'nokogiri'
require 'xml/to/json'
require 'httparty'
require 'pry'
require 'multi_xml'
#require 'calabash-android/cucumber'

BROWSER = ENV['BROWSER']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']

## variable which loads the data file according to the environment
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}/#{ENVIRONMENT_TYPE}.yaml")

## register driver according with browser chosen
Capybara.register_driver :selenium do |app|
  if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app,
    :browser => :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' => {
        'args' => [ "--start-maximized" ]
      }
    )
  )
  elsif BROWSER.eql?('firefox')
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
  elsif BROWSER.eql?('internet_explorer')
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
  elsif BROWSER.eql?('safari')
    Capybara::Selenium::Driver.new(app, :browser => :safari)
  elsif BROWSER.eql?('poltergeist')
    options = { 
      js_errors: false,
      phantomjs_logger: File.open("log/test_phantomjs.log", "a"),
      phantomjs_options: ['--ignore-ssl-errors=true'],
      window_size: [1440,2000],
      screen_size: [1440,2000] }
    Capybara::Poltergeist::Driver.new(app, options)
  end
end

## configure the chosen browser
Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url']
end

## set default max wait and maximize browser
Capybara.default_max_wait_time = 25
unless BROWSER.eql?('poltergeist')
  Capybara.current_session.driver.browser.manage.window.maximize
end