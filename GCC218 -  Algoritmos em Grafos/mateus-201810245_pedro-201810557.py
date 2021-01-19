from math import inf, sqrt, pow
from os import path
import time
import argparse

# classe usada para instanciar um problema
class Problema(object):
    def __init__(self, file):
        self.file = file  # guarda o nome do problema
        self.matrizAdj = []  # matriz de adjacencia do grafo
        self.vertices = []  # lista de dicionarios [{coord:(x, y), status:0}]
        self.secoes = []  # lista de tuplas com tamanho variavel, guarda os vertices de cada secao
        self.statusSecao = []  # facilidade para verificar o status de uma secao
        self.arestas = []  # lista de tuplas com pares de vertices vizinhos
        self.demandaPorSecao = []  # guarda a demanda das secoes
        self.dados = {  # recebe os demais dados do problema
            "DIMENSION": 0,
            "VEHICLES": 0,
            "SETS": 0,
            "CAPACITY": 0,
            "EDGE_WEIGHT_TYPE": None
        }

        self.leituraDados(file)  # metodo de leitura de arquivos
        self.inicializaMatrizAdj()
        self.atualizaArestas()  # percorre matriz e atualiza o atrinuto "arestas"

        # atributo usado para tentar otimizar a busca por vizinho com melho custo beneficio de visita
        self.cargaIdeal = sum(self.demandaPorSecao) / self.dados['VEHICLES']

        self.veiculos = []  # lista de dicionarios que guardam os dados de cada veiculo
        for i in range(0, self.dados['VEHICLES']):
            self.veiculos.append({'distancia': 0, 'carga': 0, 'secoes': [], 'vertices': [1]})

    # inicializacao
    def leituraDados(self, file):
        arquivo = open(f'data/{file}.txt', 'r')
        chave = ''
        linhas = arquivo.readlines()

        for dado in linhas:
            dado = dado.rstrip()  # retira \n
            if " : " in dado:
                quebra = dado.split(" : ")
                if quebra[0] in self.dados.keys():
                    chave = quebra[0]
                    valor = quebra[1]
                    self.dados[chave] = int(valor, 10) if valor.isnumeric() else valor
            elif not ' ' in dado:
                chave = dado
            else:
                if chave == 'NODE_COORD_SECTION':
                    quebra = dado.split(' ')
                    coordenada = (int(quebra[1], 10), int(quebra[2], 10))  # tupla de coordenadas do vertice
                    self.addVertice(coordenada)
                elif chave == 'SET_SECTION':
                    valor = ()  # tupla de vertices da secao
                    quebra = dado.split(' ')
                    quebra.pop(0)  # retira o numero da secao
                    quebra.pop()  # retira o ultimo elem (-1)
                    for val in quebra:
                        val = int(val, 10)
                        valor += (val,)
                    self.secoes.append(valor)
                    self.statusSecao.append(0)
                elif chave == 'DEMAND_SECTION':
                    quebra = dado.split(' ')
                    valor = int(quebra[1], 10)
                    self.demandaPorSecao += (valor,)

    def inicializaMatrizAdj(self):
        self.matrizAdj = []
        for i in range(0, self.dados['DIMENSION']):
            linha = []
            for j in range(0, self.dados['DIMENSION']):
                d = 0 if i == j else None
                linha.append(d)
            self.matrizAdj.append(linha)

        # instancia arestas de um vertice a todos os outros vertices que nao pertencem a sua secao
        for vertice, dadosVertice in enumerate(self.vertices):
            for secao in self.secoes:
                if not vertice + 1 in secao:
                    for verticeDaSecao in secao:
                        self.matrizAdj[vertice][verticeDaSecao - 1] = self.matrizAdj[verticeDaSecao - 1][vertice] = \
                            self.dist2vertices(dadosVertice['coord'], self.vertices[verticeDaSecao - 1]['coord'])

    # usado no metodo de leitura de arquivos para adicionar os vertices
    def addVertice(self, coord):
        vertice = {'coord': coord, 'status': 0}
        self.vertices.append(vertice)

    #
    def dist2vertices(self, coord1, coord2, coord=True):
        if coord:
            return sqrt(pow(coord1[0]-coord2[0], 2) + pow(coord1[1]-coord2[1], 2))
        else:
            return sqrt(pow(self.vertices[coord1 - 1]['coord'][0] - self.vertices[coord2 - 1]['coord'][0], 2) +
                        pow(self.vertices[coord1 - 1]['coord'][1] - self.vertices[coord2 - 1]['coord'][1], 2))

    # metodo usado como facilidade para calcular dist de um determinado vertice ao deposito
    def distanciaCentro(self, vertice):
        return self.dist2vertices(1, vertice, coord=False)

    # retorna um dicionario com numero da secao e sua demanda
    def obtemSecao(self, vertice):
        for secao, elem in enumerate(self.secoes):
            if vertice in elem:
                return {'secao': secao + 1, 'demanda': self.demandaPorSecao[secao]}
        return False

    def obtemMelhorVizinho(self, vertice, veicNum, cargaIdeal = True):
        coordVertice = self.vertices[vertice - 1]['coord']

        distCentro = self.distanciaCentro(vertice)
        carga_de_calculo = self.dados['CAPACITY'] if not cargaIdeal else self.cargaIdeal
        cargaFaltante = carga_de_calculo - self.veiculos[veicNum]['carga']  # self.dados['CAPACITY'] era self.cargaIdeal

        melhorVizinho = {'vertice': None, 'custo-beneficio': -inf, 'distancia': inf, 'secao': None, 'demanda': None}

        # percorre as distancias do vertice (passado por parametro) utilizando a matriz de adjacencia
        for viz, dist in enumerate(self.matrizAdj[vertice - 1]):
            if self.vertices[viz]['status'] == 0 and viz != 0 and viz + 1 != vertice and dist is not None and dist != 0:
                dadosVizinho = self.obtemSecao(viz + 1)  # retorna dicionario com secao e demanda
                coordVizinho = self.vertices[viz]['coord']
                dadosVizinho.update({'distancia': self.dist2vertices(coordVertice, coordVizinho)})  # concatena a distancia

                numerador = dadosVizinho['demanda']
                denominador = cargaFaltante * (dadosVizinho['distancia'] + abs(self.distanciaCentro(viz + 1) - distCentro))

                custo_beneficio = -inf if denominador <= 0 else numerador / denominador

                # se a demanda do melhor vizinho encontrado ate agora for igual a carga faltante, nao entra no if
                #     caso o custo benificio do melhor vizinho encontrado ate agora for igual ao custo beneficio do vizinho atual, verifica:
                #         se carga faltante for igual a demanda do viznho atual ou distancia do vizinho atual for menor que a distancia do melhor vizinho, entra no if
                #     OU: caso o custo beneficio do vizinho atual for maior do que o custo do melhor vizinho até agora e a carga faltante for maior do que a demanda, entra no if
                ##########
                # em resumo: verifica se o vizinho atual é melhor do que o melhor vizinho encontrado até agora
                if melhorVizinho['demanda'] != cargaFaltante and ((custo_beneficio == melhorVizinho['custo-beneficio'] and
                        (cargaFaltante == dadosVizinho['demanda'] or
                         dadosVizinho['distancia'] < melhorVizinho['distancia'])) or
                        (custo_beneficio > melhorVizinho['custo-beneficio'] and
                         cargaFaltante >= dadosVizinho['demanda'])):
                    melhorVizinho['vertice'] = viz + 1
                    melhorVizinho['custo-beneficio'] = custo_beneficio
                    melhorVizinho['distancia'] = dadosVizinho['distancia']
                    melhorVizinho.update(dadosVizinho)

        return melhorVizinho

    # arestas
    # percorre a matriz verificando adjacencias e as insere no atributo arestas
    def atualizaArestas(self):
        self.arestas = []
        for verticeLinha, lista in enumerate(self.matrizAdj):
            for verticeColuna, dist in enumerate(lista):
                if verticeColuna > verticeLinha and dist != None:
                    self.arestas.append((verticeLinha + 1, verticeColuna + 1, dist))

    # seria usado caso a geracao de imagem fosse aplicada
    def removeAresta(self, vertice1, vertice2):
        self.matrizAdj[vertice1 - 1][vertice2 - 1] = self.matrizAdj[vertice2 - 1][vertice1 - 1] = None
        self.atualizaArestas()

    # secao
    def marcaSecao(self, secao, tipo):
        marca = int()
        if tipo == 'inativo':
            marca = -1
        elif tipo == 'ativo':
            marca = 0
        elif tipo == 'visitado':
            marca = 1

        # altera o status de todos os vertices da secao
        for vertice in self.secoes[secao - 1]:
            self.vertices[vertice - 1]['status'] = marca

        self.statusSecao[secao - 1] = marca

    # procura vertice de menor distancia em uma secao
    def distVerticeSecao(self, vertice, secao):
        distancia = inf
        viz = int()
        for v in self.secoes[secao - 1]:
            d = self.dist2vertices(vertice, v, coord=False)
            if d < distancia:
                distancia = d
                viz = v

        return {'distancia': distancia, 'vertice': viz}

    # retorna a lista de secoes mais proximas de uma determinada secao
    def secoesMaisProximas(self, secao):
        dados = {}

        for vertice in self.secoes[secao - 1]:
            secoes = {}
            for s in range(0, len(self.secoes)):
                if s + 1 != secao:
                    dist = self.distVerticeSecao(vertice, s + 1)

                    if secoes.get(s + 1) is None or secoes[s + 1] > dist[0]:
                        secoes[s + 1] = dist['distancia']

                        par = {'secao': s + 1, 'vertice': vertice}

                        if dados.get(dist['distancia']) is None:
                            dados[dist['distancia']] = [par]
                        else:
                            dados[dist['distancia']].append(par)

        retorno = []
        for dist in sorted(dados.keys()):
            for s in dados[dist]:
                if not s in retorno:
                    retorno.append(s)

        return retorno

    # FUNCAO PRINCIPAL
    # atualiza distancia percorrida por um veiculo
    def atualizaDistancia(self, num_veic):
        dist = 0
        for i in range(0, len(self.veiculos[num_veic]['vertices'])-1):
            dist += self.dist2vertices(self.veiculos[num_veic]['vertices'][i], self.veiculos[num_veic]['vertices'][i+1], coord=False)
        self.veiculos[num_veic]['distancia'] = dist

    # calcula recursivamente a rota de um veiculo (rota pode ser alterada posteriormente)
    def obtemRotaParcial(self, num_veic, carga_ideal=True):
        carga_de_calculo = self.dados['CAPACITY'] if not carga_ideal else self.cargaIdeal

        vertice = self.veiculos[num_veic]['vertices'][-1]
        melhorvizinho = self.obtemMelhorVizinho(vertice, num_veic, carga_ideal)

        if melhorvizinho['vertice'] is not None:
            self.marcaSecao(melhorvizinho['secao'], 'visitado')

            if melhorvizinho['demanda'] + self.veiculos[num_veic]['carga'] <= carga_de_calculo:
                self.veiculos[num_veic]['distancia'] += melhorvizinho['distancia']
                self.veiculos[num_veic]['carga'] += melhorvizinho['demanda']
                self.veiculos[num_veic]['secoes'].append(melhorvizinho['secao'])
                self.veiculos[num_veic]['vertices'].append(melhorvizinho['vertice'])

            self.obtemRotaParcial(num_veic, carga_ideal)
        else:
            self.veiculos[num_veic]['vertices'].append(1)
            self.veiculos[num_veic]['distancia'] += self.distanciaCentro(vertice)

            # percorre status das secoes procurando marcados como visitados e verifica se participa da rota do veiculo
            for secao, status in enumerate(self.statusSecao):
                if status == 1:  # se secao marcada como visitado (==1)
                    if secao + 1 in self.veiculos[num_veic]['secoes']:  # se pertence ao caminho
                        self.marcaSecao(secao + 1, 'inativo')
                    else:
                        self.marcaSecao(secao + 1, 'ativo')

    def obtemRotas(self, cargaIdeal=True):
        # rotas parciais de cada veiculo
        for num in range(0, self.dados['VEHICLES']):
            self.obtemRotaParcial(num, cargaIdeal)

        secoes_nao_visitadas = [secao + 1 for secao, status in enumerate(self.statusSecao) if status == 0] # [4, 3, 2, 5]

        # enquanto houver secoes nao visitadas
        while len(secoes_nao_visitadas) > 0:

            secaoProxima = self.secoesMaisProximas(secoes_nao_visitadas[0])  # [6] lista de secoes proximas ordenadas por distancia
            secaoIncluida = False
            num_veic = 0

            # enquanto houver secoes proximas e a secao nao visitada nao foi incluida em uma rota
            while len(secaoProxima) > 0 and not secaoIncluida:
                # se secao proxima for secao nao visitada, retira da lista
                while secaoProxima[0]['secao'] in secoes_nao_visitadas:
                    secaoProxima.pop(0)

                # se a secao proxima pertencer a rota do veiculo
                if secaoProxima[0]['secao'] in self.veiculos[num_veic]['secoes']:

                    if self.veiculos[num_veic]['carga'] + self.demandaPorSecao[secoes_nao_visitadas[0] - 1] > self.dados['CAPACITY']:
                        secaoProxima.pop(0)
                    else:
                        indice = self.veiculos[num_veic]['secoes'].index(secaoProxima[0]['secao'])

                        # calcula distancias para saber se insercao de visita deve ser antes ou apos a secao mais proxima
                        d1 = self.dist2vertices(self.veiculos[num_veic]['vertices'][indice - 1], secaoProxima[0]['vertice'], coord=False)
                        d2 = self.dist2vertices(self.veiculos[num_veic]['vertices'][indice + 1], secaoProxima[0]['vertice'], coord=False)

                        if d2 < d1:
                            indice += 1

                        self.veiculos[num_veic]['secoes'].insert(indice, secoes_nao_visitadas[0])
                        self.veiculos[num_veic]['vertices'].insert(indice, secaoProxima[0]['vertice'])
                        self.veiculos[num_veic]['carga'] += self.demandaPorSecao[secoes_nao_visitadas[0] - 1]
                        self.atualizaDistancia(num_veic)
                        self.marcaSecao(secoes_nao_visitadas[0], 'inativo')
                        secoes_nao_visitadas.pop(0)
                        secaoIncluida = True
                else:
                    num_veic = num_veic + 1
                    if num_veic == self.dados['VEHICLES']:
                        num_veic = 0
                        secaoProxima.pop(0)

    def retornaDistanciaTotal(self):
        dist = 0
        for v in self.veiculos:
            dist += v['distancia']
        return dist

    # escreve os resultados em um arquivo de saida
    def escreverResultados(self, arqSaida, distancia, tempo, arqSol):
        if not path.exists(arqSaida):
            arq = open(arqSaida, 'w')
            arq.close()

        arq = open(arqSaida, 'r')
        conteudo = arq.readlines()
        arq.close()
        conteudo.append(f'{self.file} {distancia} {tempo}\n')

        arq = open(arqSaida, 'w')
        arq.writelines(conteudo)
        arq.close()

        if arqSol is not None:
            arq = open(arqSol, 'w')
            conteudo = []
            for veiculo in self.veiculos:
                rota = ''
                vertices = veiculo['vertices'].copy()
                vertices.pop(-1)
                for v in vertices:
                    rota += f'{v} '
                conteudo.append(f'{rota.strip()}\n')
            arq.writelines(conteudo)
            arq.close()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-in', '--input', help='Arquivo de entrada')
    parser.add_argument('-out', '--output', help='Arquivo de saída')
    parser.add_argument('-sol', help='Rotas da solução')

    args = parser.parse_args()
    entrada = args.input
    saida = args.output
    solucao = args.sol

    if entrada is None:
        print('Arquivo inexistente')
        exit()

    G = Problema(entrada)
    t1 = time.time()
    G.obtemRotas()
    t2 = time.time()
    tempoExec = str(float(t2 - t1))
    distancia = G.retornaDistanciaTotal()

    G.escreverResultados(saida, distancia, tempoExec, solucao)


main()