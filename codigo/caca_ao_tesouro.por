programa
{
    inclua biblioteca Util --> u

    // ==========================================
    // MATRIZ 5x5
    // ==========================================

    inteiro matriz[5][5]

    // ==========================================
    // DADOS DO JOGO
    // ==========================================

    inteiro bateria = 100
    inteiro creditos = 0
    inteiro rodadas = 0
    inteiro nivel = 1
    inteiro tesouroEncontrado = 0

    // ==========================================
    // PERCENTUAIS DOS NIVEIS
    // ==========================================

    inteiro percentualNivel1 = 0
    inteiro percentualNivel2 = 0
    inteiro percentualNivel3 = 0

    // ==========================================
    // LIMITES DOS NIVEIS
    // ==========================================

    inteiro fimNivel1 = 0
    inteiro fimNivel2 = 0
    inteiro fimNivel3 = 25

    // ==========================================
    // POSICAO DO RISCO
    // ==========================================

    inteiro linhaRisco = 0
    inteiro colunaRisco = 0


    // ==========================================
    // PROGRAMA PRINCIPAL
    // ==========================================

    funcao inicio()
    {
        inteiro casa = 0
        inteiro linha = 0
        inteiro coluna = 0
        inteiro i = 0
        inteiro j = 0

        escreva("========================================\n")
        escreva("          CACA AO TESOURO\n")
        escreva("========================================\n\n")

        // ======================================
        // ENTRADA DOS PERCENTUAIS
        // ======================================

        faca
        {
            escreva("Digite o percentual do Nivel I: ")
            leia(percentualNivel1)

            escreva("Digite o percentual do Nivel II: ")
            leia(percentualNivel2)

            escreva("Digite o percentual do Nivel III: ")
            leia(percentualNivel3)

            se (percentualNivel1 < 0 ou percentualNivel2 < 0 ou percentualNivel3 < 0)
            {
                escreva("\nERRO: Os percentuais nao podem ser negativos.\n\n")
            }
            senao se (percentualNivel1 + percentualNivel2 + percentualNivel3 != 100)
            {
                escreva("\nERRO: A soma dos percentuais deve ser exatamente 100%.\n\n")
            }

        } enquanto (percentualNivel1 < 0 ou percentualNivel2 < 0 ou percentualNivel3 < 0 ou percentualNivel1 + percentualNivel2 + percentualNivel3 != 100)


        // ======================================
        // GERA O CENARIO
        // ======================================

        GerarCenario()


        escreva("\n========================================\n")
        escreva("        CONFIGURACAO DO CENARIO\n")
        escreva("========================================\n")

        escreva("Nivel I: casas 01 ate ", fimNivel1, "\n")
        escreva("Nivel II: casas ", fimNivel1 + 1, " ate ", fimNivel2, "\n")
        escreva("Nivel III: casas ", fimNivel2 + 1, " ate 25\n")


        // ======================================
        // INICIO DO JOGO
        // ======================================

        escreva("\n========================================\n")
        escreva("             INICIO DO JOGO\n")
        escreva("========================================\n")


        // ======================================
        // PERCORRE AS 25 CASAS
        // ======================================

        para (casa = 0; casa < 25; casa++)
        {
            // Verifica se existe bateria suficiente
            // para iniciar uma nova rodada

            se (bateria < 10)
            {
                pare
            }


            // Converte a casa para linha e coluna
            //
            // Casa 01 = [0,0]
            // Casa 02 = [0,1]
            // Casa 03 = [0,2]
            // ...
            // Casa 25 = [4,4]

            linha = casa / 5
            coluna = casa % 5


            // Conta a rodada

            rodadas++


            // ==================================
            // IDENTIFICA O NIVEL DA CASA
            // ==================================

            se (casa < fimNivel1)
            {
                nivel = 1
            }
            senao se (casa < fimNivel2)
            {
                nivel = 2
            }
            senao
            {
                nivel = 3
            }


            escreva("\n----------------------------------------\n")
            escreva("Rodada: ", rodadas, "\n")
            escreva("Casa: ", casa + 1, "\n")
            escreva("Posicao: [", linha, ",", coluna, "]\n")
            escreva("Nivel: ", nivel, "\n")


            // ==================================
            // DIMINUI A BATERIA
            // ==================================

            DiminuirBateria()

            escreva("Bateria apos movimento: ", bateria, "\n")


            // ==================================
            // VERIFICA O CONTEUDO DA CASA
            // ==================================

            se (matriz[linha][coluna] == 1)
            {
                escreva("BONUS B05 ENCONTRADO!\n")

                Bonus(5)
            }
            senao se (matriz[linha][coluna] == 2)
            {
                escreva("BONUS B10 ENCONTRADO!\n")

                Bonus(10)
            }
            senao se (matriz[linha][coluna] == 3)
            {
                escreva("RISCO ENCONTRADO!\n")

                Risco()
            }
            senao se (matriz[linha][coluna] == 4)
            {
                escreva("TESOURO ENCONTRADO!\n")

                tesouroEncontrado = 1

                // O jogo termina imediatamente

                pare
            }
            senao
            {
                escreva("CASA VAZIA.\n")
            }


            escreva("Bateria atual: ", bateria, "\n")
            escreva("Creditos obtidos: ", creditos, "\n")
        }


        // ======================================
        // RESULTADO FINAL
        // ======================================

        escreva("\n\n========================================\n")
        escreva("           RESULTADO DO JOGO\n")
        escreva("========================================\n\n")


        // ======================================
        // MOSTRA A MATRIZ
        // ======================================

        escreva("Cenario final:\n\n")

        para (i = 0; i < 5; i++)
        {
            para (j = 0; j < 5; j++)
            {
                se (matriz[i][j] == 0)
                {
                    escreva("--- ")
                }
                senao se (matriz[i][j] == 1)
                {
                    escreva("B05 ")
                }
                senao se (matriz[i][j] == 2)
                {
                    escreva("B10 ")
                }
                senao se (matriz[i][j] == 3)
                {
                    escreva("RIS ")
                }
                senao
                {
                    escreva("$$$ ")
                }
            }

            escreva("\n")
        }


        // ======================================
        // INFORMACOES FINAIS
        // ======================================

        escreva("\nBateria restante: ", bateria, " creditos\n")

        escreva("Creditos obtidos: ", creditos, " creditos\n")


        se (nivel == 1)
        {
            escreva("Nivel atingido: I\n")
        }
        senao se (nivel == 2)
        {
            escreva("Nivel atingido: II\n")
        }
        senao
        {
            escreva("Nivel atingido: III\n")
        }


        se (tesouroEncontrado == 1)
        {
            escreva("Tesouro encontrado: SIM\n")
        }
        senao
        {
            escreva("Tesouro encontrado: NAO\n")
        }


        escreva("Posicao do risco: [")
        escreva(linhaRisco)
        escreva(",")
        escreva(colunaRisco)
        escreva("]\n")

        escreva("Quantidade de rodadas: ", rodadas, "\n")


        escreva("\n========================================\n")

        se (tesouroEncontrado == 1)
        {
            escreva("             VOCE VENCEU!\n")
        }
        senao
        {
            escreva("             VOCE PERDEU!\n")
        }

        escreva("========================================\n")
    }


    // ==========================================
    // FUNCAO GERAR CENARIO
    // ==========================================

    funcao GerarCenario()
    {
        inteiro i = 0
        inteiro j = 0

        // ======================================
        // DEIXA TODAS AS CASAS VAZIAS
        // ======================================

        para (i = 0; i < 5; i++)
        {
            para (j = 0; j < 5; j++)
            {
                matriz[i][j] = 0
            }
        }


        // ======================================
        // CALCULA OS LIMITES DOS NIVEIS
        // ======================================
        //
        // Exemplo:
        // 25% de 25 = 6,25 -> 6 casas
        // 35% de 25 = 8,75 -> 9 casas
        // 40% de 25 = 10 casas
        //
        // O +50 permite arredondamento
        // usando numeros inteiros.

        fimNivel1 = (25 * percentualNivel1 + 50) / 100

        fimNivel2 = (25 * (percentualNivel1 + percentualNivel2) + 50) / 100

        fimNivel3 = 25


        // ======================================
        // SORTEIA B05
        // PODE ESTAR EM QUALQUER NIVEL
        // ======================================

        SortearElemento(1, 0, 24)


        // ======================================
        // SORTEIA B10
        // PODE ESTAR EM QUALQUER NIVEL
        // ======================================

        SortearElemento(2, 0, 24)


        // ======================================
        // SORTEIA RISCO
        // SOMENTE NIVEL II OU III
        // ======================================

        SortearElemento(3, fimNivel1, 24)


        // ======================================
        // SORTEIA TESOURO
        // SOMENTE NIVEL II OU III
        // ======================================

        SortearElemento(4, fimNivel1, 24)
    }


    // ==========================================
    // FUNCAO SORTEAR ELEMENTO
    // ==========================================

    funcao SortearElemento(inteiro elemento, inteiro inicio, inteiro fim)
    {
        inteiro casa = 0
        inteiro linha = 0
        inteiro coluna = 0

        faca
        {
            // Sorteia uma casa

            casa = u.sorteia(inicio, fim)

            // Converte para linha e coluna

            linha = casa / 5
            coluna = casa % 5

        } enquanto (matriz[linha][coluna] != 0)


        // Coloca o elemento na matriz

        matriz[linha][coluna] = elemento


        // Guarda a posicao do risco

        se (elemento == 3)
        {
            linhaRisco = linha
            colunaRisco = coluna
        }
    }


    // ==========================================
    // FUNCAO DIMINUIR BATERIA
    // ==========================================

    funcao DiminuirBateria()
    {
        bateria = bateria - 10
    }


    // ==========================================
    // FUNCAO BONUS
    // ==========================================

    funcao Bonus(inteiro valor)
    {
        bateria = bateria + valor

        creditos = creditos + valor
    }


    // ==========================================
    // FUNCAO RISCO
    // ==========================================

    funcao Risco()
    {
        // O risco acontece depois dos 10
        // creditos de consumo da rodada.

        bateria = bateria - 3
    }
}
