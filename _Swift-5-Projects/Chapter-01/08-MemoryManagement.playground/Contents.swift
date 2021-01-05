// BREAKING CYCLES

// A CYCLE:
do {
    
    class Owner {
        var owned : Owned
        init(_ owned : Owned) {
            self.owned = owned
        }
    }
    
    class Owned {
        var owner : Owner?
    }
    
    let ownedProperty = Owned()
    let _ = Owner(ownedProperty) // dependency cycle

}

// USING WEAK OR UNOWNED

    class Owner {
        var owned : Owned
        init(_ owned : Owned) {
            self.owned = owned
        }
    }
    
    class Owned {
        weak var owner : Owner?
        //  unowned var owner : Owner?
    }
    
    let ownedProperty = Owned()
    let _ = Owner(ownedProperty) // dependency cycle


class LazyStruct {

    var delegate : Owner?
    
    lazy var someClosure: (Int, String) -> String = {
        [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
        
        return "OK"
    }

}
