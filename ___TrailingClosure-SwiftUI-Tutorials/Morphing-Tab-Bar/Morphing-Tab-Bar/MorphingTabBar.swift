import SwiftUI
import Combine

struct MorphingTabBar<Content> : View where Content : View {
    private let views   : [Content]
    
    @State var index        : Int   = 0
    @State var tintColor    : Color = Color(red: 51/255, green: 42/255, blue: 124/255)
    
    var flipped: Bool
    
    struct TabItem {
        var uuid    : UUID
        var pos     : Int
        var image   : Image
    }
    
    @State var tabItems : [TabItem] = []
    
    init(flipped: Bool, @ViewBuilder content: @escaping () -> [Content]) {
        self.flipped = flipped
        views = content()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack {
                self.views[self.index]
                    .onPreferenceChange(MorphTabItemPreferenceKey.self) { image in
                        if !self.tabItems.contains(where: { (tabItem) -> Bool in
                            return tabItem.pos == self.index
                        }) {
                             self.tabItems.insert(TabItem(uuid: UUID(), pos: self.index, image: image), at: 0)
                        }
                    }
                    .padding()
                    .zIndex(Double(self.views.count))
                
                ForEach(self.views.indices) { i in
                    VStack {
                        self.views[i]
                            .onPreferenceChange(MorphTabItemPreferenceKey.self) { image in
                                if i != self.index {
                                    if !self.tabItems.contains(where: { (tabItem) -> Bool in
                                        return tabItem.pos == i
                                    }) {
                                        self.tabItems.insert(TabItem(uuid: UUID(), pos: i, image: image), at: 0)
                                    }
                                }
                            }
                            .padding()
                    }
                }
            }
            
            ZStack {
                MorphRectangle(cornerRadius: 20, dipRadius: 20, tabCount: tabItems.count, index: self.index)
                    .foregroundColor(self.tintColor)
                    .frame(width: nil, height: 75, alignment: .center)
                    .rotation3DEffect(Angle(degrees: flipped ? 180: 0), axis: (x: 1, y: 0, z: 0))
                    .padding(.horizontal, 12)
                    .padding(.top, 8)

                HStack (alignment: .center, spacing: 0) {
                    Spacer()
                    ForEach(self.tabItems, id: \.uuid) { tabItem in
                        Group {
                            if tabItem.pos == self.index {
                                tabItem.image
                                    .foregroundColor(self.tintColor)
                            } else {
                                tabItem.image
                                    .foregroundColor(Color.white)
                                    .onTapGesture {
                                        //withAnimation {
                                            self.index = tabItem.pos
                                        //}
                                    }
                            }
                            Spacer()
                        }
                    }
                }
            }
            .animation(.spring())
            .animation(.easeInOut(duration: 0.4))
        }
    }
    
    func calculateZIndex(i: Int, index: Int) -> Double {
        var zIndex: Double = Double(i)
        
        if index == i {
            zIndex = 10
        }
        
        print("Z INDEX: \(zIndex)")
        
        return zIndex
    }
}

struct MorphTabItemPreferenceKey: PreferenceKey {
    typealias Value                 = Image
    static var defaultValue: Image  = Image(systemName: "questionmark.square.fill")
    static func reduce(value: inout Image, nextValue: () -> Image) {
        value = nextValue()
    }
}

extension View {
    func morphTabItem(_ value: Image) -> some View {
        preference(key: MorphTabItemPreferenceKey.self, value: value)
    }
    
    func toAnyView() -> AnyView {
        return AnyView(self)
    }
}
