//
//  ScrumsView.swift
//  scrumdinger
//
//  Created by An Trinh on 20/12/20.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresented = false
    @State private var newScrumData = DailyScrum.Data()
    
    let saveAction: () -> Void
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                Section {
                    NavigationLink(destination: DetailView(scrum: binding(for: scrum))) {
                        CardView(scrum: scrum)
                    }
                }
            }
            .onDelete { indicies in
                scrums.remove(atOffsets: indicies)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Scrumdinger")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }) {
            Image(systemName: "plus")
                .font(Font.body.weight(.heavy))
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 9)
                                .foregroundColor(Color.accentColor.lighterColor))
        })
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $newScrumData)
                    .navigationTitle("New Scrum")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Add") {
                        let newScrum = DailyScrum(title: newScrumData.title, attendees: newScrumData.attendees, lengthInMinutes: Int(newScrumData.lengthInMinutes), color: newScrumData.color)
                        scrums.append(newScrum)
                        isPresented = false
                        newScrumData = DailyScrum.Data()
                    })
            }
        }
        .onChange(of: scenePhase, perform: { phase in
            if phase == .inactive {
                saveAction()
            }
        })
    }
    
    private func binding(for scrum: DailyScrum) -> Binding<DailyScrum> {
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("Can't find scrums array")
        }
        return $scrums[scrumIndex]
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.data), saveAction: { })
        }
    }
}
