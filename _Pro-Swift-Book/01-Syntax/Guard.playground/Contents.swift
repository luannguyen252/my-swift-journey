import UIKit

/**
    “guard lets you exit any scope if preconditions fail, not just functions and methods.
    This means you can exit a switch block or a loop by using guard, and it
    carries the same meaning: the contents of this scope should only be executed
    if these preconditions are true.”
 
        - Excerpt From: Paul Hudson. “Pro Swift."
 */
for i in 0...100 {
    guard i % 8 == 0 else { continue }
    
    print(i)
}


/// 🔑 Of course, we could also use `where` for the above functionality 😛
for i in 0...100 where i % 8 == 0 {
    print(i)
}
