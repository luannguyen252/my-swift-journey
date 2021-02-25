import SwiftUI
import SceneKit

struct SceneKitExample: View {
    @State private var showInfo = false
    @State var models = [
        Model(id: 0, name: "Phoenix Bird", modelName: "PhoenixBird.usdz", details: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book."),
        
        Model(id: 1, name: "Scarlet Phoenix", modelName: "ScarletPhoenix.usdz", details: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book."),
        
        Model(id: 2, name: "Icy Dragon", modelName: "IcyDragon.usdz", details: "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book."),
    ]

    @State var index = 0
    
    var body: some View {
        ZStack {
            Color("white").edgesIgnoringSafeArea(.all)
            
            VStack {
                SceneView(
                    scene: SCNScene(named: models[index].modelName),
                    options: [.autoenablesDefaultLighting, .allowsCameraControl]
                )
                .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
                .ignoresSafeArea(.all, edges: .all)
                
                ZStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                if index > 0 {
                                    index -= 1
                                }
                            }
                        }, label: {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(Color("dark"))
                                .opacity(index == 0 ? 0.2 : 1)
                        })
                        .disabled(index == 0 ? true : false)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            withAnimation {
                                if index < models.count {
                                    index += 1
                                }
                            }
                        }, label: {
                            Image(systemName: "arrow.right.circle.fill")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(Color("dark"))
                                .opacity(index == models.count - 1 ? 0.2 : 1)
                        })
                        .disabled(index == models.count - 1 ? true : false)
                    }
                    
                    Text(models[index].name)
                        .font(.custom("TTFirsNeue-Bold", size: 24))
                        .foregroundColor(Color("dark"))
                }
                .foregroundColor(Color("dark"))
                .padding(.top, 16)
                .padding(.horizontal, 16)
                
                Divider()
                    .padding(.vertical, 16)
                
                VStack(alignment: .leading, spacing: 16, content: {
                    ZStack {
                        VStack(alignment: .leading, spacing: 8, content: {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("About:".uppercased())
                                    .font(.custom("TTFirsNeue-Bold", size: 16))
                                    .foregroundColor(Color("dark"))
                                
                                Text(models[index].details)
                                    .font(.custom("TTFirsNeue-Regular", size: 16))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color("dark4"))
                            }
                            .padding(.bottom, 16)
                            
                            HStack {
                                Spacer(minLength: 0)
                                
                                Button(action: {
                                    self.showInfo.toggle()
                                }) {
                                    HStack(spacing: 16) {
                                        Image(uiImage: #imageLiteral(resourceName: "ic_ar_32"))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 32, height: 32, alignment: .center)
                                        Text("View in AR")
                                            .font(.custom("TTFirsNeue-Bold", size: 18))
                                            .foregroundColor(Color("dark"))
                                    }
                                    .padding(.vertical, 16)
                                    .padding(.horizontal, 24)
                                    .background(Capsule().stroke(Color("dark"), lineWidth: 1))
                                }
                                
                                Spacer(minLength: 0)
                            }
                            .sheet(isPresented: self.$showInfo) {
                                ViewInAR()
                            }
                        })
                    }
                })
                .padding(.horizontal)
                
                Spacer(minLength: 0)
            }
        }
        .statusBar(hidden: true)
    }
}

// Data Model
struct Model: Identifiable {
    var id          : Int
    var name        : String
    var modelName   : String
    var details     : String
}

#if DEBUG
struct SceneKitExample_Previews: PreviewProvider {
    static var previews: some View {
        SceneKitExample()
    }
}
#endif
