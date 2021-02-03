//
//  BookLessonActivationView.swift
//  newxcode
//
//  Created by Sergey Sevriugin on 11/09/20.
//

import SwiftUI

struct BookLessonActivationView: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        Text("Book a lesson")
            .font(.title3)
            .padding(.leading,  30)
            .frame(width: 300, height: 60, alignment: .leading)
            .background(Color.white)
            .shadow(radius: 10)
            .position(x: 190 + userData.offset, y: 100 + (userData.showSideMenu ? 28 : 0))
    }
}

struct BookLessonActivationView_Previews: PreviewProvider {
    static var previews: some View {
        BookLessonActivationView().environmentObject(UserData()).previewLayout(.fixed(width: 400, height: 200))
    }
}
