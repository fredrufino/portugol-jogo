// Fabricio Souza Maciel
// Frederico Gérald de Freitas Diniz Rufino
// Karin Rumiko Kagi

programa
{	
	inclua biblioteca Texto --> txt
	inclua biblioteca Teclado --> t
	inclua biblioteca Mouse --> m
	inclua biblioteca Sons --> s	
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g

	const inteiro TAM = 20
	
	// Variáveis globais usadas para carregar as imagens
	inteiro imgMenu = -1
	inteiro imgGeral = -1
	inteiro imgMesa = -1
	inteiro imgApostaOpcao = -1
	inteiro imgGanhou = -1
	inteiro imgPerdeu = -1
	inteiro imgDado1 = -1
	inteiro imgDado2 = -1
	inteiro imgDado3 = -1
	inteiro imgDado4 = -1
	inteiro imgDado5 = -1
	inteiro imgDado6 = -1
	
	// Inicia o modo gráfico e define as dimensões e o título da janela
	funcao desenharTela(){
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_titulo_janela("CRAPS | ADS")
		g.definir_dimensoes_janela(800, 600)	
	}

	// Carrega todas as imagens usadas
	funcao carregarImagens(){
		cadeia diretorioImg = "./imgs/"

		carregarImagem(imgMenu, diretorioImg+"fundoMenu.jpg")
		carregarImagem(imgGeral, diretorioImg+"fundoGeral.jpg")
		carregarImagem(imgMesa, diretorioImg+"fundoTabuleiro.jpg")
		carregarImagem(imgApostaOpcao, diretorioImg+"popApostaOpcao.png")
		carregarImagem(imgGanhou, diretorioImg+"voceGanhou.png")
		carregarImagem(imgPerdeu, diretorioImg+"vocePerdeu.png")
		carregarImagem(imgDado1, diretorioImg+"dice1.png")
		carregarImagem(imgDado2, diretorioImg+"dice2.png")
		carregarImagem(imgDado3, diretorioImg+"dice3.png")
		carregarImagem(imgDado4, diretorioImg+"dice4.png")
		carregarImagem(imgDado5, diretorioImg+"dice5.png")
		carregarImagem(imgDado6, diretorioImg+"dice6.png")	
	}

	// Recebe o endereço da imagem e carrega o diretório no mesmo
	funcao carregarImagem(inteiro &img, cadeia diretorio){
		liberarImagem(img)
		img = g.carregar_imagem(diretorio)	
	}

	// Verifica se o endereco fornecido contem algo armazenado 
	funcao liberarImagem(inteiro &img){
		se (img >= 0){
 			g.liberar_imagem(img)
			img = -1
		}
	}
	
	// Desenha a imagem de fundo do menu na tela
	funcao fundoMenu(){
		g.limpar()
		g.desenhar_imagem(0, 0, imgMenu)	
	}

	// Desenha a imagem de fundo, usada ao longo do jogo, na tela
	funcao fundoGeral(){
		g.limpar()
		g.desenhar_imagem(0, 0, imgGeral)		
	}
	
	// Desenha a imagem de fundo da mesa na tela
	funcao fundoMesa(){
		g.limpar()
		g.desenhar_imagem(0, 0, imgMesa)	
	}

	// Desenha os botões do menu e cria interações de seleção
	funcao inteiro menuBotoes(){
		inteiro clique = s.carregar_som("/sons/clique.mp3")
		inteiro opcao = 5
		
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_cor(g.criar_cor(255, 255, 255))
		g.desenhar_retangulo(520, 350, 150, 45, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(550, 365, "Iniciar jogo")

		g.definir_cor(g.criar_cor(255, 255, 255))
		g.desenhar_retangulo(520, 400, 150, 45, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(550, 415, "Pontuação")	

		g.definir_cor(g.criar_cor(255, 255, 255))
		g.desenhar_retangulo(520, 450, 150, 45, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(550, 465, "Regras")

		g.definir_cor(g.criar_cor(255, 255, 255))
		g.desenhar_retangulo(520, 500, 150, 45, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(550, 515, "Sair")

		se(mouse(515, 345, 150, 45) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
			g.definir_cor(g.criar_cor(33, 94, 33))
			g.desenhar_retangulo(520, 350, 150, 45, verdadeiro, verdadeiro)
			g.definir_cor(g.COR_BRANCO)
		     g.definir_tamanho_texto(16.0)
		     g.desenhar_texto(550, 365, "Iniciar jogo ")
		     s.reproduzir_som(clique, falso)
			opcao = 1	
		}se(mouse(515, 395, 150, 45) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
			g.definir_cor(g.criar_cor(33, 94, 33))
			g.desenhar_retangulo(520, 400, 150, 45, verdadeiro, verdadeiro)
			g.definir_cor(g.COR_BRANCO)
		     g.definir_tamanho_texto(16.0)
		     g.desenhar_texto(550, 415, "Pontuação")
		     s.reproduzir_som(clique, falso)
			opcao = 2
		}se(mouse(515, 445, 150, 45) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
			g.definir_cor(g.criar_cor(33, 94, 33))
			g.desenhar_retangulo(520, 450, 150, 45, verdadeiro, verdadeiro)
			g.definir_cor(g.COR_BRANCO)
		     g.definir_tamanho_texto(16.0)
		     g.desenhar_texto(550, 465, "Regras")
		     s.reproduzir_som(clique, falso)
			opcao = 3
		}se(mouse(515, 495, 150, 45) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
			g.definir_cor(g.criar_cor(33, 94, 33))
			g.desenhar_retangulo(520, 500, 150, 45, verdadeiro, verdadeiro)
			g.definir_cor(g.COR_BRANCO)
		     g.definir_tamanho_texto(16.0)
		     g.desenhar_texto(550, 515, "Sair")
		     s.reproduzir_som(clique, falso)
			opcao = 4
		}
		g.definir_estilo_texto(falso, verdadeiro, falso)
		retorne opcao
	}

	// Recebe as cordenadas do botão e retorna se o cursor do mouse está ou não nelas
	funcao logico mouse(inteiro x, inteiro y, inteiro a, inteiro b){
		se(m.posicao_x() >= x e m.posicao_y() >= y e m.posicao_x() <= x+a e m.posicao_y() <= y+b)
		{
			retorne verdadeiro
		}
			retorne falso
	}

	// Desenha os botões de aposta na tela
	funcao  botoesAposta(){
		g.definir_cor(g.criar_cor(255, 255, 255))
		g.desenhar_retangulo(120, 350, 75, 45, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(138, 365, "+1")

		g.definir_cor(g.criar_cor(255, 255, 255))
		g.desenhar_retangulo(200, 350, 75, 45, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(218, 365, "+10")

		g.definir_cor(g.criar_cor(255, 255, 255))
		g.desenhar_retangulo(280, 350, 75, 45, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(298, 365, "+100")

		g.definir_cor(g.COR_VERMELHO)
		g.desenhar_retangulo(175, 450, 130, 55, verdadeiro, verdadeiro)
		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(16.0)
		g.desenhar_texto(200, 470, "APOSTAR")	
	}

	// Cria interações de seleção para os botões das apostas
	funcao inteiro interacaoBotoes_Aposta(){
		inteiro valorAposta = 0
		inteiro bApostar = 0
		inteiro clique = s.carregar_som("/sons/clique.mp3")
		
		faca{
			fundoGeral()
			botoesAposta()
			g.definir_cor(g.COR_BRANCO)
			g.definir_tamanho_texto(25.0)
			g.desenhar_texto(83, 150, "Escolha o valor da aposta: ")
			g.desenhar_retangulo(170, 240, 140, 45, verdadeiro, verdadeiro)
			g.definir_tamanho_texto(20.0)
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(175, 255, ""+ valorAposta)
			
			se(mouse(115, 345, 75, 45) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
				g.definir_cor(g.criar_cor(33, 94, 33))
				g.desenhar_retangulo(120, 350, 75, 45, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_BRANCO)
			     g.definir_tamanho_texto(16.0)
			     g.desenhar_texto(138, 365, "+1")
			     s.reproduzir_som(clique, falso)
				valorAposta = valorAposta + 1
				g.renderizar()
				u.aguarde(300)
				
			}se(mouse(195, 345, 75, 45) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
				g.definir_cor(g.criar_cor(33, 94, 33))
				g.desenhar_retangulo(200, 350, 75, 45, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_BRANCO)
			     g.definir_tamanho_texto(16.0)
			     g.desenhar_texto(218, 365, "+10")
			     s.reproduzir_som(clique, falso)
				valorAposta = valorAposta + 10
				g.renderizar()
				u.aguarde(300)
				
			}se(mouse(275, 345, 75, 45) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
				g.definir_cor(g.criar_cor(33, 94, 33))
				g.desenhar_retangulo(280, 350, 75, 45, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_BRANCO)
			     g.definir_tamanho_texto(16.0)
			     g.desenhar_texto(298, 365, "+100")
				s.reproduzir_som(clique, falso)
				valorAposta = valorAposta + 100
				g.renderizar()
				u.aguarde(300)
				
			}se(mouse(170, 445, 130, 55) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
				g.definir_cor(g.criar_cor(139, 0, 0))
				g.desenhar_retangulo(175, 450, 130, 55, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_BRANCO)
				g.definir_tamanho_texto(16.0)
				g.desenhar_texto(200, 470, "APOSTAR")
				s.reproduzir_som(clique, falso)
				g.renderizar()
				u.aguarde(300)
				bApostar = 1
			}
			g.renderizar()
		}enquanto(bApostar != 1)
		retorne valorAposta
	}
	
	// Desenha e cria interações de seleção para os botões de aposta a favor ou contra
	funcao vazio afavorOUcontra(inteiro pont, inteiro vetorOp[], inteiro k){
		inteiro condicaoac = 0
		inteiro clique = s.carregar_som("/sons/clique.mp3")
		
		faca{
			fundoGeral()
			g.desenhar_imagem(150, 200, imgApostaOpcao)
			g.definir_tamanho_texto(25.0)
			g.desenhar_texto(63, 150, " Deseja apostar A FAVOR ou CONTRA")
			g.desenhar_texto(63, 180, " os dados?")
			
			g.definir_cor(g.COR_VERDE)
			g.desenhar_retangulo(120, 440, 130, 55, verdadeiro, verdadeiro)
			g.definir_cor(g.COR_PRETO)
			g.definir_tamanho_texto(16.0)
			g.desenhar_texto(148,460, "A FAVOR")
	
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(320, 440, 130, 55, verdadeiro, verdadeiro)
			g.definir_cor(g.COR_BRANCO)
			g.definir_tamanho_texto(16.0)
			g.desenhar_texto(348, 460, "CONTRA")		
	
			se(mouse(115, 435, 130, 55) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
				g.definir_cor(g.criar_cor(34, 138, 34))
				g.desenhar_retangulo(120, 440, 130, 55, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_BRANCO)
			     g.definir_tamanho_texto(16.0)
			     g.desenhar_texto(148, 460, "A FAVOR")
			     s.reproduzir_som(clique, falso)
			     g.renderizar()
				vetorOp[k] = 1
				condicaoac = 1
				u.aguarde(300)
			}se(mouse(315, 435, 130, 55) == verdadeiro e m.botao_pressionado(m.BOTAO_ESQUERDO)){
				g.definir_cor(g.criar_cor(139, 0, 0))
				g.desenhar_retangulo(320, 440, 130, 55, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_BRANCO)
				g.definir_tamanho_texto(16.0)
				g.desenhar_texto(348, 460, "CONTRA")
			     s.reproduzir_som(clique, falso)
			     g.renderizar()
				vetorOp[k] = 2
				condicaoac = 1
				u.aguarde(300)
			}
			
			g.renderizar()
		}enquanto(condicaoac != 1)
	}

	// Sorteia os valores dos daos e desenha na tela a imagem referente aos números sorteados
	funcao inteiro jogarDados(){
		inteiro dado1=0, dado2=0, dados=0
		inteiro voltar = 0
		inteiro somDados = s.carregar_som("/sons/dados.mp3")
		
		faca{
			fundoMesa()
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(16.0)
			g.desenhar_texto(240, 340, "Pressione <ENTER> para lançar os dados")
			g.renderizar()
			
			inteiro teclaEnter = t.ler_tecla()
			se(teclaEnter == t.TECLA_ENTER){
				dado1 = u.sorteia(1, 6)
		  		dado2 = u.sorteia(1, 6)
				dados = dado1 + dado2
				fundoMesa()
				s.reproduzir_som(somDados, falso)
				u.aguarde(3000)
			
			se(dado1 == 1){
				g.desenhar_imagem(320, 315, imgDado1)
			}se(dado1 == 2){
				g.desenhar_imagem(320, 315, imgDado2)
			}se(dado1 == 3){
				g.desenhar_imagem(320, 315, imgDado3)
			}se(dado1 == 4){
				g.desenhar_imagem(320, 315, imgDado4)
			}se(dado1 == 5){
				g.desenhar_imagem(320, 315, imgDado5)
			}se(dado1 == 6){
				g.desenhar_imagem(320, 315, imgDado6)
			}
	
			se(dado2 == 1){
				g.desenhar_imagem(420, 315, imgDado1)
			}se(dado2 == 2){
				g.desenhar_imagem(420, 315, imgDado2)
			}se(dado2 == 3){
				g.desenhar_imagem(420, 315, imgDado3)
			}se(dado2 == 4){
				g.desenhar_imagem(420, 315, imgDado4)
			}se(dado2 == 5){
				g.desenhar_imagem(420, 315, imgDado5)
			}se(dado2 == 6){
				g.desenhar_imagem(420, 315, imgDado6)
			}
			
			g.renderizar()
			u.aguarde(3000)
			voltar = 1
			}
		}enquanto(voltar != 1)
		retorne dados
	}

	// Avalia a pontuação obtida nos dados da jogada de saída
	funcao inteiro pontuarSaida (inteiro dados){
		inteiro i=0
		
		fundoMesa()
		se (dados == 7 ou dados == 11){
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(320, 340, "NATURAL") 
			g.renderizar()
			u.aguarde(2000)
			retorne i-1
		}senao se (dados == 2 ou dados == 3 ou dados == 12){
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(320, 340, "CRAPS")
			g.renderizar()
			u.aguarde(2000)
			retorne i-2
		}senao{
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(320, 340, "PONTO = "+ dados)
			g.renderizar()
			u.aguarde(2000)
			retorne i+1
		}
	}

	// Avalia a pontuação obtida nos dados da jogada de pontos
	funcao inteiro pontuarPontos (inteiro dadosI, inteiro dadosP){
		inteiro i=0
		
		se (dadosP == 7){
			fundoMesa()
			g.definir_cor(g.COR_BRANCO)
			g.definir_estilo_texto(falso, verdadeiro, falso)
			g.definir_tamanho_texto(40.0)
			g.desenhar_texto(320, 340, "CRAPS")
			g.renderizar()
			u.aguarde(2000)
			retorne i-2
		}senao se (dadosP == dadosI){
			retorne i-1
		}senao{
	    	     retorne 0
	    	}
	}

	// Verifica a pontuação das jogadas de acordo com a opção de aposta
	funcao vazio ganhouPerdeu(inteiro jogada,  inteiro vetorOp[], inteiro vetorRes[], inteiro k){
  		
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

	// Altera o número de moedas de acordo com o resultado do jogo e desnha o novo valor na tela
	funcao inteiro resultadoJogo (inteiro apostaM, inteiro pont, inteiro vetorRes[], inteiro k){
		inteiro somGanhou = s.carregar_som("/sons/ganhou.mp3")
		inteiro somPerdeu = s.carregar_som("/sons/perdeu.mp3")
			
		fundoMesa()
		g.definir_cor(g.COR_PRETO)
		g.definir_estilo_texto(falso, verdadeiro, falso)
		g.definir_tamanho_texto(24.0)
			
		se (vetorRes[k]==1){
			pont = pont + apostaM
			g.desenhar_imagem(192, 92, imgGanhou)
			g.desenhar_texto(240, 400, "Você ganhou "+ apostaM +" moedas\n")
			s.reproduzir_som(somGanhou, falso)
		}senao{
			pont = pont - apostaM
			g.desenhar_imagem(192, 92, imgPerdeu)
			g.desenhar_texto(238, 400, "Você perdeu "+ apostaM +" moedas\n")
			s.reproduzir_som(somPerdeu, falso)
		}
		g.renderizar()
		u.aguarde(3000)
		retorne pont
	}
	
	funcao inicio(){
		inteiro opcaoMenu, pontTotal=100, apostaMoed, apostaOpc, dadosInic, dadosPont, resultado, j, vetorOpcao[TAM], vetorResultado[TAM], valorAposta
		
		j=0
		desenharTela()
		faca{
			carregarImagens()
			fundoMenu()
			opcaoMenu = menuBotoes()
			g.renderizar()

			escolha(opcaoMenu){
				// Iniciar jogo
				caso 1:
					u.aguarde(300)
					apostaMoed = interacaoBotoes_Aposta()
					afavorOUcontra(pontTotal, vetorOpcao, j)
					dadosInic = jogarDados()
					resultado = pontuarSaida (dadosInic)
					se (resultado == 1){ 
						faca{
							fundoGeral()
							dadosPont = jogarDados()
							resultado = pontuarPontos (dadosInic, dadosPont)
							u.aguarde(1000)
							g.renderizar()
			            	}enquanto ((dadosPont != dadosInic) e (dadosPont != 7))
			          }
			          fundoMesa()
			 		ganhouPerdeu (resultado, vetorOpcao, vetorResultado, j)
			        	pontTotal = resultadoJogo (apostaMoed, pontTotal,vetorResultado, j)
			        	j = j + 1
					u.aguarde(3000)
					pare
					
				// Exibir contabilidade de apostas
				caso 2:
					inteiro b = 0
					inteiro voltar2 = 1
					
					u.aguarde(300)
					fundoGeral()
			
					faca{
						g.definir_cor(g.COR_BRANCO)
						g.definir_tamanho_texto(13.0)
						g.desenhar_texto(160, 550, "Pressione <ESC> para retornar ao menu")
						g.definir_cor(g.COR_BRANCO)
						g.desenhar_retangulo(150, 100, 300, 400, falso, falso)
						g.desenhar_texto(225, 120, "SEU HISTÓRICO DE JOGO")
						para (j=0; j<10; j++){
							b = b + 20
							se (vetorOpcao[j] == 1){
								se (vetorResultado[j] == 1){
									g.desenhar_texto(170, 140+b, "Jogo "+(j+1)+": você jogou A FAVOR e GANHOU")
								}senao{
									g.desenhar_texto(170, 140+b, "Jogo "+(j+1)+": você jogou A FAVOR e PERDEU")
								}	  		
							}
							se (vetorOpcao[j] == 2){ 
								se (vetorResultado[j] == 1){
									g.desenhar_texto(170, 140+b, "Jogo "+(j+1)+": você jogou CONTRA e GANHOU")
								}senao{
									g.desenhar_texto(170, 140+b, "Jogo "+(j+1)+": você jogou CONTRA e PERDEU")
								}
							}	
						}
						g.desenhar_texto(225, 400, "Você tem: "+pontTotal+" moedas")
						g.renderizar()
					
						inteiro teclaEsc = t.ler_tecla()
		
						se(teclaEsc == t.TECLA_ESC){
							voltar2 =2
						}senao{
							fundoGeral()
						}	
					}enquanto(voltar2 != 2)
					pare
					
				// Exibir REGRAS do jogo
				caso 3:
					inteiro voltar = 1
					
					u.aguarde(300)
       				fundoGeral()
       				
       				faca{
       					g.definir_cor(g.COR_BRANCO)
						g.desenhar_retangulo(150, 100, 305, 420, falso, falso)
						g.definir_estilo_texto(falso, verdadeiro, falso)
						g.definir_tamanho_texto(16.0)
						g.definir_fonte_texto("Arial")
						g.desenhar_texto(270, 120, "REGRAS")
						
						g.definir_estilo_texto(falso, falso, falso)
						g.definir_tamanho_texto(14.0)
						g.desenhar_texto(160, 150, "Craps é um jogo de dados em duas etapas: ")
						g.desenhar_texto(160, 205, "- se tirar 7 ou 11 na soma dos dados, você")
						g.desenhar_texto(160, 220, "  tem um NATURAL e encerra a jogada;")
						g.desenhar_texto(160, 240, "- se tirar 2, 3 ou 12, você tem um CRAPS")
						g.desenhar_texto(160, 255, "  e encerra a jogada;")
						g.desenhar_texto(160, 275, "- se tirar qualquer outro número (4, 5, 6,")
						g.desenhar_texto(160, 290, "  8, 9 ou 10), continua em outras jogadas.")
						g.desenhar_texto(160, 345, "Você deve jogar novamente os dados até ")
						g.desenhar_texto(160, 360, "obter o valor da jogada inicial (PONTO), ")
						g.desenhar_texto(160, 375, "mas se sair 7, perde a jogada por CRAPS.")	
						g.desenhar_texto(160, 430, "Sua pontuação depende de ter apostado ")
						g.desenhar_texto(160, 445, "A FAVOR ou CONTRA os dados.  Você pode ")
						g.desenhar_texto(160, 460, "perder ou dobrar o valor de sua aposta.")
						g.desenhar_texto(160, 475, "Mas atenção, sempre que tirar um CRAPS, ")
						g.desenhar_texto(160, 490, "você perde o valor apostado.")
						
						g.definir_estilo_texto(falso, verdadeiro, falso)
						g.definir_tamanho_texto(13.0)
						g.desenhar_texto(160, 185, "● JOGADA INICIAL")
						g.desenhar_texto(160, 325, "● OUTRAS JOGADAS")
						g.desenhar_texto(160, 410, "● PONTUAÇÃO")
						g.desenhar_texto(160, 550, "Pressione <ESC> para retornar ao menu")
						g.renderizar()

						inteiro teclaEsc = t.ler_tecla()
		
						se(teclaEsc == t.TECLA_ESC){
							voltar = 2
						}senao{
							fundoGeral()
						}
       				}enquanto(voltar != 2)
					pare
			}
			
		}enquanto(opcaoMenu != 4)// A opção 4 do menu finaliza a execução
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 19173; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */