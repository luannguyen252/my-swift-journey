//
//  DetailView.swift
//  scrumdinger
//
//  Created by An Trinh on 21/12/20.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @State private var isPresented = false
    
    @State private var isScrumming = false
    
    var body: some View {
        List {
            Section {
                CardView(scrum: scrum)
                HStack {
                    Spacer()
                    Button(action: {
                        isScrumming = true
                    }) {
                        Text("Start Meeting")
                            .font(Font.title3.bold())
                            .foregroundColor(.accentColor)
                            .padding()
                    }
                    Spacer()
                }
            }
            Section {
                ForEach(scrum.attendees, id:\.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
            .accentColor(.gray)
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    NavigationLink(destination: HistoryView(history: history)) {
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            }
            .accentColor(.gray)
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
            data = scrum.data
        }) {
            Image(systemName: "gearshape.fill")
                .font(Font.body.weight(.semibold))
                .padding(7)
                .background(RoundedRectangle(cornerRadius: 9)
                                .foregroundColor(Color.accentColor.lighterColor))
        })
        .navigationTitle(scrum.title)
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle("Edit Scrum")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Save") {
                        isPresented = false
                        scrum.update(from: data)
                    })
            }
        }
        .background(EmptyView()
                        .fullScreenCover(isPresented: $isScrumming) {
                            MeetingView(scrum: $scrum) {
                                isScrumming = false
                            }
                        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.data[0]))
        }
    }
}
