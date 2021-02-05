import SwiftUI
import PlaygroundSupport

struct Screen: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "airplane").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.orange).cornerRadius(6)
                            Text("Airplane Mode")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "wifi").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Wi-Fi")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "wifi").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.blue).cornerRadius(6)
                            Text("Bluetooth")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "phone.fill").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.green).cornerRadius(6)
                            Text("Cellular")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "app.badge").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.red).cornerRadius(6)
                            Text("Notifications")
                        }
                    }
                    NavigationLink(destination: Text("Detail View")) {
                        HStack {
                            ZStack {
                                Image(systemName: "gear").font(.callout)
                            }.frame(width: 28, height: 28).background(Color.gray).cornerRadius(6)
                            Text("General")
                        }
                    }
                }
            }
            .navigationBarTitle("Title")
            .listStyle(GroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

PlaygroundPage.current.setLiveView(Screen())