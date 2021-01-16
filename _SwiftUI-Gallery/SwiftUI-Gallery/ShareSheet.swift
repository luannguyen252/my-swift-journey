//
//  ShareSheet.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct ShareSheet: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("Share")
        }
        .sheet(isPresented: $showingSheet,
               content: {
                ActivityView(activityItems: [NSURL(string: "https://swiftui.gallery")!] as [Any], applicationActivities: nil) })
    }
}

struct ActivityView: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]?

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        return UIActivityViewController(activityItems: activityItems,
                                        applicationActivities: applicationActivities)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: UIViewControllerRepresentableContext<ActivityView>) {

    }
}

struct ShareSheet_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheet()
    }
}
