import SwiftUI

struct ContentView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List {
            ForEach(0 ..< 20) { item in
                GCMainRow()
                    .listRowInsets(EdgeInsets())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GCMainRow: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("1")
                .resizable()
                .frame(width: 46, height: 46)
                .cornerRadius(6)
                .overlay(
                    Color.red
                        .overlay(
                            Text("1")
                                .font(.caption)
                                .foregroundColor(.white)
                    )
                        .frame(width: 16, height: 16)
                        .cornerRadius(8)
                        .offset(x: 23, y: -23)
            )
            
            VStack {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("女神")
                            .font(.body)

                        Spacer()

                        Text("下午 2:55")
                            .font(.caption)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    Text("对不起，你是个好人")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                }
                .padding(.trailing)
                Divider()
            }
        }
        .padding(.top)
        .padding(.leading)
    }
}
