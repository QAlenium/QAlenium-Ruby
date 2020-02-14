require 'httparty'

module YAMAN
  
  module Services
    
	class CepCorreiosServices #RESTful Service
        
        def doHttpGetRequest(url, param)
          response = HTTParty.get(url + param)
        return response
           
      end
    end
  end
end
