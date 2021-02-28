import Foundation

class Shop: ObservableObject {
  @Published var showingProduct     : Bool = false
  @Published var selectedProduct    : Product? //= nil 
}
