#language:pt
# encoding: utf-8

@cep @rest @webservices
Funcionalidade: Cep valido

	@cep_valido
	Cenario: Validacao de cep valido
  
		Dado que tenho a URL do webservice de cep dos correios
		Quando realizo uma requisicao com um cep valido
		Entao recebo os dados do endereco