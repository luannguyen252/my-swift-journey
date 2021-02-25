//
//  RegisterProfileView.swift
//  StacyDemo
//
//  Created by Kristijan Kralj on 11/12/2020.
//

import SwiftUI

struct RegisterProfileView: View {
  @State var fullName = ""
  @State var phoneNumber = ""
  @State var selectedGender = 0
  @State var email = ""
  @State var password = ""
  @State var confirmPassword = ""
  @State var moreAboutYou = ""
  
  let gender = ["Male", "Female", "Other"]
  
  fileprivate func fullNameTextField() -> some View {
    TextField("Full Name", text: $fullName,
                     onCommit: { hideKeyboard() })
      .disableAutocorrection(true)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func phoneNumberTextField() -> some View {
     TextField("Phone Number", text: $phoneNumber)
      .disableAutocorrection(true)
      .keyboardType(.phonePad)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func genderPicker() -> some View {
    VStack(alignment: .leading) {
      Text("Gender")
        .foregroundColor(.text)
      
      Picker(selection: $selectedGender,
             label: Text("Gender")) {
        ForEach(0..<gender.count) { index in
          Text(gender[index]).tag(index)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      .background(Color.pickerForeground)
      .cornerRadius(8)
    }
  }
  
  fileprivate func emailAddressTextField() -> some View {
    TextField("Email", text: $email)
      .disableAutocorrection(true)
      .keyboardType(.emailAddress)
      .autocapitalization(.none)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func passwordSecureField() -> some View {
     SecureField("Password", text: $password)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func confirmPasswordSecureField() -> some View {
    SecureField("Confirm Password", text: $confirmPassword)
      .textFieldStyle(RoundedBorderTextFieldStyle())
  }
  
  fileprivate func moreAboutYouTextEditor() -> some View {
    VStack(alignment: .leading) {
      Text("Tell me more about you")
        .foregroundColor(.text)
      TextEditor(text: $moreAboutYou)
        .frame(height: 100, alignment: .topLeading)
        .disableAutocorrection(true)
        .padding(8)
        .overlay(RoundedRectangle(cornerRadius: 6)
                  .stroke(Color.gray.opacity(0.3), lineWidth: 1))
    }
  }
  
  fileprivate func registerButton() -> some View {
    NavigationLink(destination: HomeView()) {
      Text("REGISTER")
        .textStyle(GradientButtonStyle())
        .padding(.horizontal, -20)
        .padding(.bottom)
    }
  }
  
  var body: some View {
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
      }
      .navigationTitle("Complete your profile")
    }
}

struct RegisterProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterProfileView()
    }
}
