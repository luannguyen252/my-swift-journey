import Foundation

struct AlertItem: Identifiable {
    enum AlertItemType {
        case newGame, finishedGame
    }
    
    let id: AlertItemType
}
