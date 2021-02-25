import SwiftUI

struct KRefreshScrollView<Content: View>: View {
    
    var content: Content
    @State var refresh = Refresh(started: false, released: false)
    var onUpdate : ()->()
    var progressTint: Color
    var arrowTint: Color
    
    init(progressTint: Color,arrowTint: Color,@ViewBuilder content: ()->Content,onUpdate: @escaping ()->()) {
        self.content = content()
        self.onUpdate = onUpdate
        self.progressTint = progressTint
        self.arrowTint = arrowTint
    }
    
    var body: some View{
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            // geometry reader for calculating postion....
            
            GeometryReader{reader -> AnyView in
                
                DispatchQueue.main.async {
                    
                    if refresh.startOffset == 0{
                        refresh.startOffset = reader.frame(in: .global).minY
                    }
                    
                    refresh.offset = reader.frame(in: .global).minY
                    
                    if refresh.offset - refresh.startOffset > 80 && !refresh.started{
                        
                        refresh.started = true
                    }
                    
                    // checking if refresh is started and drag is released....
                    
                    if refresh.startOffset == refresh.offset && refresh.started && !refresh.released{
                        
                        withAnimation(Animation.linear){refresh.released = true}
                        fireUpdate()
                    }
                    
                    // checking if invalid becomes valid....
                    
                    if refresh.startOffset == refresh.offset && refresh.started && refresh.released && refresh.invalid{
                        
                        refresh.invalid = false
                        fireUpdate()
                    }
                }
                
                return AnyView(Color.black.frame(width: 0, height: 0))
            }
            .frame(width: 0, height: 0)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                
                // Arrow And Indicator....
                
                if refresh.started && refresh.released{
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: progressTint))
                        .offset(y: -32)
                    
                }
                else{
                    
                    Image(systemName: "arrow.down")
                        .font(.system(size: 16, weight: .heavy))
                        .foregroundColor(arrowTint)
                        .rotationEffect(.init(degrees: refresh.started ? 180 : 0))
                        .offset(y: -30)
                        .animation(.easeIn)
                        .opacity(refresh.offset != refresh.startOffset ? 1 : 0)
                    
                }
                
                VStack{
                    
                    content
                }
                .frame(maxWidth: .infinity)
            }
            .offset(y: refresh.released ? 40 : -10)
        })
    }
    
    func fireUpdate(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            withAnimation(Animation.linear){
                
                if refresh.startOffset == refresh.offset{
                    
                    onUpdate()
                    refresh.released = false
                    refresh.started = false
                }
                else{
                    
                    refresh.invalid = true
                }
            }
        }
    }
    
}

struct Refresh {
    var startOffset : CGFloat = 0
    var offset : CGFloat = 0
    var started : Bool
    var released: Bool
    var invalid : Bool = false
}
