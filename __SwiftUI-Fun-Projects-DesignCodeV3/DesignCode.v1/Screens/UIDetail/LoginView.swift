//
//  LoginView.swift
//  DesignCode.v3
//
//  Created by Tee Becker on 11/4/20.
//

import SwiftUI
import Firebase


struct LoginView: View {
    // because these two objects are dynamic as everyone have different email and password
    @State var email = ""
    @State var password = ""
    @State var isFocused = false
    @State var showAlert = false
    @State var alertMessage = "Something went wrong"
    @State var isLoading = false
    @State var isSuccess = false
    @EnvironmentObject var user: UserStore
    
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func login(){
        hideKeyboard()
        isFocused = false
        isLoading = true
        //make firebase call
        makeFirebaseCall()
    }
    
    func makeFirebaseCall(){
        isLoading = false
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                alertMessage = error?.localizedDescription ?? ""
                showAlert = true
            } else{
                isSuccess = true
                user.isLogged = true
                saveToUserDefault()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    isSuccess = false
                    user.showLogin = false
                }
            }
        }
    }
    
    func saveToUserDefault(){
        UserDefaults.standard.set(true, forKey: "isLogged")
    }
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .top) {
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                
                VStack(spacing: 7) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        TextField("YOUR EMAIL", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .font(.subheadline)
                            //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture(count: 1, perform: {
                                isFocused = true
                            })
                            
                    }
                    
                    Divider().padding(.leading, 80) // so the line starts after the images
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        
                        // MARK: important* use SecureField instead of normal TextField
                        SecureField("PASSWORD", text: $password)
                            .font(.subheadline)
                            .autocapitalization(.none)
                            .padding(.leading)
                            .frame(height: 44)
                            .onTapGesture(count: 1, perform: {
                                isFocused = true
                            })
                        
                    }
                }
                .frame(height: 136)
                .frame(maxWidth: .infinity)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
                .padding(.horizontal)
                .offset(y: 460)
                
                
                
                HStack {
                    Text("Forgot password?")
                        .font(.subheadline)
                        .foregroundColor(Color("secondary"))
                    
                    Spacer()
                    
                    Button(action: {
                        login()
                    }) {
                        Text("LOG IN")
                            .foregroundColor(.black)
                    }
                    .padding(12)
                    .padding(.horizontal, 30)
                    .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    })
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding()
            }
            .offset(x: 0, y: isFocused ? -300 : 0)
            .animation(isFocused ? .easeInOut : nil)
            .onTapGesture(count: 1, perform: {
                isFocused = false
                hideKeyboard()
            })
            
            if isLoading{
                LoadingView()
            }
            
            if isSuccess{
                SuccessView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView().previewDevice("iPhone 11 Pro Max)")
            //            LoginView().previewDevice("iPhone SE (2nd generation)")
            
            //            LoginView().previewDevice("iPad Air (4th generation)")
        }
    }
}


struct CoverView: View {
    @State var show = false
    @State var viewState = CGSize.zero // gives a 3D effect when dragging. applied to both texts, and the image
    @State var isDragging = false
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Text("Learn design & code.\nFrom scratch.")
                    .font(.system(size: geometry.size.width/10, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: 375, maxHeight: 100)
            .padding(.horizontal, 16)
            .offset(x: viewState.width/15, y: viewState.height/15)
            
            Text("80 hours of courses for SwiftUI, React and design tools.")
                .font(.subheadline)
                .foregroundColor(Color("secondary"))
                .frame(width: 250)
                .offset(x: viewState.width/20, y: viewState.height/20)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.top, 100)
        .frame(height: 477)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -150, y: -200)
                    .rotationEffect(Angle(degrees: show ? 360 + 90 : 90))
                    .blendMode(.plusDarker)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                    .onAppear{ show = true }
                
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -200, y: -250)
                    .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                    .blendMode(.overlay)
                    .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false))
            })
        
        .background(Image(uiImage: #imageLiteral(resourceName: "Card3"))
                        .offset(x: viewState.width/25, y: viewState.height/25)
                    , alignment: .bottom)
        .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .scaleEffect(isDragging ? 0.9 : 1)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .rotation3DEffect(
            Angle(degrees: 5),
            axis: (x: viewState.width, y: viewState.height, z: 0.0))
        .gesture(DragGesture().onChanged{ value in
            viewState = value.translation
            isDragging = true
        }
        .onEnded{ value in
            viewState = .zero
            isDragging = false
        })
    }
}
