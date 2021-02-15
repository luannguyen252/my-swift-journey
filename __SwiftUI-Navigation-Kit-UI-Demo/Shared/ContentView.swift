import SwiftUI
import NavigationKit

struct ContentView: View {
    @State private var isPushedViewActive: Bool = false
    @State private var isPresentedViewActive: Bool = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationKitView(isActive: $isPushedViewActive) {
            VStack(spacing: 12) {
                NavigationKitLink(isActive: $isPushedViewActive) {
                    ContentView2()
                } label: {
                    DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
                }
                .padding(.bottom, 24)
                
                Button {
                    isPresentedViewActive.present()
                } label: {
                    DemoButtonLabel(text: "Present", imageSystemName: "arrow.up.doc.fill", isImageLeading: false)
                }
                .sheet(isPresented: $isPresentedViewActive) {
                    ContentView().disableSwipeToDismiss()
                }
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    DemoButtonLabel(text: "Dismiss", imageSystemName: "arrow.down.doc.fill", isImageLeading: false)
                }
                .sheet(isPresented: $isPresentedViewActive) {
                    ContentView()
                }
                
                Text("Dismiss works only when this view is presented in a sheet.")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
//            .customNavigationBar(titleView:
//                                    Text("Root").bold(),
//                                 backgroundView:
//                                    Color(.systemOrange).ignoresSafeArea())
//            .inlineNavigationBar(titleView:
//                                    Text("Root").bold(),
//                                 leadingView:
//                                    EmptyView(),
//                                 trailingView:
//                                    Button(action: {
//
//                                    }, label: {
//                                        Text("Next")
//                                    }),
//                                 backgroundView:
//                                    NavigationBarDefaultBackgroundView())
            .largeNavigationBar(titleView:
                                    Text("Root").bold(),
                                leadingView:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "arrow.down.doc.fill")
                                        Text("Dismiss")
                                    }),
                                trailingView:
                                    SystemImageButton(action: {
                                        isPushedViewActive.present()
                                    }, name: "chevron.forward", font: .system(size: 18, weight: .bold)),
                                backgroundView:
                                    NavigationBarDefaultBackgroundView())
        }
    }
}

struct ContentView2: View {
    @State private var isPushedViewActive: Bool = false
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.rootPresentationMode) private var rootPresentationMode

    var body: some View {
        VStack(spacing: 12) {
            NavigationKitLink(isActive: $isPushedViewActive) {
                ContentView3()
            } label: {
                DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
            }

            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }

            Button {
                rootPresentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop to Root", imageSystemName: "chevron.backward.2", isImageLeading: true)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
        .inlineNavigationBar(titleView:
                                Text("Two").bold(),
                             leadingView:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "chevron.backward")
                                    Text("Go Back")
                                }),
                             trailingView:
                                ImageButton(action: {

                                }, name: "logo"),
                             backgroundView:
                                NavigationBarDefaultBackgroundView())
    }
}

struct ContentView3: View {
    @State private var isPushedViewActive : Bool = false
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    var body: some View {
        VStack(spacing: 12) {
            NavigationKitLink(isActive: $isPushedViewActive) {
                ContentView4()
            } label: {
                EmptyView()
            }
            
            Button {
                isPushedViewActive = true
            } label: {
                DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
            }
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }
            
            Button {
                rootPresentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop to Root", imageSystemName: "chevron.backward.2", isImageLeading: true)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Three")
    }
}

struct ContentView4: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    var body: some View {
        VStack(spacing: 12) {
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }
            
            Button {
                rootPresentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop to Root", imageSystemName: "chevron.backward.2", isImageLeading: true)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
    }
}

struct DemoButtonLabel: View {
    var text: String
    var imageSystemName: String
    var isImageLeading: Bool
    
    var body: some View {
        HStack {
            if isImageLeading {
                Image(systemName: imageSystemName)
                Text(text)
            } else {
                Text(text)
                Image(systemName: imageSystemName)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(8)
    }
}
