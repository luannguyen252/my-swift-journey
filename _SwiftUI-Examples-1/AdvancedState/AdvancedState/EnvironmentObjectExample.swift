//
//  EnvironmentObjectExample.swift
//  AdvancedState
//
//  Created by kim sunchul on 2020/05/19.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

//전반적인 데이터 공유할때 쓰는 프로퍼티 wrapper이며, 부모에게 해당 워래퍼가 있어야 사용가능.
struct EnvironmentObjectExample: View {
    @EnvironmentObject var settings:UserSettings
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.settings.score += 1
                }) {
                    Text("Increase Score")
                }
                NavigationLink(destination: DetailView()) {
                    Text("Show Detail View")
                }
            }
        }
    }
}

struct DetailView: View {
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        // A text view that reads from the environment settings
        Text("Score: \(settings.score)")
    }
}

struct EnvironmentObjectExample_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectExample()
    }
}
