Dado(/^que tenho a URL do webservice de cep dos correios$/) do
 @endpoint = CONFIG['servicos_cep']['urlCorreiosCepRest']
 @cep = CONFIG['cep']['valido']
end                                                                         
                                                                             
Quando(/^realizo uma requisicao com um cep valido$/) do 
  uri = URI.parse(@endpoint + @cep)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = false                     

  headers = {'Content-Type' => 'application/json;charset=UTF-8'}

  request = Net::HTTP::Get.new(uri.request_uri, headers)
  request.body = body.to_json
  resp = http.request(request)

  @response = JSON.parse(resp.body)
  
end                                                                          
                                                                             
Entao(/^recebo os dados do endereco$/) do                                    
  puts @response
end                                                                          