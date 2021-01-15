//
//  ContentView.swift
//  GRosay-CV
//
//  Created by Gaspard Rosay on 06.10.19.
//  Copyright © 2019 Gaspard Rosay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var skills: [Skill] = skillsData
    var projects: [Project] = projectsData
    var body: some View {
        NavigationView{
            ScrollView {
                Header()
                AboutMe()
                Text("skills_title")
                    .font(.headline)
                    .padding(.bottom, 15)
                ForEach(skills){ skill in
                    HStack{
                        Image(systemName: skill.skillIcon)
                            .frame(width:50.0)
                        VStack(alignment: .leading){
                            Text(skill.skillName)
                                .font(.body)
                            Text(skill.desc)
                                .font(.caption)
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width - 10)
                .padding(.bottom, 50)
                
                Text("works_title")
                    .font(.headline)
                List(projects){ project in
                    NavigationLink(destination: ProjectDetails(project: project)){
                        Image(project.gImageName).resizable()
                            .scaledToFit()
                            .frame(width:50.0, height:50.0)
                            .cornerRadius(5.0)
                        VStack(alignment: .leading){
                            Text(project.gName)
                                .font(.body)
                            Text(project.gSubtitle)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height:400.0)
                .padding(.bottom, 50)
            }
        }
        .navigationBarTitle(Text("Gaspard Rosay"), displayMode: .inline)
    }
}

struct Header: View {
    var body: some View {
        Group(){
            Image("back")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 0.0, maxHeight: 450.0)
                .padding(.top, -150)
            Text("Gaspard ROSAY")
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .padding(.top, -170)
            Text("full_stack")
                .font(.headline)
                .foregroundColor(Color.white)
                .padding(.top, -130)
            Image("face").resizable()
                .scaledToFit()
                .frame(width: 150, height: 150.0)
                .cornerRadius(90.0)
                .padding(.top, -95)
        }
    }
}

struct AboutMe: View{
    var body: some View {
        VStack(){
            Text("about_me")
                .font(.headline)
                .padding(.bottom, 30)
            
            Text("about_me_full")
                .font(.body)
                .fontWeight(.medium)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .frame(width: UIScreen.main.bounds.width - 10)
                .fixedSize(horizontal: false, vertical: true)
            
        }
        .padding(.bottom, 50)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().colorScheme(.light)
                .environment(\.locale, Locale(identifier: "en"))
            ContentView().colorScheme(.light)
                .environment(\.locale, Locale(identifier: "fr"))
        }
    }
}
#endif
