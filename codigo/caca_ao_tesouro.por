programa
{
    inclua biblioteca Util --> u

    // MATRIZ 5x5
    inteiro matriz[5][5]

    // DADOS DO JOGO
    inteiro bateria = 100
    inteiro creditos = 0
    inteiro rodadas = 0
    inteiro nivel = 1
    inteiro tesouroEncontrado = 0

    // PERCENTUAIS DOS NIVEIS
    inteiro percentualNivel1 = 0
    inteiro percentualNivel2 = 0
    inteiro percentualNivel3 = 0

    // LIMITES DOS NIVEIS
    inteiro fimNivel1 = 0
    inteiro fimNivel2 = 0
    inteiro fimNivel3 = 25

    // POSICAO DO RISCO
    inteiro linhaRisco = 0
    inteiro colunaRisco = 0


    funcao inicio()
    {
        inteiro casa = 0
        inteiro linha = 0
        inteiro coluna = 0
        inteiro casasNivel1 = 0


        escreva("========================================\n")
        escreva("           CACA AO TESOURO\n")
        escreva("========================================\n\n")


        // ========================================
        // ENTRADA DOS PERCENTUAIS
        // ========================================

        faca
        {
            escreva("Digite o percentual do Nivel I: ")
            leia(percentualNivel1)

            escreva("Digite o percentual do Nivel II: ")
            leia(percentualNivel2)

            escreva("Digite o percentual do Nivel III: ")
            leia(percentualNivel3)


            // Calcula quantas casas o Nivel I tera
            casasNivel1 = (25 * percentualNivel1 + 50) / 100


            se (percentualNivel1 < 0 ou percentualNivel2 < 0 ou percentualNivel3 < 0)
            {
                escreva("\nOs percentuais nao podem ser negativos.\n")
            }
            senao se (percentualNivel1 + percentualNivel2 + percentualNivel3 != 100)
            {
                escreva("\nERRO: A soma dos percentuais deve ser exatamente 100%.\n")
            }
            senao se (casasNivel1 > 23)
            {
                escreva("\nERRO: Os niveis II e III precisam ter pelo menos 2 casas no total.\n")
                escreva("Digite novos percentuais.\n")
            }

        } enquanto (
            percentualNivel1 < 0 ou
            percentualNivel2 < 0 ou
            percentualNivel3 < 0 ou
            percentualNivel1 + percentualNivel2 + percentualNivel3 != 100 ou
            casasNivel1 > 23
        )


        // ========================================
        // GERA O CENARIO
        // ========================================

        GerarCenario()


        escreva("\n========================================\n")
        escreva("            INICIO DO JOGO\n")
        escreva("========================================\n")


        // ========================================
        // PERCORRE AS 25 CASAS
        // ========================================

        para (casa = 0; casa < 25; casa++)
        {
            // Verifica se possui bateria suficiente
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


            // Registra a rodada
            rodadas++


            // ====================================
            // DESCOBRE O NIVEL DA CASA
            // ====================================

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


            // ====================================
            // CONSUMO DA RODADA
            // ====================================

            DiminuirBateria()


            escreva("Bateria apos movimento: ", bateria, "\n")


            // ====================================
            // VERIFICA O CONTEUDO DA CASA
            // ====================================

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


        // ========================================
        // RESULTADO FINAL
        // ========================================

        escreva("\n\n========================================\n")
        escreva("           RESULTADO DO JOGO\n")
        escreva("========================================\n\n")


        // ========================================
        // MOSTRA A MATRIZ
        // ========================================

        para (inteiro i = 0; i < 5; i++)
        {
            para (inteiro j = 0; j < 5; j++)
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


        // ========================================
        // INFORMACOES FINAIS
        // ========================================

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


        escreva("========================================\n")


        se (tesouroEncontrado == 1)
        {
            escreva("          VOCE VENCEU!\n")
        }
        senao
        {
            escreva("          VOCE PERDEU!\n")
        }


        escreva("========================================\n")
    }


    // ==================================================
    // GERAR CENARIO
    // ==================================================

    funcao GerarCenario()
    {
        // ------------------------------------------
        // Inicializa a matriz
        // ------------------------------------------

        para (inteiro i = 0; i < 5; i++)
        {
            para (inteiro j = 0; j < 5; j++)
            {
                matriz[i][j] = 0
            }
        }


        // ------------------------------------------
        // Calcula os limites dos niveis
        // ------------------------------------------

        // Arredondamento convencional
        fimNivel1 = (25 * percentualNivel1 + 50) / 100

        fimNivel2 = (25 * (percentualNivel1 + percentualNivel2) + 50) / 100

        fimNivel3 = 25


        escreva("\n========================================\n")
        escreva("           CONFIGURACAO DOS NIVEIS\n")
        escreva("========================================\n")

        escreva("Nivel I: casas 01 ate ", fimNivel1, "\n")

        escreva("Nivel II: casas ")
        escreva(fimNivel1 + 1)
        escreva(" ate ")
        escreva(fimNivel2)
        escreva("\n")

        escreva("Nivel III: casas ")
        escreva(fimNivel2 + 1)
        escreva(" ate 25\n")


        // ------------------------------------------
        // Sorteia B05
        // Pode estar em qualquer nivel
        // ------------------------------------------

        SortearElemento(1, 0, 24)


        // ------------------------------------------
        // Sorteia B10
        // Pode estar em qualquer nivel
        // ------------------------------------------

        SortearElemento(2, 0, 24)


        // ------------------------------------------
        // Sorteia RISCO
        // Somente Nivel II ou Nivel III
        // ------------------------------------------

        SortearElemento(3, fimNivel1, 24)


        // ------------------------------------------
        // Sorteia TESOURO
        // Somente Nivel II ou Nivel III
        // ------------------------------------------

        SortearElemento(4, fimNivel1, 24)
    }


    // ==================================================
    // SORTEAR ELEMENTO
    // ==================================================

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


        // Coloca o elemento na casa
        matriz[linha][coluna] = elemento


        // Se for o risco, guarda sua posicao
        se (elemento == 3)
        {
            linhaRisco = linha
            colunaRisco = coluna
        }
    }


    // ==================================================
    // DIMINUIR BATERIA
    // ==================================================

    funcao DiminuirBateria()
    {
        bateria = bateria - 10
    }


    // ==================================================
    // BONUS
    // ==================================================

    funcao Bonus(inteiro valor)
    {
        // Acrescenta o bonus na bateria
        bateria = bateria + valor

        // Registra os creditos obtidos
        creditos = creditos + valor
    }


    // ==================================================
    // RISCO
    // ==================================================

    funcao Risco()
    {
        // Penalidade do risco
        bateria = bateria - 3
    }
}
