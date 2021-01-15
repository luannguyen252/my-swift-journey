//
//  UserUpdatesListView.swift
//  DesignCode
//
//  Created by Brian Sipple on 9/26/19.
//  Copyright © 2019 CypherPoet. All rights reserved.
//

import SwiftUI


struct UserUpdatesListView: View {
    @EnvironmentObject var updatesStore: UserUpdatesStore
    @State private var isShowingSettingsView = false
    
    var body: some View {
        List {
            ForEach(updatesStore.updates.indexed(), id: \.1.id) { index, update in
                NavigationLink(
                    destination: UserUpdateDetailView(userUpdate: self.$updatesStore.updates[index]
                )) {
                    Image(update.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(4)
                        .frame(width: 80, height: 80)
                        .background(Color("background"))
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(update.title)
                            .font(.headline)
                        Text(update.bodyText)
                            .font(.subheadline)
                            .lineLimit(2)
                        Text(update.formattedDate)
                            .font(.caption)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .onDelete(perform: deleteUserUpdate)
            .onMove(perform: moveUserUpdate)
        }
        .navigationBarTitle("Updates")
        .navigationBarItems(
            leading: EditButton(),
            trailing: Button(action: {
                self.addUserUpdate()
            }) {
                Image(systemName: "plus")
                    .imageScale(.large)
            }
        )
        .sheet(isPresented: $isShowingSettingsView) {
            Text("Settings")
        }
    }
}


// MARK: - Private Helpers
private extension UserUpdatesListView {
    
    func addUserUpdate() {
        updatesStore.updates.append(UserUpdate(
            title: "New Update",
            bodyText: "⚡️⚡️⚡️⚡️⚡️⚡️⚡️",
            date: Date(),
            imageName: "Background"
        ))
    }
    
    
    func deleteUserUpdate(at offsets: IndexSet) {
        updatesStore.updates.remove(atOffsets: offsets)
    }
    
    
    func moveUserUpdate(from sourceOffset: IndexSet, to destinationIndex: Int) {
        updatesStore.updates.move(fromOffsets: sourceOffset, toOffset: destinationIndex)
    }
}


struct UpdateListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserUpdatesListView()
                .environmentObject(UserUpdatesStore())
        }
    }
}
