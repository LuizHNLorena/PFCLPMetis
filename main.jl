# Decomente a linha abaixo para instalar os pacotes
#using Pkg; Pkg.add(["Metis","LightGraphs","GraphPlot", "Colors"])

using Metis, LightGraphs, GraphPlot, Colors

# Cria um grafo
g = LightGraphs.smallgraph(:tutte)
nodelabel = 1:nv(g)

# Faz plot inicial
p1 = gplot(g, nodelabel=nodelabel)
display(p1)

# Executa o METIS
k = 2
partition = Metis.partition(g, k, alg = :KWAY)

# Faz o plot do grafo
nodecolor = distinguishable_colors(k, colorant"blue")
nodefillc = nodecolor[partition]
p2 = gplot(g, nodefillc=nodefillc, nodelabel=nodelabel, nodelabeldist=1.8, nodelabelangleoffset=π/4)
display(p2)