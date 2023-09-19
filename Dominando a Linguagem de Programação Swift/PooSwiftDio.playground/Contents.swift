import UIKit

var greeting = "Hello, playground"

enum PayMethod {
    case cash
    case credit
    case debit
    
    var description: String {
          switch self {
          case .credit:
              return "Crédito"
          case .debit:
              return "Débito"
          case .cash:
              return "Dinheiro"
          }
      }
}

class Product {
    
    private var name: String = ""
    private var price: Double = 0.0
    private var category: String = ""

    init(name: String, price: Double, category: String) {
        self.name = name
        self.price = price
        self.category = category
    }
    
    func buyProduct(withPay: PayMethod, finance: Int? = nil)  {
        
        var message = """
                   Obrigado por realizar a compra, segue a nota fiscal
                   =================
                   Produto: \(name)
                   Preço: \(String(format: "%.2f", price))
                   Categoria: \(category)
                   Forma de Pagamento: \(withPay.description)
                   """

               if withPay == .credit, let finance = finance {
                   message += "\nParcelamento: \(finance)"
               }

               message += "\n================="

               print(message)
    }
    
  
    
}

let apple = Product(name: "Apple", price: 5.00, category: "Food")
let playstation = Product(name: "PS5", price: 3.800, category: "Eletronic")

playstation.buyProduct(withPay: .credit, finance: 2)
apple.buyProduct(withPay: .cash)
