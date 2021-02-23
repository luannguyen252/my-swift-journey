struct Breathe: View {
    @State var scale = false
    @State var rotate  = false
    
    var body: some View {
        ZStack {
            Group {
                ZStack {
                    Circle().frame(width: 80, height: 80).foregroundColor(Color(UIColor.systemBlue)).offset(y: -42)
                    Circle().frame(width: 80, height: 80).foregroundColor(Color(UIColor.systemBlue)).offset(y: 42)
                }
            }.opacity(1/3)
            Group {
                ZStack {
                    Circle().frame(width: 80, height: 80).foregroundColor(Color(UIColor.systemBlue)).offset(y: -42)
                    Circle().frame(width: 80, height: 80).foregroundColor(Color(UIColor.systemBlue)).offset(y: 42)
                }
            }.rotationEffect(.degrees(60)).opacity(1/4)
            Group {
                ZStack {
                    Circle().frame(width: 80, height: 80).foregroundColor(Color(UIColor.systemBlue)).offset(y: -42)
                    Circle().frame(width: 80, height: 80).foregroundColor(Color(UIColor.systemBlue)).offset(y: 42)
                }
            }.rotationEffect(.degrees(120)).opacity(1/2)
        }.rotationEffect(.degrees(rotate ? 180 : 0)).scaleEffect(scale  ? 1 : 1/8).animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8)).onAppear() {
            self.rotate.toggle()
            self.scale.toggle()
        }
    }
}