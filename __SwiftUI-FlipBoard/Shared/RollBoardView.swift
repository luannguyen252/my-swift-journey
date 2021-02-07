import SwiftUI

struct RollBoardView: View {
    var text:String
    var emptyChar:Character = "0"
    var cells:Int = 2
    var size:CGFloat = 30
    var alphabet:[Character] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".flatMap { $0.description }
    var fontDesing:Font.Design = .default
    var fontColor:Color = .black
    var fontSpacing:CGFloat = 0

    var fulltext:String{
        if text.count == cells{
            return text
        }else if text.count < cells{
            return String(String(text.reversed()).padding(toLength: cells, withPad: String(emptyChar), startingAt: 0).reversed())
        }else{
            return text[(text.count-cells)..<text.count]
        }
    }
    
    var indexes:[Int]{
        fulltext.map({ alphabet.firstIndex(of: Character(extendedGraphemeClusterLiteral: $0)) ?? 0 })
    }
    
    var body: some View {
        VStack{
            HStack(spacing:fontSpacing){
                ForEach(0..<cells){i in
                    RollCellView(index:indexes[i], size:size, alphabet:alphabet, fontDesign:fontDesing, fontColor:fontColor)
                }
            }
        }

    }
}

extension Character {
    var isAscii: Bool {
        return unicodeScalars.allSatisfy { $0.isASCII }
    }
    var ascii: UInt32? {
        return isAscii ? unicodeScalars.first?.value : nil
    }
}

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
        let end = index(start, offsetBy: min(self.count - range.lowerBound,
                                             range.upperBound - range.lowerBound))
        return String(self[start..<end])
    }

    subscript(_ range: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: max(0, range.lowerBound))
         return String(self[start...])
    }
}
