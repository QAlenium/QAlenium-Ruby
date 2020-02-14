require 'site_prism'

module YAMAN

  module Pages
    class QAPage < SitePrism::Page
	
      element :title, '#wrap > div > header > div > div > h1'
	    
    end
  end
end
