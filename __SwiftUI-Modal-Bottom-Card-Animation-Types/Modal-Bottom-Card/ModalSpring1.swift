import SwiftUI

struct ModalSpring1: View {
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all, edges: .all)
            
            Button(action: {
                self.show.toggle()
            }) {
                Text("Spring 1")
                    .font(.custom("TTFirsNeue-Bold", size: 18))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
            }
            .frame(width: UIScreen.main.bounds.width - 32)
            .background(Color("orange"))
            .foregroundColor(Color("white"))
            .cornerRadius(16)

            if show {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color("white"))

                    HStack {
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            self.show.toggle()
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 32))
                                .foregroundColor(Color("dark").opacity(0.5))
                        })
                    }
                    .padding(.vertical, 16)
                    .padding(.horizontal, 16)
                    .zIndex(1)
                    
                    VStack(spacing: 24) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color("dark").opacity(0.05))
                            .frame(height: 440)
                        
                        VStack(spacing: 16) {
                            VStack(spacing: 8) {
                                Text("SwiftUI")
                                    .font(.custom("TTFirsNeue-Bold", size: 32))
                                    .foregroundColor(Color("dark"))
                                
                                Text("Better apps. Less code.")
                                    .font(.custom("TTFirsNeue-DemiBold", size: 24))
                                    .foregroundColor(Color("dark"))
                            }
                            
                            Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.")
                                .font(.custom("TTFirsNeue-Regular", size: 16))
                                .foregroundColor(Color("dark4"))
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Text("Hide Modal")
                                .font(.custom("TTFirsNeue-Bold", size: 18))
                                .padding(.vertical, 16)
                                .padding(.horizontal, 24)
                        }
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .background(Color("orange"))
                        .foregroundColor(Color("white"))
                        .cornerRadius(16)
                    }
                    .padding(.bottom, 48)
                }
                .ignoresSafeArea(.all, edges: .bottom)
                .animation(.spring())
                //.animation(.spring(response: 0.5, dampingFraction: 0.8))
                .transition(.move(edge: .bottom))
                .zIndex(1)
            }
        }
        .statusBar(hidden: true)
    }
}

struct ModalSpring1_Previews: PreviewProvider {
    static var previews: some View {
        ModalSpring1()
    }
}
