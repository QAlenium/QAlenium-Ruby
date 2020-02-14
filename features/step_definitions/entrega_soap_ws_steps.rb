Dado(/^que tenho a URL do webservice de prazo dos correios$/) do
  @endpoint = CONFIG['servicos_cep']['urlCorreiosCepSoap']
end

Quando(/^preparo uma requisicao com cep de origem de SP$/) do
  @cepOrigem = CONFIG['cep']['valido']
end

Quando(/^com cep de destino de SP$/) do
  @cepDestino = CONFIG['cep']['destinoValido']
end

Entao(/^recebo os dados do prazo de entrega$/) do
  
      uri = URI.parse(@endpoint)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = false

        headers = {
        'Content-Type' => 'text/xml; charset=utf-8',
        'SOAPAction' => CONFIG['soapAction']['calcPrazo']
        }
        
      req = <<-EOF
        <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
          <soap:Body>
            <CalcPrazo xmlns="http://tempuri.org/">
              <nCdServico>40010</nCdServico>
              <sCepOrigem>06220090</sCepOrigem>
              <sCepDestino>06293050</sCepDestino>
            </CalcPrazo>
          </soap:Body>
        </soap:Envelope>
        EOF
      
      resp = http.post(uri.path, req, headers)

      xml = Nokogiri::XML(resp.body)

      puts xml

end