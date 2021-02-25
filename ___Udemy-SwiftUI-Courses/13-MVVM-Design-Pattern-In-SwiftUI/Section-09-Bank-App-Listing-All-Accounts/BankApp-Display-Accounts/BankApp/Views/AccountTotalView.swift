//
//  AccountTotalView.swift
//  BankApp
//
//  Created by Mohammad Azam on 8/9/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct AccountTotalView: View {
    
    let total: Double
    
    var body: some View {
        Text("\(total)")
    }
}

struct AccountTotalView_Previews: PreviewProvider {
    static var previews: some View {
        AccountTotalView(total: 250)
    }
}
