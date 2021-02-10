import SwiftUIVisualEffects
import SwiftUI

struct ContentView: View {
    private var vibrancyLabels: [UIVibrancyEffectStyle] = [ .label, .secondaryLabel, .tertiaryLabel, .quaternaryLabel]
    private var vibrancyLabelsNames: [String] = [ "Label", "Secondary Label", "Tertiary Label", "Quaternary Label"]
    
    private var vibrancyFills: [UIVibrancyEffectStyle] = [ .fill, .secondaryFill, .tertiaryFill]
    private var vibrancyFillNames: [String] = [ "Fill", "Secondary", "Tertiary"]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ZStack {
                    Color(.clear).blurEffect()
                        .blurEffectStyle(.systemThinMaterial)
                    
                    TabView {
                        HStack(spacing: 32) {
                            ForEach(0 ..< vibrancyFills.count) { i in
                                VStack(spacing: 16) {
                                    Image(systemName: "swift")
                                        .font(.system(size: 60))
                                        .vibrancyEffect()
                                        .vibrancyEffectStyle(vibrancyFills[i])
                                    
                                    Text(vibrancyFillNames[i])
                                        .fontWeight(.bold)
                                        .vibrancyEffect()
                                        .vibrancyEffectStyle(vibrancyFills[i])
                                }
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            ForEach(0 ..< vibrancyLabels.count) { i in
                                Text(vibrancyLabelsNames[i])
                                    .font(Font.title.bold())
                                    .vibrancyEffect()
                                    .vibrancyEffectStyle(vibrancyLabels[i])
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .padding(.bottom, 16)
                }
                .frame(height: UIScreen.main.bounds.size.height / 2)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
