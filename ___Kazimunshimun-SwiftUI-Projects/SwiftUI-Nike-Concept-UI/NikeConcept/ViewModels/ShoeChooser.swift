//
//  ShoeChooser.swift
//  NikeConcept
//
//  Created by Anik on 6/11/20.
//

import SwiftUI

class ShoeChooser: ObservableObject {
    @Published var shoes = Data.shoes
    @Published var favorites: [ShoeItem] = []
    
    func chooseShoes(for menuIndex: Int) {
        var indices: [Int] = []
        
        switch menuIndex {
        case 0:
            indices = [0, 1, 2, 3, 4, 5, 6]
        case 1:
            indices = [6, 4, 3, 1, 5]
        case 2:
            indices = [4, 3, 2, 5, 6]
        default:
            indices = [0, 1, 2, 3, 4, 5, 6]
        }
        
        populateShoeArray(indices: indices)
    }
    
    func populateShoeArray(indices: [Int]) {
        var shoeArray: [ShoeItem] = []
        
        for index in indices {
            shoeArray.append(Data.shoes[index])
        }
        
        shoes = shoeArray
    }
    
    func addToFavorite(shoe: ShoeItem) {
        if !favorites.contains(where: { $0.id == shoe.id }) {
            favorites.append(shoe)
        }
    }
    
    func endSwipeWithFavorite(shoe: ShoeItem) {
        if let shoeIndex = shoes.firstIndex(where: { shoe.id == $0.id }) {
            addToFavorite(shoe: shoe)
            removeShoeFromDeck(index: shoeIndex)
        }
    }
    
    func endSwipeWithDelete(shoe: ShoeItem) {
        if let shoeIndex = shoes.firstIndex(where: { shoe.id == $0.id }) {
            removeShoeFromDeck(index: shoeIndex)
        }
    }
    
    func removeShoeFromDeck(index: Int) {
        if shoes.count == 1 {
            shoes = Data.shoes.shuffled()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.shoes.remove(at: index)
        }
    }
}
