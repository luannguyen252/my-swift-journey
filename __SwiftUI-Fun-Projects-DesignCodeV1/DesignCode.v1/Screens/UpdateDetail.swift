//
//  UpdateDetail.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/30/20.
//

import SwiftUI

struct UpdateDetail: View {
    
    // strictly for previewing
    var update: lesson = lessons[1]
    
    var body: some View {
        
        // Having a List includes the ScrollView function
        List {
            VStack{
                
                update.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(update.detail)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    
                
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(PlainListStyle())
        
    
       
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
