# Ejercicio 1 Parcial 3
# Nathalia Silvera 12-10921

require './coleccion'

# Clase para la lista de adyacencia
class ListaAdyacencia
    attr_accessor :list
    #metodo initialize para la lista
    def initialize(n=0)
        @list = Hash.new
        if not n==0
            for i in 1..n
                @list[i]=[]
            end
        end
    end
    #metodo para agregar un nodo a la lista de adyacencias
    def agregar_nodo(nodo)
        @list[nodo]=[]
    end
    #metodo para agregar un adyacente 
    def agregar_adyacente(nodo, x)
        @list[nodo].append(x)
    end
    #metodo para vaciar la lista
    def vacio
        @list.empty?
    end
    #metodo to_s de ruby para retornar la lista como un string
    def to_s
        puts "#{@list}"
        "#{@list}"
    end

end

#clase para buscar en la lista de adyacencia 
class Busqueda
    attr_accessor :lista_adyacencia

    def initialize(lista_adyacencia={})

        if lista_adyacencia.is_a?(ListaAdyacencia)
            @lista_adyacencia = lista_adyacencia.list
        else
            @lista_adyacencia = {}
        end
    end

    def buscar(d,h,coleccion=Pila)

        puts "#{coleccion}:"
        if @lista_adyacencia[d].empty? or @lista_adyacencia[h].empty?
            return -1
        end

        count=0
        por_revisar=coleccion.new(@lista_adyacencia[d])
        revisado=[]
        adyacente=1
        while not por_revisar.vacio
            lista=por_revisar.remover
            adyacentes=coleccion.new(*lista)
            while not adyacentes.vacio
                adyacente = adyacentes.remover
                count = count + 1
                if adyacente == h
                    break
                else
                    if not revisado.include?(@lista_adyacencia[adyacente])
                        por_revisar.agregar(@lista_adyacencia[adyacente])
                    end
                end
            end
            revisado.append(lista)
        end
        
        if adyacente == h
            return count
        else
            return -1
        end
    end
end

class DFS < Busqueda

    def buscar(d,h)
        super(d,h,Pila)
    end
end

class BFS < Busqueda

    def buscar(d,h)
        super(d,h,Cola)
    end
end

# Ejemplo

lista_adyacencia = ListaAdyacencia.new(6)
lista_adyacencia.agregar_adyacente(1,2)
lista_adyacencia.agregar_adyacente(2,1)
lista_adyacencia.agregar_adyacente(2,3)
lista_adyacencia.agregar_adyacente(2,4)
lista_adyacencia.agregar_adyacente(3,5)
lista_adyacencia.agregar_adyacente(4,2)
lista_adyacencia.agregar_adyacente(5,3)
lista_adyacencia.agregar_adyacente(5,4)
puts "Ejemplo"
puts "DFS"
dfs=DFS.new(lista_adyacencia)
dfs.lista_adyacencia
x=dfs.buscar(1,3)
puts "#{x}"

puts "------------"
puts "BFS"
bfs=BFS.new(lista_adyacencia)
bfs.lista_adyacencia
x=bfs.buscar(1,3)
puts "#{x}"