/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The app's navigation with a configuration that offers a sidebar, content list, and detail pane.
*/

import SwiftUI

struct AppSidebarNavigation: View {

    enum NavigationItem {
        case menu
        case favorites
        case recipes
    }

    @EnvironmentObject private var model: FrutaModel
    @State private var selection: NavigationItem? = .menu
    @State private var presentingRewards = false
    
    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: SmoothieMenu(), tag: NavigationItem.menu, selection: $selection) {
                Label("Menu", systemImage: "list.bullet")
            }
            .tag(NavigationItem.menu)
            
            NavigationLink(destination: FavoriteSmoothies(), tag: NavigationItem.favorites, selection: $selection) {
                Label("Favorites", systemImage: "heart")
            }
            .tag(NavigationItem.favorites)
        
            NavigationLink(destination: RecipeList(), tag: NavigationItem.recipes, selection: $selection) {
                Label("Recipes", systemImage: "book.closed")
            }
            .tag(NavigationItem.recipes)
        }
        .overlay(Pocket(presentingRewards: $presentingRewards), alignment: .bottom)
        .listStyle(SidebarListStyle())
    }
    
    var body: some View {
        NavigationView {
            sidebar
            
            Text("Select a category")
                .foregroundColor(.secondary)
            
            Text("Select a smoothie")
                .foregroundColor(.secondary)
                .toolbar {
                    SmoothieFavoriteButton(smoothie: nil)
                        .disabled(true)
                }
        }
    }
    
    struct Pocket: View {
        @Binding var presentingRewards: Bool
        
        @EnvironmentObject private var model: FrutaModel
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                Button(action: { presentingRewards = true }) {
                    Label("Rewards", systemImage: "seal")
                        .padding(6)
                        .contentShape(Rectangle())
                }
                .accessibility(label: Text("Rewards"))
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .buttonStyle(PlainButtonStyle())
            }
            .sheet(isPresented: $presentingRewards) {
                #if os(iOS)
                RewardsView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: { presentingRewards = false }) {
                                Text("Done")
                            }
                        }
                    }
                    .environmentObject(model)
                #else
                VStack(spacing: 0) {
                    RewardsView()
                    Divider()
                    HStack {
                        Spacer()
                        Button(action: { presentingRewards = false }) {
                            Text("Done")
                        }
                        .keyboardShortcut(.defaultAction)
                    }
                    .padding()
                    .background(VisualEffectBlur())
                }
                .frame(minWidth: 400, maxWidth: 600, minHeight: 400, maxHeight: 600)
                .environmentObject(model)
                #endif
            }
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
            .environmentObject(FrutaModel())
    }
}

struct AppSidebarNavigation_Pocket_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation.Pocket(presentingRewards: .constant(false))
            .environmentObject(FrutaModel())
            .frame(width: 300)
    }
}
