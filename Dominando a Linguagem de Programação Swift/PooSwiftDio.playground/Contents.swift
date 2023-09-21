import UIKit


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
    
     var name: String = ""
     var price: Double = 0.0
     var category: String = ""

    init(name: String, price: Double, category: String) {
        self.name = name
        self.price = price
        self.category = category
    }
    
}

protocol PayMethodProtocol {
    func buyProduct(selectedProduct: Product, withPay: PayMethod, finance: Int?)
}

class Person: PayMethodProtocol {
    
    private var name: String = ""
    private var age: Int = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
       }
    
    func buyProduct(selectedProduct: Product, withPay: PayMethod, finance: Int? = nil) {
        
        let priceString = String(selectedProduct.price).replacingOccurrences(of: ".", with: ",")
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .decimal
        let formatedPrice = formatter.number(from: priceString)?.doubleValue
      
        if let formated = formatedPrice {
            var message = """
                       Obrigado por realizar a compra, segue a nota fiscal
                       =================
                       Produto: \(selectedProduct.name)
                       Preço: \(formated)
                       Categoria: \(selectedProduct.category)
                       Forma de Pagamento: \(withPay.description)
                       """

                   if withPay == .credit, let finance = finance {
                       message += "\nParcelamento: \(finance)"
                   }

                   message += "\n================="

                   print(message)
        }
     
    }
    
    
}

let apple = Product(name: "Apple", price: 5.00, category: "Food")
let oranges = Product(name: "Oranges", price: 10.00, category: "Food")
let person = Person(name: "Robson Moreira", age: 18)

person.buyProduct(selectedProduct: apple, withPay: .cash)
person.buyProduct(selectedProduct: oranges, withPay: .credit, finance: 2)
