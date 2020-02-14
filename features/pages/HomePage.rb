require 'site_prism'

module YAMAN
  
  module Pages
  
    class HomePage < SitePrism::Page
      set_url '/'
      #section :header, YAMAN::Sections::Header, '.headeralign'
      element :linkQA, '#text-4 > div > a:nth-child(5)'
	    
    end

  end
  
end


