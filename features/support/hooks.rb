require_relative 'helper.rb'
require_relative 'spec_helper.rb'
require_relative 'service_helper.rb'

## PageObjets Definitions
World(YAMAN::Pages)
World(YAMAN::Services)

## Helpers Definitions
World(Helper)

## Cucumber Definitions
Before do |feature|

  # Get scenario infos
  # @scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  # @count = 0       
  # @steps = Array.new

  # scenario.test_steps.each do |x|
  #   @steps << x if x.name != 'AfterStep hook'
  # end
  
end

After do |scenario|
  ## take screenshot
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'failed')
  else
    take_screenshot(scenario_name.downcase!, 'passed')
  end
  ## kills instance when not headless
  unless BROWSER.eql?('poltergeist')
    Capybara.current_session.driver.quit
  end
end

