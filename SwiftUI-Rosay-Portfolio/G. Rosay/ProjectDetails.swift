//
//  ProjectDetails.swift
//  G. Rosay
//
//  Created by Gaspard Rosay on 06.10.19.
//  Copyright © 2019 Gaspard Rosay. All rights reserved.
//

import SwiftUI

struct ProjectDetails: View {
    let project: Project
    var body: some View {
        
        ScrollView{
            Image(project.gImageName)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 0.0, maxHeight: 450.0)
                .padding(.bottom, 20.0)
                .padding(.top, 0)
            Text(project.gName)
                .font(.title)
            Text(project.gSubtitle)
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width - 10)
                .padding(.bottom, 50.0)
            VStack{
            Text(project.gDesc)
                .frame(width: UIScreen.main.bounds.width - 10)
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(nil)
            }
            
         }
        .navigationBarTitle(Text(project.gName), displayMode: .inline)
    }
}

struct ProjectDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetails(project: projectsData[0])
    }
}
