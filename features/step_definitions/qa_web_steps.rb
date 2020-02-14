Dado(/^que estou na pagina principal da Yaman$/) do
  homePage.load
end

Quando(/^seleciono a opcao 'QA & Testes' no rodape$/) do
  homePage.linkQA.click
end
                                                                             
Entao(/^eu vejo a pagina de testes$/) do                                     
  qaPage.title.text.should == 'QA & Testes'
end