//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SwiftUI

struct ExampleView<Content>: View where Content: View {

    @ObservedObject var store = WKWebViewStore.shared
    @State private var viewIndex = 0

    private var title: String
    private var demoContentView: Content
    private let remoteSourcePath: String?

    @available(*, deprecated, message: "Please use DemoView instead of this ExampleView")
    public init(title: String = "", demoContentView: @autoclosure @escaping () -> Content, remoteSourcePath: String? = nil) {
        self.title = title
        self.demoContentView = demoContentView()
        self.remoteSourcePath = remoteSourcePath
    }

    var body: some View {
        VStack {
            if self.remoteSourcePath != nil {
                Picker(selection: self.$viewIndex, label: Text("Demo")) {
                    Text("Demo").tag(0)
                    Text("Source").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())

                if self.viewIndex == 0 {
                    self.demoContentView
                } else if self.viewIndex == 1 {
                    VStack {
                        Toggle(isOn: $store.shouldWrapWord) {
                            Text("Wrap text")
                        }
                        .padding(.horizontal)
                        WKWebViewUI(remoteSourcePath: Constants.repositoryPrefix + self.remoteSourcePath!, shouldWrapWord: store.shouldWrapWord)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
            } else {
                self.demoContentView
            }

            Spacer()
        }
        .navigationBarTitle(Text(title), displayMode: .inline)
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(
            title: "Demo",
            demoContentView: Text("Demo"),
            remoteSourcePath: "Basic/ViewsAndControls/Text/TextExampleView.swift"
        )
    }
}
