Dado(/^que estou na home do aplicativo$/) do  
  start_test_server_in_background                               
  element_exists "* text:'TrinaguloApp'"
end                                                                          
                                                                             
Quando(/^realizo um calculo de triangulo com todos os lados iguais$/) do     
  enter_text "* id:'txtLado1'", "10"
  enter_text "* id:'txtLado2'", "10"
  enter_text "* id:'txtLado3'", "10"
  touch "* id:'btnCalcular'"
end                                                                          
                                                                             
Entao(/^vejo a mensagem 'Equilatero'$/) do                                   
  element_exists "* text:'O triângulo é Equilátero'"
end                                                                          