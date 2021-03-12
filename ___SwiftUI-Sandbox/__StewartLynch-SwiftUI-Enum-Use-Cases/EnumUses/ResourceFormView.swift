//
//  ResourceFormView.swift
//  EnumUses
//
//  Created by Stewart Lynch on 2021-02-16.
//

import SwiftUI

struct ResourceFormView: View {
    @ObservedObject var form: ResourceForm
    @Binding var resources: [Resource]
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $form.name)
                Picker(selection: $form.resourceType, label: Text("Resource Type")) {
                    Text("YouTube").tag(Resource.ResourceType.youtube)
                    Text("Blog").tag(Resource.ResourceType.blog)
                    Text("WebSite").tag(Resource.ResourceType.website)
                    Text("Podcast").tag(Resource.ResourceType.podcast)
                }
                TextField("Enter URL:", text: $form.url)
                    .keyboardType(.URL)
                    .autocapitalization(.none)
            }
            .navigationBarTitle(form.updating ? "Update Resource" : "New Resource", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel", action: dismiss),
                trailing: Button(
                    form.updating ? "Update" : "Save",
                    action: form.updating ? updateResource : createResource))
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func updateResource() {
        guard let idx = resources.firstIndex(where: {$0.id == form.id}) else { return }
        resources[idx].name = form.name
        resources[idx].resourceType = form.resourceType
        resources[idx].url = form.url
        dismiss()
    }
    
    func createResource() {
        resources.append(Resource.init(name: form.name, url: form.url, resourceType: form.resourceType))
        dismiss()
    }
}

struct ResourceFormView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ResourceFormView(form: ResourceForm(Resource.starterResources[0]), resources: .constant(Resource.starterResources))
            ResourceFormView(form: ResourceForm(), resources: .constant(Resource.starterResources))
        }
    }
}
