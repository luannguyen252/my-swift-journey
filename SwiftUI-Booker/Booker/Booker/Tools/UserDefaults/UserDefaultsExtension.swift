import UIKit

extension UserDefaults {
    func get<Value: UserDefaultConvertible>(_ typedKey: UserDefaultTypedKey<Value>) -> Value? {
        guard let object = object(forKey: typedKey.key),
            let value = Value(with: object) else { return nil }
        return value
    }
    
    func set<Value: UserDefaultConvertible>(_ value: Value, forKey typedKey: UserDefaultTypedKey<Value>) {
        if let object = value.object() {
            set(object, forKey: typedKey.key)
        }else {
            removeSuite(named: typedKey.key)
        }
    }
    
    func register<Value: UserDefaultConvertible>(_ value: Value, forKey typedKey: UserDefaultTypedKey<Value>) {
        guard let object = value.object() else { return }
        register(defaults: [typedKey.key: object])
    }
}
