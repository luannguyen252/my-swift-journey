import SwiftUI
/*

struct HorizontalPickerStyle: PickerStyle {
    
    static func _makeView<SelectionValue>(value: _GraphValue<_PickerValue<HorizontalPickerStyle, SelectionValue>>, inputs: _ViewInputs) -> _ViewOutputs where SelectionValue : Hashable {
        var body: some View { Text("!!") }
        return body
    }
    
    static func _makeViewList<SelectionValue>(value: _GraphValue<_PickerValue<HorizontalPickerStyle, SelectionValue>>, inputs: _ViewListInputs) -> _ViewListOutputs where SelectionValue : Hashable {
        ScrollView(.horizontal) {
            HStack {
                Text("1")
                Text("2")
                Text("3")
            }
        }
    }
}

struct HorizontalPickerStyle_For_Previews: View {
    enum Season: String, CaseIterable, Hashable { case sp, su, fa, wi }
    @State var season: Season = .sp
    var body: some View {
        Picker(selection: $season, label: Text("season")) {
            ForEach(Season.allCases, id: \.self) { season in
                Text(season.rawValue).tag(season)
            }
        }.pickerStyle(HorizontalPickerStyle())
    }
}

struct HorizontalPickerStyle_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalPickerStyle_For_Previews()
    }
}
*/
