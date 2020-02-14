
Dir[File.join(File.dirname(__FILE__), '../services/*.rb')].each { |file| require file }

module YAMAN
  
  module Services
    
	def cepCorreiosService
      YAMAN::Services::CepCorreiosServices.new
    end
  
  end
end
