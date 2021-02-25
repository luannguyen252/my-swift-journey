let app = require("./server.js")
let uuidv4 = require("./uuidv4.js")

class Account {
  
  constructor(name, accountType, balance) {
    this.id = ""
    this.name = name 
    this.accountType = accountType 
    this.balance = balance 
  }
  
  transfer(toAccount, amount, completion) {
    
    if((this.balance - amount) < 0) {
      completion(false, "Insufficient funds!")
      return 
    }
    
    this.withdraw(amount)
    toAccount.deposit(amount)
    completion(true)
    
  }
  
  deposit(amount) {
    this.balance += amount 
  }
  
  withdraw(amount) {
    this.balance -= amount 
  }
  
  
  save(completion) {
    
    // check if the user already has the same type of account 
    const account = this.getAccountByNameAndType(this.name, this.accountType)
    if(!account) {
      this.id = uuidv4() 
      completion(this)
    } else {
      completion(null, 'User already has this type of account')
    }
    
  }
  
  getAccountByNameAndType(name, type) {
    return app.accounts.find(account => account.name == name && account.accountType == type)
  }
  
}

module.exports = Account 