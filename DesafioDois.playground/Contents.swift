import UIKit

protocol Impressora {
    func imprimir()
}


class Pessoa {

    var nome: String
    var idade: Int
    var endereco: Endereco
    
    init(nome: String, idade: Int, endereco: Endereco) {
        self.nome = nome
        self.idade = idade
        self.endereco = endereco
    }
    
    func getNome() {
        print(self.nome)
    }
}


class Endereco {
    
    var cidade: String
    var cep: String
    var estado: Estado?
    var pais: Pais
    var rua: String
    var numero: String
    
    init(cidade: String, cep: String, estado: Estado?, rua: String, numero: String, pais: Pais) {
        self.cidade = cidade
        self.cep = cep
        self.estado = estado
        self.rua = rua
        self.numero = numero
        self.pais = pais
    }
    
}

class Pais {
    var nome: String
    
    init(nome: String) {
        self.nome = nome
    }
    
    convenience init() {
        self.init(nome: "Brasil")
    }
}


class Estado {
    var nome: String
    
    init?(nome: String) {
        if nome.isEmpty {
            print("Nome do Estado nao foi informado")
            return nil
        }
        self.nome = nome
    }
}

struct Pedido: Impressora {
   
    let produto: String
    let valor: Double
    var number: Int
    
    func getNextNumber() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    mutating func setPedNumber(numero: Int) {
        var pedNumber = getNextNumber()
        self.number = pedNumber(numero)
    }

    func imprimir() {
        print("imprimindo pedido \(self.number)")
    }
}

class Vendedor: Pessoa {
    private var empresa: String?
    private var vendas: [Pedido]?
    
    func setEmpresa(empresa: String) {
        self.empresa = empresa
    }
    
    func setVendas(item: Pedido) {
        self.vendas?.append(item)
    }
    
    func getVendas() -> [Pedido] {
        return self.vendas ?? []
    }
    
    override func getNome() {
        print("O nome do vendedor é: \(self.nome)")
    }
}

let pais = Pais()
let estado = Estado(nome: "")

let endereco = Endereco(cidade: "MonteCity", cep: "38.500-000", estado: estado, rua: "XPTO", numero: "999", pais: pais)
var vendedor = Vendedor(nome: "Joao das Couves", idade: 84, endereco: endereco)
vendedor.setEmpresa(empresa: "DIO")

let ped1 = Pedido(produto: "Abobora", valor: 10, number: 0)
let ped2 = Pedido(produto: "Carne", valor: 11, number: 1)
vendedor.setVendas(item: ped1)
vendedor.setVendas(item: ped2)

print("Nome: \(vendedor.nome) ")
print("Idade: \(vendedor.idade) ")
print("Estado: \(vendedor.endereco.estado?.nome ?? "N/A") ")
print("CEP: \(vendedor.endereco.cep) ")
print("Cidade: \(vendedor.endereco.cidade) ")
print("Rua: \(vendedor.endereco.rua) ")
print("Numero: \(vendedor.endereco.numero) ")
print("Pais: \(vendedor.endereco.pais.nome) ")

for item in vendedor.getVendas() {
    print("Valor do item \(item.produto): \(item.valor)")
}





