//
//  CandyView.swift
//  CoreDataProject
//
//  Created by Sandesh on 15/11/20.
//  Copyright © 2020 devsandesh. All rights reserved.
//

import SwiftUI

struct CandyView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            
            Button("Add") {
                let candy1 = Candy(context: self.moc)
                candy1.name = "Alphenliebel"
                candy1.origin = Country(context: self.moc)
                candy1.origin?.shortName = "IND"
                candy1.origin?.fullName = "India"
                
                let candy2 = Candy(context: self.moc)
                candy2.name = "Rock Made"
                candy2.origin = Country(context: self.moc)
                candy2.origin?.shortName = "AUS"
                candy2.origin?.fullName = "Austrailia"
                
                let candy3 = Candy(context: self.moc)
                candy3.name = "Tango Mint"
                candy3.origin = Country(context: self.moc)
                candy3.origin?.shortName = "IND"
                candy3.origin?.fullName = "India"
                
                let candy4 = Candy(context: self.moc)
                candy4.name = "Mars"
                candy4.origin = Country(context: self.moc)
                candy4.origin?.shortName = "UK"
                candy4.origin?.fullName = "United Kingdom"
                
                try? self.moc.save()
            }
            
        }
    
    }
}

struct Candy_Previews: PreviewProvider {
    static var previews: some View {
        CandyView()
    }
}
