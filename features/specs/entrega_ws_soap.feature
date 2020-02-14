#language:pt

@entrega @soap @webservices
Funcionalidade: Prazo de entrega

	@prazo_entrega
	Cenario: Validacao de prazo de entrega
  
		Dado que tenho a URL do webservice de prazo dos correios
		Quando preparo uma requisicao com cep de origem de SP
		E com cep de destino de SP
		Entao recebo os dados do prazo de entrega