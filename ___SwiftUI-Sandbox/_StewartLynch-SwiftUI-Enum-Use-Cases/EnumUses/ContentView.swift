//
//  ContentView.swift
//  EnumUses
//
//  Created by Stewart Lynch on 2021-02-16.
//

import SwiftUI

struct ContentView: View {
    @State private var resources = Resource.starterResources
    @State private var modalType: ModalType? = nil
    var body: some View {
        NavigationView {
            List {
                ForEach(resources) { resource in
                    HStack {
                        resourceIcon(resource.resourceType)
                            .font(.largeTitle)
                            .frame(width: 75)
                        VStack(alignment: .leading) {
                            Text(resource.name)
                                .font(.title2)
                            Text(resource.url)
                        }
                        Spacer()
                        Button {
                            modalType = .editResource((resource, $resources))
                        } label: {
                            SFSymbol.edit
                                .font(.title3)
                                .foregroundColor(.accentColor)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .onDelete(perform: { indexSet in
                    resources.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("Resources")
            .navigationBarItems(
                trailing:
                    Button {
                        modalType = .createResource($resources)
                    } label: {
                        SFSymbol.new
                            .font(.title2)
                    }
            )
            .sheet(item: $modalType) { $0 }
        }
    }
    func resourceIcon(_ resourceType: Resource.ResourceType) -> SFSymbol {
        switch resourceType {
        case .blog:
            return SFSymbol.blog
        case .website:
            return SFSymbol.website
        case .podcast:
            return SFSymbol.podcast
        case .youtube:
            return SFSymbol.youtube
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
