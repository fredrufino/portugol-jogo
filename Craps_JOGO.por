// Fabricio Souza Maciel
// Frederico Gérald de Freitas Diniz Rufino
// Karin Rumiko Kagi

programa
{
	inclua biblioteca Tipos --> n
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
	const inteiro TAM = 20

	// Exibe o menu do jogo
	funcao inteiro exibirMenu(){
  		inteiro opcao

		escreva ("\n1 - INICIAR JOGO")
		escreva ("\n2 - PONTUAÇÃO")
		escreva ("\n3 - REGRAS")
		escreva ("\n4 - SAIR")
		escreva ("\nDigite uma opção: ")
		leia(opcao)
		retorne opcao
	}

	// Define a aposta (valor apostado e opção a favor ou contra os dados)
	funcao inteiro apostarMoedasOpcao(inteiro pont, inteiro vetorOp[], inteiro k){
		real valor
		inteiro aposta
		// Define o valor da aposta		
		escreva ("\nVocê tem ",pont," moedas!")
		faca{
			escreva ("\nQuantas moedas quer apostar? ")
			leia (valor)
			se (valor <=0){
				escreva ("Aposta mínima: 1 moeda\n")
			}
			n.real_para_inteiro (valor)
			aposta = valor
		}enquanto (aposta <=0) 
						
		// Define a opção apostada
		faca{
			escreva ("\nEscolha: ")
			escreva ("\n1 - para jogar a favor dos dados")
			escreva ("\n2 - para jogar contra os dados\n")				
			leia(vetorOp[k])
			se (vetorOp[k]<1 ou vetorOp[k]>2) escreva ("Opção inválida!\n")
		}enquanto (vetorOp[k]<1 ou vetorOp[k]>2)	
		
		retorne aposta
	}

	// Lança os dados e faz a soma
	funcao inteiro jogarDados(){
		inteiro dado1=0, dado2=0, dados
	
		u.aguarde(1000)
		dado1 = u.sorteia(1, 6)
		escreva ("\nDado 1: ", dado1,"\n")
	  	dado2 = u.sorteia(1, 6)
		escreva ("Dado 2: ", dado2,"\n")

		dados = dado1 + dado2
		retorne dados
	}

	// Avalia a pontuação obtida nos dados da jogada de saída
	funcao inteiro pontuarSaida (inteiro dados){
		inteiro i=0
	
		se (dados == 7 ou dados == 11){
			escreva ("NATURAL\n") 
			retorne i-1
		}senao se (dados == 2 ou dados == 3 ou dados == 12){
			escreva ("CRAPS\n") 
			retorne i-2
		}senao{
			escreva ("PONTO = ",dados,"\n")
			retorne i+1
		}
	}

	// Avalia a pontuação obtida nos dados da jogada de pontos
	funcao inteiro pontuarPontos (inteiro dadosI, inteiro dadosP){
		inteiro i=0
		
		se (dadosP == 7){
			escreva ("CRAPS\n") 
			retorne i-2
		}senao se (dadosP == dadosI){
			retorne i-1
		}senao{
	    	     retorne 0
	    	}
	}

	// Verifica a pontuação das jogadas de acordo com a opção de aposta
	funcao vazio ganhouPerdeu(inteiro jogada, inteiro vetorOp[], inteiro vetorRes[], inteiro k){
	
		escolha(vetorOp[k]){
			caso 1:
				se (jogada == -2){
					vetorRes[k] = 0	
				}senao se (jogada == -1){
					vetorRes[k] = 1
				}senao{
					vetorRes[k] = 0        
				}  
				pare
			   
			caso 2:
				se (jogada == -2){
					vetorRes[k] = 0
				}senao se (jogada == -1){
					vetorRes[k] = 0
				}senao{
					vetorRes[k] = 1       
				}       
				pare
		}
	}

	// Altera o número de moedas de acordo com o resultado do jogo
	funcao inteiro saldoJogo (inteiro apostaM, inteiro pont, inteiro vetorRes[], inteiro k){
		
		se (vetorRes[k]==1){
			pont = pont + apostaM
			escreva ("Você ganhou ", apostaM," moedas\n")
		}senao{
			pont = pont - apostaM
			escreva ("Você perdeu ", apostaM," moedas\n")
		}
		retorne pont
	}


	funcao vazio historicoPontuacao (inteiro vetorOp[], inteiro vetorRes[], inteiro pont, inteiro k){

		escreva ("\n************************************\n")   
		escreva ("\tSEU HISTÓRICO DE JOGO\n\n")
		para (k=0; k<TAM; k++){
			se (vetorOp[k] == 1){
				se (vetorRes[k] == 1){
					escreva ("Jogo ", k+1,": você jogou A FAVOR e GANHOU\n")
				}senao{
					escreva ("Jogo ", k+1,": você jogou A FAVOR e PERDEU\n")
				}	  		
			}
			se (vetorOp[k] == 2){
				se (vetorRes[k] == 1){
					escreva ("Jogo ", k+1,": você jogou CONTRA e GANHOU\n")
				}senao{
					escreva ("Jogo ", k+1,": você jogou CONTRA e PERDEU\n")
				}
			}
		}
		escreva ("\n\tVocê tem: ", pont," moedas\n")  
		escreva ("************************************\n") 
	}


	funcao vazio mostrarRegras(){
		escreva ("\n\t\t************************************\n")       
		escreva ("Craps é um jogo de dados em duas etapas:\n\n")
		escreva ("JOGADA INICIAL:\n")
		escreva ("- se tirar 7 ou 11 na soma dos dados, você tem um NATURAL e encerra a jogada;\n")
		escreva ("- se tirar 2, 3 ou 12, você tem um CRAPS e encerra a jogada;\n")
		escreva ("- se tirar qualquer outro número (4, 5, 6, 8, 9, ou 10), continua em outras jogadas;\n\n")
		escreva ("OUTRAS JOGADAS:\n")
		escreva ("- Você deve jogar novamente os dados até obter o valor da jogada inicial (PONTO), mas se tirar um 7 a jogada é encerrada por CRAPS.\n\n")
		escreva ("PONTUAÇÃO:\n")
		escreva ("- Sua pontuação depende de ter apostado A FAVOR ou CONTRA os dados.  Você pode perder ou dobrar o valor de sua aposta.\n")
		escreva ("Mas atenção, sempre que tirar um CRAPS, você perde o valor apostado.\n")
	     escreva ("\n\t\t************************************\n")    
	}

	
	funcao inicio()
	{
		inteiro opcaoMenu
		inteiro pontTotal=100
		inteiro aposta
		inteiro dadosInic
		inteiro dadosPont
		inteiro resultado
		inteiro j = 0
		inteiro vetorOpcao[TAM]
		inteiro vetorResultado[TAM]
		
		faca{
		  	
		  	opcaoMenu = exibirMenu()
	
		  	escolha(opcaoMenu){
				//iniciar jogo
				caso 1: 
					aposta = apostarMoedasOpcao (pontTotal, vetorOpcao, j)
					dadosInic = jogarDados()
					resultado = pontuarSaida (dadosInic)		
			          se (resultado == 1){ 
						faca{
				              dadosPont = jogarDados()
				              resultado = pontuarPontos (dadosInic, dadosPont)
			            	}enquanto ((dadosPont != dadosInic) e (dadosPont != 7))
			          }
			 		ganhouPerdeu (resultado, vetorOpcao, vetorResultado, j)
			        	pontTotal = saldoJogo (aposta, pontTotal,vetorResultado, j)
			        	j = j + 1
			       	pare			    	
				// exibir contabilidade de apostas
				caso 2:    
					historicoPontuacao (vetorOpcao, vetorResultado, pontTotal, j)
					pare
				// exibir REGRAS do jogo
	     		caso 3:
	     			mostrarRegras ()
	        			pare
	        		// sair do jogo
	      		caso 4:
					escreva ("\nEncerrando...")
			        	pare
    				// se a pessoa escolher uma opção inexistente
				caso contrario:
			        	escreva ("Opção inválida\n\n")
			}	
		} enquanto (opcaoMenu != 4) // A opção 4 finaliza o programa
	
	}
}		

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4894; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */