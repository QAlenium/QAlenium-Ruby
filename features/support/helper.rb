require 'fileutils'
require 'without_accents'
require 'calabash-android'

module Helper
    
    # Custom commands
    def mouse_over(element_selector)
      element = Capybara.page.driver.browser.find_element(:css, element_selector)
      Capybara.page.driver.browser.mouse.move_to element
    end
    
    # Screenshots
    def take_screenshot(file_name, result)
      timer_path = Time.now.strftime('%Y_%m_%d').to_s
      file_path = "reports/screenshots/test_#{result}/run_#{timer_path}"
      screen = "#{file_path}/#{file_name}.png"
      screen.gsub! ',', ''
      puts screen

      begin
      #for web-based prints
      page.save_screenshot(screen)
      embed(screen, 'image/png', 'SCREENSHOT')
      rescue
      #for mobile-based prints
      screenshot
      File.rename("screenshot_0.png", "#{file_name}.png")
      Dir.mkdir Dir.getwd+"/reports/screenshots"
      Dir.mkdir Dir.getwd+"/reports/screenshots/test_#{result}"
      Dir.mkdir Dir.getwd+"/reports/screenshots/test_#{result}/run_#{timer_path}"
      FileUtils.mv(Dir.getwd+"/"+file_name+".png", Dir.getwd+"/#{file_path}")
      end
      
    end
    
end
