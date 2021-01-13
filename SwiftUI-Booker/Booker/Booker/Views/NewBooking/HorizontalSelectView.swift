import SwiftUI

struct HorizontalSelectView<Value, Cell>: View where Value: Identifiable, Cell: View {
    var datas: [Value]
    @Binding var selection: Value
    
    var cell: (Value) -> Cell
    
    var body: some View {
        if !datas.isEmpty { return AnyView(
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(datas) { data in
                        self.cell(data)
                            .gesture(TapGesture(count: 1).onEnded {
                                withAnimation { self.selection = data }
                            })
                    }
                }
            })
        }else {
            return AnyView(Text("blank"))
        }
    }
    
    init(_ datas: [Value], selection: Binding<Value>,
         @ViewBuilder cell: @escaping (Value) -> Cell) {
        self.datas = datas
        self._selection = selection
        self.cell = cell
    }
}

fileprivate struct HorizontalSelectView_For_Previews: View {
    enum Season: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        case spring, summer, fall, winter
    }
    
    @State var selecting: Season = .spring
    
    var body: some View {
        VStack {
            HorizontalSelectView(Season.allCases, selection: $selecting) { season in
                ZStack() {
                    Text(season.rawValue)
                        .font(.largeTitle)
                        .animation(.spring())
                        .foregroundColor(season == self.selecting ? .red : .black)
                    if self.selecting == season {
                        Color(.displayP3, red: 0, green: 0, blue: 0, opacity: 0.5)
                        Image(systemName: "checkmark")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }.frame(width: 150, height: 200)
            }
            
            Picker(selection: $selecting, label: Text("picker")) {
                ForEach(Season.allCases) { season in
                    if season == self.selecting {
                        Text(season.rawValue.uppercased())
                            .foregroundColor(.primary).tag(season)
                    }else {
                        Text(season.rawValue).tag(season)
                    }
                }
            }
        }
    }
}

struct HorizontalSelectView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSelectView_For_Previews()
    }
}
