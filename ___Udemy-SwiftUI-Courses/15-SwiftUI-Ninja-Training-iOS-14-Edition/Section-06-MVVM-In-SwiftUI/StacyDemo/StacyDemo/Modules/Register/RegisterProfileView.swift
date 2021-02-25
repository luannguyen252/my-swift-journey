//
//  RegisterProfileView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 11/12/2020.
//

import SwiftUI

struct RegisterProfileView: View {

  @StateObject private var registerViewModel = RegisterViewModel()
  
  fileprivate func fullNameTextField() -> some View {
    TextField("Full Name", text: $registerViewModel.fullName,
                     onCommit: { hideKeyboard() })
      .disableAutocorrection(true)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func phoneNumberTextField() -> some View {
    TextField("Phone Number", text: $registerViewModel.phoneNumber)
      .disableAutocorrection(true)
      .keyboardType(.phonePad)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func genderPicker() -> some View {
    VStack(alignment: .leading) {
      Text("Gender")
        .foregroundColor(.text)
      
      Picker(selection: $registerViewModel.selectedGender,
             label: Text("Gender")) {
        ForEach(0..<registerViewModel.gender.count) { index in
          Text(registerViewModel.gender[index]).tag(index)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      .background(Color.pickerForeground)
      .cornerRadius(8)
    }
  }
  
  fileprivate func emailAddressTextField() -> some View {
    TextField("Email", text: $registerViewModel.email)
      .disableAutocorrection(true)
      .keyboardType(.emailAddress)
      .autocapitalization(.none)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func passwordSecureField() -> some View {
    SecureField("Password", text: $registerViewModel.password)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func confirmPasswordSecureField() -> some View {
    SecureField("Confirm Password", text: $registerViewModel.confirmPassword)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func moreAboutYouTextEditor() -> some View {
    VStack(alignment: .leading) {
      Text("Tell me more about you")
        .foregroundColor(.text)
      TextEditor(text: $registerViewModel.moreAboutYou)
        .frame(height: 100, alignment: .topLeading)
        .disableAutocorrection(true)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 6)
                  .stroke(Color.gray.opacity(0.3), lineWidth: 1))
    }
  }
  
  fileprivate func registerButton() -> some View {
    NavigationLink(destination: HomeView(), isActive: $registerViewModel.registrationSuccessful) {
      Button(action: { registerViewModel.register() }) {
        Text("REGISTER")
          .textStyle(GradientButtonStyle())
          .padding(.horizontal, -20)
          .padding(.bottom)
      }
    }
  }
  
  var body: some View {
    ZStack {
      ScrollView {
          VStack(spacing: 16) {
            fullNameTextField()
            
            phoneNumberTextField()
            
            genderPicker()
            
            emailAddressTextField()
            
            passwordSecureField()
            
            confirmPasswordSecureField()
            
            moreAboutYouTextEditor()
            
            registerButton()
          }
          .padding()
          .onTapGesture {
            hideKeyboard()
          }
          .alert(isPresented: $registerViewModel.errorOccured) {
            Alert(title: Text("Error"),
                  message: Text(registerViewModel.registerError))
          }
        }
      .navigationTitle("Complete your profile")
      if registerViewModel.loading {
        LoadingView()
      }
    }//zstack
    }
}

struct RegisterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterProfileView()
    }
}
