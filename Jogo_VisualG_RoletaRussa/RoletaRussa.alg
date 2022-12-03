algoritmo "RoletaRussa"

var
null:caracter //variavel para sair da tela atual. ex: historia
jogadorGanhador:inteiro
jogando:inteiro
multiplicador:inteiro

dificuldade:caracter
rounds:inteiro
cilindrosGeradosTotal:inteiro
disparosFatais:inteiro
disparosNormais:inteiro
girosComprados:inteiro
checagemComprados:inteiro
tirosComprados:inteiro
vidasComprados:inteiro
escolhaJogador:caracter
escolhaSorteado:caracter

custoRotacao,custoVida,custoChecar,custoGanharPontos,custoAtirar,premioComecar:inteiro

premioGanhar:inteiro

vezJogador:inteiro //define quem ir√° jogar

vetorCilindro:vetor[0..6] de inteiro //variavel respons√°vel pelo "cilindro" do revolver
posicaoDisparo:inteiro //posi√ß√£o do cilindro a ser disparada.


//constantes para posicao dos vetores
constVida,constJogador,constPontuacao:inteiro


jogador_1:vetor[1..3] de inteiro              //vetor dos jogadores, posicao 1 = vidas, posicao 2 = rodadas
jogador_morte:vetor[1..3] de inteiro

inicio
jogadorGanhador:=0
//constantes
constVida:=1
constPontuacao:=2
constJogador:=3           //define se √© um player ou o computador 1=player 0=computador

jogador_1[constJogador]:=1
jogador_morte[constJogador]:=0

//pontuacao
jogador_1[constPontuacao]:=1000
jogador_morte[constPontuacao]:=9999

//custos
custoRotacao:=25
custoVida:=500
custoChecar:=400
custoGanharPontos:=250
custoAtirar:=1500
premioGanhar:=5000
premioComecar:=250

// =====================================================================================================================

procedimento mostrarBanner
inicio
limpatela
escreval("-----------------------------------------------------------------------------------")
escreval("   __ \               |    |            _ \                |        |    |         ")
escreval("   |   |  _ \   _` |  __|  __ \        |   |  _ \   |   |  |   _ \  __|  __|   _ \ ")
escreval("   |   |  __/  (   |  |    | | |       __ <  (   |  |   |  |   __/  |    |     __/ ")
escreval("  ____/ \___| \__._| \__| _| |_|      _| \_\\___/  \__._| _| \___| \__| \__| \___| ")
escreval("              ...                                  Made by: Daniel Bonam Rissardi  ")
escreval("             ;::::;							                                            	")
escreval("           ;::::; :;								                                       ")
escreval("         ;:::::'   :;								                                       ")
escreval("        ;:::::;     ;.							                                          ")
escreval("       ,:::::'       ;           OOO\				                                    ")
escreval("       ::::::;       ;          OOOOO\		                                    	")
escreval("       ;:::::;       ;         OOOOOOOO			                                    ")
escreval("      ,;::::::;     ;'         / OOOOOOO			                                    ")
escreval("    ;:::::::::`. ,,,;.        /  / DOOOOOO		                                    ")
escreval("  .';:::::::::::::::::;,     /  /     DOOOO		                                    ")
escreval(" ,::::::;::::::;;;;::::;,   /  /        DOOO	                                    ")
escreval(";`::::::`'::::::;;;::::: ,#/  /          DOOO	                                    ")
escreval(":`:::::::`;::::::;;::: ;::#  /            DOOO	                                    ")
escreval("::`:::::::`;:::::::: ;::::# /              DOO	                                    ")
escreval("`:`:::::::`;:::::: ;::::::#/               DOO                                  	")
escreval(" :::`:::::::`;; ;:::::::::##                OO	                                    ")
escreval(" ::::`:::::::`;::::::::;:::#                OO	                                    ")
escreval("-----------------------------------------------------------------------------------")
escreval("                        -_- Iniciar - Pressione Enter -_-")
leia(null)
limpatela
fimprocedimento

// =====================================================================================================================

procedimento mostrarMenu
var
escolhaMenu:caracter
inicio
limpatela
escreval("-----------------------------------------------------------------------------------")
escreval("   __ \               |    |            _ \                |        |    |         ")
escreval("   |   |  _ \   _` |  __|  __ \        |   |  _ \   |   |  |   _ \  __|  __|   _ \ ")
escreval("   |   |  __/  (   |  |    | | |       __ <  (   |  |   |  |   __/  |    |     __/ ")
escreval("  ____/ \___| \__._| \__| _| |_|      _| \_\\___/  \__._| _| \___| \__| \__| \___| ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                           / \----------------------,                              ")
escreval("                           \_,|        Menu         |                              ")
escreval("                              |                     |                              ")
escreval("                              |  [1] - Jogar        |                              ")
escreval("                              |  [2] - HistÛria     |                              ")
escreval("                              |  [3] - Como jogar   |                              ")
escreval("                              |  [4] - Creditos     |                              ")
escreval("                              |                     |                              ")
escreval("                              |  ,--------------------                             ")
escreval("                              \_/___________________/                              ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                            PontuaÁ„o: ", jogador_1[constPontuacao]," ")
escreval("-----------------------------------------------------------------------------------")
escreval("                      -_- Digite uma opÁ„o para continuar -_-                      ")
repita
   escreva("OpÁ„o: ")
   leia(escolhaMenu)
ate ((escolhaMenu = "1") ou (escolhaMenu = "2") ou (escolhaMenu = "3") ou (escolhaMenu = "4"))
escolha escolhaMenu
caso "1" //Jogar
   opcoesJogar
caso "2" //Historia
   mostrarHistoria
caso "3" //Como jogar
   mostrarComoJogar
caso "4" //Creditos
   mostrarCreditos

fimescolha
limpatela
fimprocedimento

// =====================================================================================================================

procedimento mostrarDificuldade
var
escolhaDificuldade:caracter
inicio
limpatela
escreval("-----------------------------------------------------------------------------------")
escreval("                               Escolha a Dificuldade:                              ")
escreval("-----------------------------------------------------------------------------------")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("             '----------------'  '----------------'  '----------------'            ")
escreval("             |    OpÁ„o [1]   |  |    OpÁ„o [2]   |  |    OpÁ„o [3]   |            ")
escreval("             .----------------.  .----------------.  .----------------.            ")
escreval("             |      F·cil     |  |      MÈdio     |  |     DifÌcil    |            ")
escreval("             |        .       |  |        .       |  |        .       |            ")
escreval("             |   1 MuniÁ„o    |  |   2 MuniÁıes   |  |   3 MuniÁıes   |            ")
escreval("             |   3 Vidas      |  |   3 Vidas      |  |   1 Vida       |            ")
escreval("             |   Pontos x1    |  |   Pontos x2    |  |   Pontos x3    |            ")
escreval("             '----------------'  '----------------'  '----------------'            ")
escreval("             |       --       |  |    --    --    |  |  --   --   --  |            ")
escreval("             |      |__|      |  |   |__|  |__|   |  | |__| |__| |__| |            ")
escreval("             |      |  |      |  |   |  |  |  |   |  | |  | |  | |  | |            ")
escreval("             |      |__|      |  |   |__|  |__|   |  | |__| |__| |__| |            ")
escreval("             |                |  |                |  |                |            ")
escreval("             .----------------.  .----------------.  .----------------.            ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("-----------------------------------------------------------------------------------")
escreval("                      -_- Digite uma opÁ„o para continuar -_-                      ")
fimprocedimento

// =====================================================================================================================

procedimento opcoesDificuldade
var
escolhaDificuldade:caracter
// Posicao dos vetores.
// ----------------------------
// [0] [1] [2] [3] [4] [5] [6]
//-----------------------------
// [ ] [ ] [ ] [x] [ ] [ ] [ ] - Facil - 1 Bala
// [ ] [x] [ ] [ ] [ ] [x] [ ] - Medio - 2 Balas
// [x] [ ] [ ] [x] [ ] [ ] [x] - Dificil - 3 Balas
inicio
dificuldade:=""
mostrarDificuldade
repita
   escreva("OpÁ„o: ")
   leia(escolhaDificuldade)
ate ((escolhaDificuldade = "1") ou (escolhaDificuldade = "2") ou (escolhaDificuldade = "3"))
escolha escolhaDificuldade
caso "1" //facil
   dificuldade:="F·cil"
   vetorCilindro[3]:=1
   //pontos
   multiplicador:=1
   //jogador
   jogador_1[constVida]:=3
   //morte
   jogador_morte[constVida]:=1
caso "2" //medio
   dificuldade:="MÈdio"
   vetorCilindro[1]:=1
   vetorCilindro[5]:=1
   //pontos
   multiplicador:=2
   //jogador
   jogador_1[constVida]:=3
   //morte
   jogador_morte[constVida]:=3
caso "3" //dificil
   dificuldade:="DifÌcil"
   vetorCilindro[0]:=1
   vetorCilindro[3]:=1
   vetorCilindro[6]:=1
   //pontos
   multiplicador:=3
   //jogador
   jogador_1[constVida]:=1
   //morte
   jogador_morte[constVida]:=3
fimescolha

fimprocedimento

// =====================================================================================================================


procedimento mostrarHistoria
inicio
limpatela
escreval("                                -- HistÛria --")
escreval("-----------------------------------------------------------------------------------")
escreval("                                                                                   ")
escreval("              VocÍ È um viciado em jogos que acabou perdendo                       ")
escreval("              a alma em uma aposta com a morte.                                    ")
escreval("                                       .                                           ")
escreval("              Ao apostar sua alma em troca de um marea turbo,                      ")
escreval("              a mesma foi recolhida pelo homem da capa preta.                      ")
escreval("                                       .                                           ")
escreval("              ApÛs uma longa discuss„o vocÍ consegue convencer                     ")
escreval("              a Morte a jogar novamente, onde, se vocÍ ganhar,                     ")
escreval("              ir· recuperar a sua alma e o mais importante:                        ")
escreval("              Ganhar· um Marea Turbo 2.0 novinho.                                  ")
escreval("                                       .                                           ")
escreval("                                      -|-                                          ")
escreval("                                       |                                           ")
escreval("                                   .-'~~~`-.                                       ")
escreval("                                 .'         `.                                     ")
escreval("                                 |  R  I  P  |                                     ")
escreval("                                 |           |                                     ")
escreval("                                 |           |                                     ")
escreval("                                 |           |                                1/2  ")
escreval("-----------------------------------------------------------------------------------")
escreval("                        -_- Continuar - Pressione Enter -_-")
leia(null)
limpatela
escreval("                                -- HistÛria --")
escreval("-----------------------------------------------------------------------------------")
escreval("                                                                                   ")
escreval("              Entretando, caso vocÍ perca, vocÍ sofrer· uma terrÌvel               ")
escreval("              puniÁ„o.                                                             ")
escreval("                                       .                                           ")
escreval("              A Morte ir· te transformar em um peixe imortal que vagar·            ")
escreval("              eternamente sem rumo no fundo do oceano. Mesmo no corpo de           ")
escreval("              um peixe, vocÍ estar· completamente consciente e lembrar·            ")
escreval("              com clareza do motivo de estar ali.                                  ")
escreval("                                       .                                           ")
escreval("              Ao analizar a proposta, vocÍ conclui que vale a pena e               ")
escreval("              aceita jogar com prontid„o, afinal de contas, È um fiat              ")
escreval("              Marea TURBO.                                                         ")
escreval("                                       .                                           ")
escreval("              O jogo escolhido pela morte È a Roleta Russa.                        ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                                                                              2/2  ")
escreval("-----------------------------------------------------------------------------------")
escreval("                        -_- Continuar - Pressione Enter -_-")
leia(null)
limpatela
mostrarMenu
fimprocedimento

// =====================================================================================================================

procedimento mostrarCreditos
inicio
limpatela
escreval("                                -- Creditos --")
escreval("-----------------------------------------------------------------------------------")
escreval("                                                                                   ")
escreval("             Este jogo foi realizado como trabalho para o curso de                 ")
escreval("                            Engenharia de Software                                 ")
escreval("                                 (ESOFT2S-N-B)                                     ")
escreval("                                                                                   ")
escreval("                        Feito por Daniel Bonam Rissardi                            ")
escreval("                                  RA:22013838-2                                    ")
escreval("                                                                                   ")
escreval("                           VocÍ pode me encontrar em:                              ")
escreval("                      Linkedin:  www.linkedin.com/in/danibonam/                    ")
escreval("                      Medium:    medium.com/@danibonam                             ")
escreval("                      GitHub:    github.com/B0nam                                  ")
escreval("                      Instagram: www.instagram.com/danibonam/                      ")
escreval("                                                                                   ")
escreval("                              Obrigado por Jogar :)                                ")
escreval("                                       *                                           ")
escreval("                             Entregue em: 22/11/2022                               ")
escreval("                                                                                   ")
escreval("                                                                                   ")
escreval("                   (Obs: Digite 1337 na sua vez para ganhar pontos)                ")
escreval("-----------------------------------------------------------------------------------")
escreval("                        -_- Continuar - Pressione Enter -_-")
leia(null)
limpatela
mostrarMenu
fimprocedimento

// =====================================================================================================================

procedimento mostrarComoJogar
inicio
limpatela
escreval("                                -- Como Jogar --")
escreval("-----------------------------------------------------------------------------------")
escreval("            [Como funciona a Roleta Russa?]                                      ")
escreval("            O jogo consiste basicamente de um revolver parcialmente              ")
escreval("            carregado, ao pegar o revolver, o cilindro È girado dei-             ")
escreval("            xando a posiÁ„o da bala (ou das balas) desconhecida.                 ")
escreval("            Com a posiÁ„o da bala desconhecida, o jogador da vez deve            ")
escreval("            efetuar um disparo a si prÛprio. Roleta Russa È um jogo              ")
escreval("            de sorte, onde vocÍ desafia a morte.                                 ")
escreval("                                     .                                           ")
escreval("            [Como funciona a Dificuldade]                                        ")
escreval("            A dificuldade define 3 pontos importantes para a partida,            ")
escreval("            quantidade de balas, quantidade de vidas e o multiplicador           ")
escreval("            de pontos.                                                           ")
escreval("            F·cil - Possui apenas uma bala no revolver (1/7), vocÍ pos-          ")
escreval("            sui 3 tentativas (vidas) e a morte possui apenas uma. Os             ")
escreval("            pontos n„o s„o multiplicados.                                        ")
escreval("            MÈdio - Possui duas balas no revolver (2/7), vocÍ possui             ")
escreval("            3 tentativas (vidas), a morte possui 3 vidas e os pontos             ")
escreval("            s„o dobrados.                                                        ")
escreval("            DifÌcil - Possui 3 balas no revolver (3/7), vocÍ possui              ")
escreval("            apenas 1 tentativa (vida), a morte possui 3 vidas e os               ")
escreval("            pontos s„o triplicados.                                         1/2  ")
escreval("-----------------------------------------------------------------------------------")
escreval("                        -_- Continuar - Pressione Enter -_-")
leia(null)
limpatela
escreval("                                -- Como Jogar --")
escreval("-----------------------------------------------------------------------------------")
escreval("            [Como funcionam os pontos?]                                          ")
escreval("            Os pontos server para vocÍ realizar aÁıes durante o jogo             ")
escreval("            vocÍ pode girar a camara do revolver, comprar vidas, che-            ")
escreval("            car se o prÛximo disparo È fatal ou disparar contra a morte          ")
escreval("                                     .                                           ")
escreval("            [Sorteio]                                                            ")
escreval("            O sorteio inicial serve para definir quem ir· comeÁar a              ")
escreval("            jogar, caso vocÍ comece, ganha um bonus de",custoGanharPontos,"(x Multiplicador).     ")
escreval("                                     .                                           ")
escreval("            [Morte]                                                              ")
escreval("            A morte pode girar o revolver quantas vezes quiser, entre-           ")
escreval("            tanto ela n„o pode comprar vidas, checar o revolver e nem            ")
escreval("            te ferir.                                                            ")
escreval("                                                                                 ")
escreval("                                                                                 ")
escreval("                                                                                 ")
escreval("                                                                                 ")
escreval("                                                                                 ")
escreval("                                                                                 ")
escreval("                                                                                 ")
escreval("                                                                            1/2  ")
escreval("-----------------------------------------------------------------------------------")
escreval("                        -_- Continuar - Pressione Enter -_-")
leia(null)
mostrarMenu
fimprocedimento


// =====================================================================================================================


procedimento mostrarGanhou
var
totalComprados:inteiro
totalDisparos:inteiro
inicio
totalDisparos:=(disparosFatais+disparosNormais)
totalComprados:=(girosComprados+vidasComprados+checagemComprados+tirosComprados)
limpatela
escreval("                                -- ParabÈns --")
escreval("-----------------------------------------------------------------------------------")
escreval("                                                                                   ")
escreval("            ParabÈns, vocÍ venceu a morte no jogo de Roleta Russa,                 ")
escreval("            sendo assim, vocÍ recuperou a sua alma e ganhou um Fiat                ")
escreval("            Marea 2.0 Turbo. (VocÍ ganha +5000 pontos ao vencer)                   ")
escreval("                                       .                                           ")
escreval("                        Abaixo as informaÁıes sobre o jogo                         ")
escreval("                                                                                   ")
escreval("                      Sua pontuaÁ„o     : ",jogador_1[constPontuacao],"            ")
escreval("                      Dificuldade       :  ",dificuldade,"                          ")
escreval("                      VocÍ escolheu     :  ",escolhaJogador,"                       ")
escreval("                      Foi sorteado      :  ",escolhaSorteado,"                      ")
escreval("                      Total de Rounds   : ",rounds,"                               ")
escreval("                      Cilindros girados : ",cilindrosGeradosTotal,"                ")
escreval("                                                                                   ")
escreval("                      Disparos Efetuados: ",totalDisparos,        "(Total)         ")
escreval("                                          ",disparosFatais,       "(Fatais)        ")
escreval("                                          ",disparosNormais,      "(Normais)       ")
escreval("                                                                                   ")
escreval("                      Itens Comprados   : ",totalComprados,       "(Total)         ")
escreval("                                          ",girosComprados,       "(RotaÁıes)      ")
escreval("                                          ",vidasComprados,       "(Vidas)         ")
escreval("                                          ",checagemComprados,    "(Checagens)     ")
escreval("                                          ",tirosComprados,       "(Atirar)        ")
escreval("-----------------------------------------------------------------------------------")
escreval("                        -_- Iniciar - Pressione Enter -_-")
leia(null)
limpatela
fimprocedimento

// =====================================================================================================================


procedimento mostrarPerdeu
var
totalComprados:inteiro
totalDisparos:inteiro
inicio
totalDisparos:=(disparosFatais+disparosNormais)
totalComprados:=(girosComprados+vidasComprados+checagemComprados+tirosComprados)
limpatela
escreval("                                -- VocÍ Perdeu --")
escreval("-----------------------------------------------------------------------------------")
escreval("                                                                                   ")
escreval("            VocÍ perdeu da morte no jogo de Roleta Russa, sendo assim,             ")
escreval("            sua alma foi ceifada, vocÍ ir· vagar eternamente sem rumo              ")
escreval("            pelos oceanos e o pior de tudo, vocÍ n„o ganhou o Marea.               ")
escreval("                                                                                   ")
escreval("                        Abaixo as informaÁıes sobre o jogo                         ")
escreval("                                                                                   ")
escreval("                      Sua pontuaÁ„o     : ",jogador_1[constPontuacao],"            ")
escreval("                      Dificuldade       :  ",dificuldade,"                          ")
escreval("                      VocÍ escolheu     :  ",escolhaJogador,"                       ")
escreval("                      Foi sorteado      :  ",escolhaSorteado,"                      ")
escreval("                      Total de Rounds   : ",rounds,"                               ")
escreval("                      Cilindros girados : ",cilindrosGeradosTotal,"                ")
escreval("                                                                                   ")
escreval("                      Disparos Efetuados: ",totalDisparos,        "(Total)         ")
escreval("                                          ",disparosFatais,       "(Fatais)        ")
escreval("                                          ",disparosNormais,      "(Normais)       ")
escreval("                                                                                   ")
escreval("                      Itens Comprados   : ",totalComprados,       "(Total)         ")
escreval("                                          ",girosComprados,       "(RotaÁıes)      ")
escreval("                                          ",vidasComprados,       "(Vidas)         ")
escreval("                                          ",checagemComprados,    "(Checagens)     ")
escreval("                                          ",tirosComprados,       "(Atirar)        ")
escreval("-----------------------------------------------------------------------------------")
escreval("                        -_- Iniciar - Pressione Enter -_-                          ")
leia(null)
limpatela
fimprocedimento

// =====================================================================================================================

funcao mostrarVidas(vidas:inteiro):caracter
var
i:inteiro
coracoes:caracter
inicio
coracoes:=""
para i de 0 ate vidas-1 faca
   coracoes:=coracoes+"<3 "
fimpara
retorne coracoes
fimfuncao

// =====================================================================================================================

funcao sorteio():inteiro
var
resultado,vezzjogador:inteiro
escolhaOpcao:caracter
inicio
limpatela
escreval("+---------------------------------------------------------------------------------+ ")
escreval("  Quem comeÁara a partida ser· decidido no cara ou coroa, escolha o seu lado:       ")
escreval("+---------------------------------------------------------------------------------+ ")
escreval("                                       |                                            ")
escreval("             _.-'~~`~~'-._             |             _.-'~~`~~'-._                  ")
escreval("          .'`   I    F   `'.           |          .'`  E   A   T  `'.               ")
escreval("         /  L              E \         |         / D               H \              ")
escreval("       /`      ;   :   ;      `\       |       /`           /++++     `\            ")
escreval("      ;     .   \_,!,_/   ,     ;      |      ;            /¥/+++++     ;           ")
escreval("     ;       `.,'     `.,'       ;     |     ;            /¥/  +++++     ;          ")
escreval("     |        /         \        |     |     |           /¥/    ++++     |          ")
escreval("     |   ~ -- :         : -- ~   |     |     |          /¥/      +++     |          ")
escreval("     ;        \         /        ;     |     ;         /¥/        +      ;          ")
escreval("      ;      ,'`._   _.'`.      ;      |      ;       /¥/               ;           ")
escreval("       \     '   / `!` \   `   /       |       \     /¥/               /            ")
escreval("        `\      ;   :   ;    /`        |        `\   *               /`             ")
escreval("          '._   7 7 7 7   _.'          |          '._    6 6 6    _.'               ")
escreval("             `'-..,,,..-'`             |             `'-..,,,..-'`                  ")
escreval("                                       |                                            ")
escreval("+---------------------------------------------------------------------------------+ ")
escreval("|            CARA - [1]                |             COROA - [2]                  | ")
escreval("+---------------------------------------------------------------------------------+ ")
escreval("Escolha uma das opÁıes.")
repita
   escreva("OpÁ„o: ")
   leia(escolhaOpcao)
ate ((escolhaOpcao = "1") ou (escolhaOpcao = "2"))
escolha escolhaOpcao
caso "1"
   escolhaJogador:="Cara"
caso "2"
   escolhaJogador:="Coroa"
fimescolha

limpatela
escreval("+---------------------------------------------------------------------------------+ ")
escreval("                            A moeda ser· sorteada...                                ")
escreval("+---------------------------------------------------------------------------------+ ")
escreval("                                                                                    ")
escreval("                                 _.-'~~`~~'-._                                      ")
escreval("                               .'`             `'.                                  ")
escreval("                              /                   \                                 ")
escreval("                            /`                     `\                               ")
escreval("                           ;                         ;                              ")
escreval("                          ;                           ;                             ")
escreval("                          |                           |                             ")
escreval("                          |                           |                             ")
escreval("                          ;                           ;                             ")
escreval("                           ;                         ;                              ")
escreval("                            \                       /                               ")
escreval("                             `\                   /`                                ")
escreval("                               '._             _.'                                  ")
escreval("                                  `'-..,,,..-'`                                     ")
escreval("                                                                                    ")
escreval("+---------------------------------------------------------------------------------+ ")
timer(500)
escreva ("                                   .")
escreva (".")
escreva (".")
timer(0)
limpatela

resultado:=randi(2)+1
se (resultado=1) entao //cara
   escreval("+---------------------------------------------------------------------------------+ ")
   escreval("                            A moeda sorteada foi:                                   ")
   escreval("+---------------------------------------------------------------------------------+ ")
   escreval("                                                                                    ")
   escreval("                                 _.-'~~`~~'-._                                      ")
   escreval("                               .'`   I    F   `'.                                   ")
   escreval("                              /  L             E  \                                 ")
   escreval("                            /`      ;   :   ;      `\                               ")
   escreval("                           ;     .   \_,!,_/   ,     ;                              ")
   escreval("                          ;       `.,'     `.,'       ;                             ")
   escreval("                          |        /         \        |                             ")
   escreval("                          |   ~ -- :         : -- ~   |                             ")
   escreval("                          ;        \         /        ;                             ")
   escreval("                           ;      ,'`._   _.'`.      ;                              ")
   escreval("                            \    '   / `!` \   `    /                               ")
   escreval("                             `\     ;   :   ;     /`                                ")
   escreval("                               '._   7 7 7 7   _.'                                  ")
   escreval("                                  `'-..,,,..-'`                                     ")
   escreval("                                                                                    ")
   escreval("+---------------------------------------------------------------------------------+ ")
   escreval("|                                    Cara                                         | ")
   escreval("+---------------------------------------------------------------------------------+ ")
   escolhaSorteado:="Cara"
senao //coroa
   escreval("+---------------------------------------------------------------------------------+ ")
   escreval("                            A moeda sorteada foi:                                   ")
   escreval("+---------------------------------------------------------------------------------+ ")
   escreval("                                                                                    ")
   escreval("                                 _.-'~~`~~'-._                                      ")
   escreval("                               .'`  E   A   T  `'.                                  ")
   escreval("                              / D               H \                                 ")
   escreval("                            /`           /++++     `\                               ")
   escreval("                           ;            /¥/+++++     ;                              ")
   escreval("                          ;            /¥/  +++++     ;                             ")
   escreval("                          |           /¥/    ++++     |                             ")
   escreval("                          |          /¥/      +++     |                             ")
   escreval("                          ;         /¥/        +      ;                             ")
   escreval("                           ;       /¥/               ;                              ")
   escreval("                            \     /¥/               /                               ")
   escreval("                             `\   *               /`                                ")
   escreval("                               '._    6 6 6    _.'                                  ")
   escreval("                                  `'-..,,,..-'`                                     ")
   escreval("                                                                                    ")
   escreval("+---------------------------------------------------------------------------------+ ")
   escreval("|                                    Coroa                                        | ")
   escreval("+---------------------------------------------------------------------------------+ ")
   escolhaSorteado:="Coroa"
fimse
se (Caracpnum(escolhaOpcao)=resultado) entao
   //jogador comeÁa
   vezzjogador:=1
   escreval("O jogador joga Primeiro. (+",premioComecar*multiplicador," pontos)")
   jogador_1[constPontuacao]:=(jogador_1[constPontuacao]+premioComecar*multiplicador)
senao
   escreval("A morte joga Primeiro.")
   vezzjogador:=2
   //morte comeca
fimse
escreval("                        -_- Iniciar - Pressione Enter -_-")
leia(null)
limpatela
retorne vezzjogador
fimfuncao

// =====================================================================================================================

procedimento mostrarPersonagem
inicio
limpatela
escreval("                        +------------------------------+")
escreval("                        |        ,ad8888baaa,_         |")
escreval("                        |       a88888888888888a,      |  Sua pontuaÁ„o: ", jogador_1[constPontuacao]," ")
escreval("                        |      I88888PPPP''''add88     |")
escreval("                        |      I'_,,_   _,,_ `Y888     |")
escreval("                        |      I .--. , .--.   '8P'    |  VocÍ : ",mostrarVidas(jogador_1[constVida])," ")
escreval("                        |      I `--'/  `--'    8),)   |  Morte: ",mostrarVidas(jogador_morte[constVida])," ")
escreval("                        |      I    /          ,8,;)   |")
escreval("                        |      I    '--'      ,d8|'    |")
escreval("                        |      Ib,ad8888ba,,ad888I     |")
escreval("                        |      I88P''''''Y888888P|     |")
escreval("                        |      `888~~88~~888888P'|     |")
escreval("                        |       `Y88888888PP''   (     |")
escreval("                        |       `'Y''''   _.,-''       |")
escreval("                        |           \.,--''            |")
escreval("                        +------------------------------+")
escreval("                        |             VocÍ             |")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
fimprocedimento

// =====================================================================================================================

procedimento mostrarMorte
inicio
limpatela
escreval("                        +------------------------------+")
escreval("                        |           *********          |")
escreval("                        |         *************        |  Sua pontuaÁ„o: ", jogador_1[constPontuacao]," ")
escreval("                        |        *****     *****       |")
escreval("                        |       ***           ***      |")
escreval("                        |      ***             ***     |  VocÍ : ",mostrarVidas(jogador_1[constVida])," ")
escreval("                        |      **    0     0    **     |  Morte: ",mostrarVidas(jogador_morte[constVida])," ")
escreval("                        |      **               **     |")
escreval("                        |      ***             ***     |")
escreval("                        |      ****           ****     |")
escreval("                        |      *****         *****     |")
escreval("                        |      ******       ********   |")
escreval("                        |    *********     **********  |")
escreval("                        | *************   ************ |")
escreval("                        |*************** **************|")
escreval("                        |******************************|")
escreval("                        |******************************|")
escreval("                        |******************************|")
escreval("                        +------------------------------+")
escreval("                        |             Morte            |")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
fimprocedimento

// =====================================================================================================================

procedimento mostrarRevolver
inicio
limpatela
escreval("                        +------------------------------+")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |       _  __________=__       |")
escreval("                        |        \\@([____]_____()     |")
escreval("                        |       _/\|-[____]            |")
escreval("                        |      /     /(( )             |")
escreval("                        |     /____|'----'             |")
escreval("                        |     \____/                   |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
timer(1000)
escreva ("                                   3..")
escreva ("2..")
escreva ("1..")
timer(0)
limpatela
fimprocedimento

// =====================================================================================================================

procedimento mostrarRevolverGirando
inicio
limpatela
escreval("                        +------------------------------+")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |       _  __________=__       |")
escreval("                        |        \\@([____]_____()     |")
escreval("                        |       _/\|-[____]            |")
escreval("                        |      /     /(( )             |")
escreval("                        |     /____|'----'             |")
escreval("                        |     \____/                   |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        +------------------------------+")
escreval("                        |*O cilindro enferrujado gira  |")
escreval("                        | com dificuldade.             |")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
timer(850)
escreva()
timer(0)
limpatela
cilindrosGeradosTotal:=cilindrosGeradosTotal+1
fimprocedimento

// =====================================================================================================================

procedimento mostrarRevolverFalhando
inicio
limpatela
mostrarRevolver
escreval("                        +------------------------------+")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |       _  __________=__       |")
escreval("                        |        \\@([____]_____()     |")
escreval("                        |       _/\|-[____]            |")
escreval("                        |      /     /(( )    CLICK!   |")
escreval("                        |     /____|'----'             |")
escreval("                        |     \____/                   |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        +------------------------------+")
escreval("                        |*O som metalico e seco mostra,|")
escreval("                        | a arma n„o efetuou o disparo.|")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
timer(1000)
escreva()
timer(0)
disparosNormais:=disparosNormais+1
fimprocedimento

// =====================================================================================================================

procedimento mostrarRevolverAtirando
inicio
limpatela
mostrarRevolver
escreval("                        +------------------------------+")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                        '¥    |")
escreval("                        |                            ' |")
escreval("                        |                       |  /   |")
escreval("                        |       _  __________=__  / '  |")
escreval("                        |        \\@([____]_____() =   |")
escreval("                        |       _/\|-[____]       \_  *|")
escreval("                        |      /     /(( )      |   \  |")
escreval("                        |     /____|'----'         \ ' |")
escreval("                        |     \____/                \  |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        +------------------------------+")
escreval("                        |*O clar„o e o estrondo gerado |")
escreval("                        | evidenciam o disparo         |")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
timer(1000)
escreva()
timer(0)
disparosFatais:=disparosFatais+1
fimprocedimento

// =====================================================================================================================

procedimento atirouMorte
inicio
limpatela
escreval("                        +------------------------------+")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                        '¥    |")
escreval("                        |                            ' |")
escreval("                        |                       |  /   |")
escreval("                        |       _  __________=__  / '  |")
escreval("                        |        \\@([____]_____() =   |")
escreval("                        |       _/\|-[____]       \_  *|")
escreval("                        |      /     /(( )      |   \  |")
escreval("                        |     /____|'----'         \ ' |")
escreval("                        |     \____/                \  |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        +------------------------------+")
escreval("                        |*O disparo È efetuado, o pro- |")
escreval("                        | jetil acerta a morte.        |")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
timer(1000)
escreva()
timer(0)
disparosFatais:=disparosFatais+1
fimprocedimento

// =====================================================================================================================

procedimento mostrarAtirar
inicio
limpatela
escreval("                        +------------------------------+")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |       _  __________=__       |")
escreval("                        |        \\@([____]_____()     |")
escreval("                        |       _/\|-[____]            |")
escreval("                        |      /     /(( )             |")
escreval("                        |     /____|'----'             |")
escreval("                        |     \____/                   |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        +------------------------------+")
escreval("                        |*Em um lapso de coragem vocÍ  |")
escreval("                        | aponta o revolver para morte.|")
escreval("                        +------------------------------+")
timer(850)
escreva()
timer(0)
limpatela
fimprocedimento

// =====================================================================================================================




procedimento mostrarChecar
inicio
limpatela
escreval("                        +------------------------------+")
escreval("                        |                              |")
escreval("                        |          ____________        |")
escreval("                        |         /\  ________ \       |")
escreval("                        |        /  \ \______/\ \      |")
escreval("                        |       / /\ \ \  / /\ \ \     |")
escreval("                        |      / / /\ \ \/ / /\ \ \    |")
escreval("                        |     / / /__\ \ \/_/__\_\ \   |")
escreval("                        |    / /_/____\ \__________/   |")
escreval("                        |    \ \ \____/ / ________/    |")
escreval("                        |     \ \ \  / / /\ \  / /     |")
escreval("                        |      \ \ \/ / /\ \ \/ /      |")
escreval("                        |       \ \/ / /__\_\/ /       |")
escreval("                        |        \_ /_/______\/        |")
escreval("                        |                              |")
escreval("                        +------------------------------+")
escreval("                        |*Sua vis„o È afetada, e vocÍ  |")
escreval("                        | consegue ver alÈm da matÈria.|")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
timer(800)
escreva()
timer(0)
limpatela
escreval("                        +------------------------------+")
escreval("                        |                              |")
escreval("                        |           ________           |")
escreval("                        |        /\ \______/\ \        |")
escreval("                        |       / /\ \ \  / /\ \       |")
escreval("                        |      / /\ \ \/ / /\ \ \      |")
escreval("                        |     / /__\ \ \/_/__\_\ \     |")
escreval("                        |    /_/____\ \___________\    |")
escreval("                        |    \ \____/ / ________  /    |")
escreval("                        |     \ \ \  / / /\ \  / /     |")
escreval("                        |      \ \ \/ / /\ \ \/ /      |")
escreval("                        |       \_\/ / /__\_\/ /       |")
escreval("                        |        \/ /______\/ /        |")
escreval("                        |                              |")
escreval("                        |                              |")
escreval("                        +------------------------------+")
escreval("                        |*Ao olhar o revolver, vocÍ ve |")
escreval("                        | o passado, presente e futuro.|")
escreval("                        +------------------------------+")
escreval("------------------------------------------------------------------------------------")
timer(500)
escreval()
timer(0)
fimprocedimento
// =====================================================================================================================

procedimento opcoesJogar
var
escolhaAcao:caracter
opcao:caracter
inicio
//limpa os scores
dificuldade:=""
rounds:=0
cilindrosGeradosTotal:=0
disparosFatais:=0
disparosNormais:=0
girosComprados:=0
checagemComprados:=0
vidasComprados:=0

jogando:=1
opcoesDificuldade
vezJogador:=sorteio()
repita
   rounds:=rounds+1
   posicaoDisparo:=randi(7)
   se (vezJogador = 1) entao
      repita
         mostrarPersonagem
         opcao:=solicitar(jogador_1[constJogador])
         opcoesAcoes(opcao)
      ate (opcao = "1") ou (jogando = 0)
      vezJogador:=2
   senao
      //jogador_morte comeÁa
      repita
         mostrarMorte
         opcao:=solicitar(jogador_morte[constJogador])
         opcoesAcoes(opcao)
      ate (opcao = "1")
      vezJogador:=1
   fimse
ate (jogando=0)
morreu

fimprocedimento

// =====================================================================================================================

funcao solicitar(jogador:inteiro):caracter
var
escolhaAcao:caracter
aleatorioTempo:inteiro //valor referente ao tempo de espera entre as a√ß√µes, simula que a maquina esta "pensando"
inicio
escolhaAcao:=""
se (jogador = 1) entao //se jogador for jogador
   escreval("Sua vez, o que deseja fazer?")
   escreval("[1] - Disparar")
   escreval("[2] - Rodar o cilindro ( -",custoRotacao," pontos)")
   escreval("[3] - Comprar vida     ( -",custoVida," pontos)")
   escreval("[4] - Checar camara    ( -",custoChecar," pontos)")
   escreval("[5] - Atirar na morte  ( -",custoAtirar," pontos)")
   repita
      escreva("OpÁ„o: ")
      leia(escolhaAcao)
   ate ((escolhaAcao = "1") ou (escolhaAcao = "2") ou (escolhaAcao = "3") ou (escolhaAcao = "4") ou (escolhaAcao = "5") ou (escolhaAcao = "1337"))
senao //computador
   escreval("Vez da Morte, Aguarde.")
   //aqui ser√£o definidos as escolhas da morte, escolhe se vai jogar ou rodar o cilindro
   aleatorioTempo:=randi(1000)+2000 //milisegundos 2 √° 5 segundos de escolha
   escolhaAcao:=numpcarac(randi(2)+1)
   timer(aleatorioTempo)
   escreva
   timer(0)
fimse
retorne escolhaAcao

fimfuncao

// =====================================================================================================================

procedimento opcoesAcoes(opcao:caracter)
var
pontos:inteiro
inicio
pontos:=custoGanharPontos*multiplicador
escolha opcao
caso "1" //disparar
   //acao disparar 0 -> falhou
   //acao disparar 1 -> atirou e acabou as vidas
   se (acaoDisparar() = 0) entao
      //falhou
      se (vezJogador = 1) entao
         jogador_1[constPontuacao]:=jogador_1[constPontuacao]+pontos
         escreval("                         A arma n„o disparou. (+", pontos,")")
         escreval("                        -_- Iniciar - Pressione Enter -_-")
         leia(null)
      senao
         //morte disparou e n„o perdeu
      fimse
   senao //se acaoDisparar = 1
      //disparou
   fimse
caso "2" //rodar
   acaoRodarCilindro
caso "3" //comprar vida
   acaoComprarVida
caso "4" //checar revolver
   acaoChecarRevolver
caso "5" //checar revolver
   acaoAtirar
caso "1337" //checar revolver
   jogador_1[constPontuacao]:=jogador_1[constPontuacao]+9000
fimescolha
fimprocedimento

// =====================================================================================================================

procedimento morreu
inicio
limpatela
escolha jogadorGanhador
caso 1 //morte moreu = ganhou
   mostrarGanhou
   jogador_1[constPontuacao]:=jogador_1[constPontuacao]+premioGanhar
   mostrarMenu
caso 2 //jogador morreu = perdeu
   mostrarPerdeu
   mostrarMenu
fimescolha
escreval("                        -_- Voltar ao Menu - Pressione Enter -_-")
leia(null)
mostrarMenu


fimprocedimento

// =====================================================================================================================

procedimento acaoRodarCilindro
inicio
se (vezJogador = 1) entao
   se (jogador_1[constPontuacao] > custoRotacao) entao
      jogador_1[constPontuacao]<-(jogador_1[constPontuacao])-custoRotacao)
      girosComprados:=girosComprados+1
      limpatela
      mostrarRevolverGirando
      posicaoDisparo:=randi(7)
   senao
      escreval("VocÍ n„o possui Pontos para realizar uma rotaÁ„o.")
      escreval("                        -_- Iniciar - Pressione Enter -_-")
      leia(null)
   fimse
senao
   mostrarRevolverGirando
   posicaoDisparo:=randi(7)
fimse

fimprocedimento

// =====================================================================================================================

funcao acaoDisparar():inteiro
var
disparou:inteiro
inicio
disparou:=0
se (vetorCilindro[posicaoDisparo] = 1) entao //verifica se h√° uma bala na posi√ß√£o de disparo
   //Arma disparada
   escreval("Arma Disparada")
   mostrarRevolverAtirando
   se (vezJogador = 1) entao
      jogador_1[constVida]<-(jogador_1[constVida])-1)
      disparou:=1
      se (jogador_1[constVida] = 0) entao
         //jogador_1 perdeu
         jogadorGanhador:=2
         jogando:=0
      fimse
   senao
      jogador_morte[constVida]<-(jogador_morte[constVida])-1)
      disparou:=1
      se (jogador_morte[constVida] = 0) entao
         jogadorGanhador:=1
         jogando:=0
      fimse
   fimse
senao
   mostrarRevolverFalhando
   disparou:=0
fimse
retorne disparou
fimfuncao

// =====================================================================================================================

procedimento acaoComprarVida
inicio
se (jogador_1[constPontuacao] >= custoVida) entao
   jogador_1[constVida]:=(jogador_1[constVida]+1)
   jogador_1[constPontuacao]:=(jogador_1[constPontuacao]-custoVida)
   vidasComprados:=vidasComprados+1
senao
   escreval("VocÍ n„o possui pontos o suficiente")
   escreval("                        -_- Iniciar - Pressione Enter -_-")
   leia(null)
fimse
fimprocedimento

// =====================================================================================================================

procedimento acaoChecarRevolver
inicio
se (jogador_1[constPontuacao] >= custoChecar) entao
   jogador_1[constPontuacao]:=(jogador_1[constPontuacao]-custoChecar)
   checagemComprados:=checagemComprados+1
   mostrarChecar
   se (vetorCilindro[posicaoDisparo] = 1) entao
      escreval("                   Com isso vocÍ constata que a bala SER¡ DISPARADA.                ")
      escreval("                        -_- Iniciar - Pressione Enter -_-")
      leia(null)
   senao
      escreval("                  Com isso vocÍ constata que a bala N√O SER¡ DISPARADA.             ")
      escreval("                        -_- Iniciar - Pressione Enter -_-")
      leia(null)
   fimse
senao
   escreval("VocÍ n„o possui pontos o suficiente")
   escreval("                        -_- Iniciar - Pressione Enter -_-")
   leia(null)
fimse
fimprocedimento

// =====================================================================================================================

procedimento acaoAtirar
inicio
se (jogador_1[constPontuacao] >= custoAtirar) entao
   jogador_1[constPontuacao]:=(jogador_1[constPontuacao]-custoAtirar)
   mostrarAtirar
   se (vetorCilindro[posicaoDisparo]=1) entao //atira e tira vida
      jogador_morte[constVida]:=(jogador_morte[constVida]-1)
      atirouMorte
   senao //atirou e n„o tira vida
      mostrarRevolverFalhando
   fimse
   tirosComprados:=tirosComprados+1
   se (jogador_morte[constVida] <= 0) entao
      jogadorGanhador:=1
      jogando:=0
   fimse
   escreval("                        -_- Continuar - Pressione Enter -_-")
   leia(null)
   posicaoDisparo:=randi(7)
senao
   escreval("VocÍ n„o possui pontos o suficiente")
   escreval("                        -_- Continuar - Pressione Enter -_-")
   leia(null)
fimse
fimprocedimento

// =====================================================================================================================

//INICIO
limpatela
mostrarBanner
mostrarMenu

fimalgoritmo
