//
//  ContentView.swift
//  HookUp
//
//  Created by Daval Cato on 8/15/20.
//

import SwiftUI
import Firebase


struct ContentView: View {
    
    @AppStorage("log_Status") var status = false
    // Log out thru ModelData
    @StateObject var model = ModelData()
    
    var body: some View {
        
        ZStack{
            
            if status{
                
                VStack(spacing: 25){
                    
                    Text("Logged In As \(Auth.auth().currentUser?.email ?? "")")
                    
                    Button(action: model.logOut, label: {
                        Text("LogOut")
                            .fontWeight(.bold)
                    })
                }
            }
            else{
                
                LoginView(model: model)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct LoginView : View {
    
    @State var value : CGFloat = 0
    @ObservedObject var model : ModelData
    var body: some View{
        
        ZStack{
            
            VStack{
                
                Spacer(minLength: 0)
                
                ZStack{
                    
                    if UIScreen.main.bounds.height < 750{
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 180)
                    }
                    else{
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 180)
                    }
                }
                    .padding(.horizontal)
                    .padding(.vertical,30)
                    .background(Color.white.opacity(0))
                    .cornerRadius(30)
                    .padding(.top)
                
                VStack(spacing: 4){
                    
                    HStack(spacing: 0){
                        
                        Text("Dating")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.white)
                        
                        Text("Match")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color("txt"))
                        
                    }
                    
                    Text("the best way to choose your match")
                        .foregroundColor(Color.black.opacity(0.3))
                        .fontWeight(.heavy)
                    
                }
                .padding(.top)
                
                VStack(spacing: 20) {
                    
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.email)
                    
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password)
                }.offset(y: -self.value)
                .animation(.spring())
                .onAppear {
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                        
                        let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        let height = value.height
                        
                        self.value = height
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                        
                        self.value = 0
                    }
                }
                .padding(.top)
                
                // Here is the Login button
                Button(action: model.login) {
                    
                    Text("LOGIN")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bottom"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
                .padding(.top,22)
                
                HStack(spacing: 12){
                    
                    Text("Don't have an account?")
                        .foregroundColor(Color.white.opacity(8.7))
                    
                    Button(action: {model.isSignUp.toggle()}) {
                        
                        Text("Sign Up Now")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top,25)
                
                Button(action: model.resetPassword) {
                    
                    Text("Forgot password?")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.vertical,22)
         
                Spacer(minLength: 0)
            }
            
            if model.isLoading{
                
                LoadingView()
                
            }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
        
        .fullScreenCover(isPresented: $model.isSignUp) {
            
            SignUpView(model: model)
            
        }
        // Password Reset Link is here...
        .alert(isPresented: $model.alert, content: {
            
            Alert(title: Text("Message"), message: Text(model.alertMsg), dismissButton: .destructive(Text("OK")))
        })
    }
}

struct CustomTextField : View {
    
    var image : String
    var placeHolder : String
    @Binding var txt : String
    
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
            
            
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color("bottom"))
                .frame(width: 60, height: 60)
                .background(Color.white)
                .clipShape(Circle())
            
            ZStack{
                
                if placeHolder == "Password" || placeHolder == "Re-Enter"{
                    SecureField(placeHolder, text: $txt)
                }
                else{
                    TextField(placeHolder, text: $txt)
                }
            }
                .padding(.horizontal)
                .padding(.leading,65)
                .frame(height: 60)
                .background(Color.white.opacity(0.2))
                .clipShape(Capsule())
        }
        .padding(.horizontal)
    }
    
}

struct SignUpView : View {
    
    @State var value : CGFloat = 0
    @ObservedObject var model : ModelData
    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            VStack{
                
                Spacer(minLength: 0)
                
                ZStack{
                    
                    if UIScreen.main.bounds.height < 750{
                        
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 180)
                    }
                    else{
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 180)
                    }
                }
                    .padding(.horizontal)
                    .padding(.vertical,30)
                    .background(Color.white.opacity(0))
                    .cornerRadius(30)
                    .padding(.top)
                
                VStack(spacing: 4){
                    
                    HStack(spacing: 0){
                        
                        Text("New")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.white)
                        
                        Text("Profile")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color("txt"))
                        
                    }
                    
                    Text("Create a profile here!!!")
                        .foregroundColor(Color.black.opacity(0.3))
                        .fontWeight(.heavy)
                    
                }
                .padding(.top)
                
                VStack(spacing: 20) {
                    
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.email_SignUP)
                    
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password_SignUp)
                    
                    CustomTextField(image: "lock", placeHolder: "Re-Enter", txt: $model.reEnterPassword)
                    
                    
                }.offset(y: -self.value)
                .animation(.spring())
                .onAppear {
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                        
                        let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        let height = value.height
                        
                        self.value = height
                    }
                    
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                        
                        self.value = 0
                    }
                }
                .padding(.top)
                
                Button(action: model.signUP) {
                    
                    Text("SIGNUP")
                        .fontWeight(.bold)
                        .foregroundColor(Color("bottom"))
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
                .padding(.vertical,22)
                
                Spacer(minLength: 0)
                
            }
            
            Button(action: {model.isSignUp.toggle()}) {
                
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
            }
            .padding(.trailing)
            .padding(.top,10)
            
            if model.isLoading{
                
                LoadingView()
                
            }
            
        })
        .background(LinearGradient(gradient: .init(colors: [Color("top"),Color("bottom")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
        
        // Alerts...
        
        .alert(isPresented: $model.alert, content: {
            
            Alert(title: Text("Message"), message: Text(model.alertMsg), dismissButton: .destructive(Text("OK"), action: {
                
                // The Email link sent will closing the SignUp View...
                if model.alertMsg == "Email Verificaion Has Been Sent !!! Now Verify Your Email ID !!!"{
                    
                    model.isSignUp.toggle()
                    model.email_SignUP = ""
                    model.password_SignUp = ""
                    model.reEnterPassword = ""
                }
                
            }))
        })
    }
}

// MVVM Model will start here...

class ModelData : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isSignUp = false
    @Published var email_SignUP = ""
    @Published var password_SignUp = ""
    @Published var reEnterPassword = ""
    @Published var islinkSend = false
    
    // Here is where the AlertView with TextFields goes...
    
    
    // Error Alerts go here...
    @Published var alert = false
    @Published var alertMsg = ""
    
    // Here is the User Status...
    @AppStorage("log_Status") var status = false
    
    // Loading View...
    
    @Published var isLoading = false
    
    
    
    func resetPassword(){
        
        let alert = UIAlertController(title: "Reset Password", message: "Enter your E-Mail ID To Reset Your Password", preferredStyle: .alert)
        
        alert.addTextField { (password) in
            password.placeholder = "Email"
        }
        let proceed = UIAlertAction(title: "Reset", style: .default) { (_) in
            
            // Sending Password Link...
            
            if alert.textFields![0].text! != ""{
                
                withAnimation{
                    
                    self.isLoading.toggle()
                }
                
                Auth.auth().sendPasswordReset(withEmail: alert.textFields![0].text!) { (err) in
                    
                    withAnimation{
                        
                        self.isLoading.toggle()
                    }
                    
                    if err != nil{
                        
                        self.alertMsg = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    // Alerting the User here...
                    self.alertMsg = "Password Reset Link Has Been Sent !!!"
                    self.alert.toggle()
                }
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(proceed)
        
        // Presenting the model message...
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
        
    }
    
    // Login here...
    
    func login(){
        
        // Here we check all fields for correct input...
        if email == "" || password == ""{
            
            self.alertMsg = "Please add the correct contents !!!"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            
            self.isLoading.toggle()
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            
            withAnimation{
                
                self.isLoading.toggle()
            }
            
            if err != nil{
                
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            // Here we check if the user is verified or not...
            
            let user = Auth.auth().currentUser
            
            if !user!.isEmailVerified{
                
                self.alertMsg = "Be sure to Verify Email address!!!"
                self.alert.toggle()
                // Logging out here...
                try! Auth.auth().signOut()
                
                return
                
            }
            
            // Here we set user status to true...
            
            withAnimation{
                
                self.status = true
            }
        }
    }
    
    // SignUp goes here....
    func signUP(){
        
        // Checking the loading...
        
        if email_SignUP == "" || password_SignUp == "" || reEnterPassword == ""{
            
            self.alertMsg = "Fill in contents correctly !!!"
            self.alert.toggle()
            return
        }
        
        if password_SignUp != reEnterPassword{
            
            self.alertMsg = "Password Mismatch !!!"
            self.alert.toggle()
            return
        }
        
        withAnimation{
            
            self.isLoading.toggle()
        }
        
        Auth.auth().createUser(withEmail: email_SignUP, password: password_SignUp) { (result, err) in
            
            withAnimation{
                
                self.isLoading.toggle()
            }
            
            if err != nil{
                
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
                
            }
            
            // sending the Verification Link...
            
            result?.user.sendEmailVerification(completion: { (err) in
                
                if err != nil{
                    self.alertMsg = err!.localizedDescription
                    self.alert.toggle()
                    return
                    
                }
                // Alerting User To Verify Email...
                self.alertMsg = "Email Verificaion Has Been Sent !!! Now Verify Your Email ID !!!"
                self.alert.toggle()
                
            })
        }
    }
    
    // Log Out Here...
    
    func logOut(){
        
        try! Auth.auth().signOut()
        
        withAnimation{
            
            self.status = false
        }
        
        // Clearing all data here...
        email = ""
        password = ""
        email_SignUP = ""
        password_SignUp = ""
        reEnterPassword = ""
    }
    
}

// Checking with Smaller devices...


// Loading View here...
struct LoadingView : View {
    
    @State var animation = false
    var body: some View{
        
        VStack{
            
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color("bottom"),lineWidth: 8)
                .frame(width: 75, height: 75)
                .rotationEffect(.init(degrees: animation ? 360 : 0))
                .padding(50)
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).edgesIgnoringSafeArea(.all))
        .onAppear(perform: {
            
            withAnimation(Animation.linear(duration: 1)){
                
                animation.toggle()
            }
        })
    }
}
























