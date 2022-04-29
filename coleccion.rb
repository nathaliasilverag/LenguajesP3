#Clase coleccion 
#Contiene las operaciones de la lista de adyacencias
class Coleccion
    attr_accessor :list

    def initialize(*args)
        @list = args
    end
  
    def agregar(x)
        @list.append(x)
    end

    def remover
        @list.pop()
    end

    def vacio
        @list.empty?
    end

    def to_s
        puts "#{@list}"
        "#{@list}"
    end
end

#Clase Pila
#se define el metodo de eliminacion de pila
#con la lista de adyacencia definida.
#Se usa herencia para crear la clase pila y cola
class Pila < Coleccion
    def remover()
        @list.pop()
    end
end

#Clase Cola
#Se define el metodo de eliminacion de cola
#sobre la lista de adyacencias
class Cola < Coleccion
    def remover()
        @list.shift()
    end
end

