//
//  Balance.swift
//  Chapter09
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import SwiftUI

struct Balance: View {
    @Binding var amount: Double
    
    init(_ amount: Binding<Double>) {
        self._amount = amount
    }
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.rectangle.fill")
            Text("Balance : \(amount)")
        }
    }
}

struct ShowBalance: View {
    @State private var amount: Double
    
    init(_ amount: Double = 0.0) {
        self._amount = State(initialValue: amount)
    }
    
    var body: some View {
        //Balance(amount: 1234.56)
        Balance($amount)
        .font(.largeTitle)
    }
}

struct Balance_Previews: PreviewProvider {
    static var previews: some View {
        ShowBalance(1234.56)
    }
}
