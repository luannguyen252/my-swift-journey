//
//  DetailView.swift
//  MyContacts
//
//  Created by Andreas Schultz on 08.10.20.
//

import SwiftUI

struct DetailView: View {
    
    let contact: Contact
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .shadow(radius: 3)
            Text(contact.name)
                .font(.title)
                .fontWeight(.medium)
            Form {
                HStack {
                    Text("Phone")
                    Spacer()
                    Text(contact.phone)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                HStack {
                    Text("Email")
                    Spacer()
                    Text(contact.email)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                HStack {
                    Text("Address")
                    Spacer()
                    Text(contact.address)
                        .foregroundColor(.gray)
                        .font(.callout)
                        .frame(width: 180)
                }
                Section {
                    Button(action: {
                        print("Send message")
                    }) {
                        Text("Send message")
                    }
                    Button(action: {
                        // print("Call")
//                        let tel = "tel://"
//                        let formattedString = tel + contact.phone
//                            guard let url = URL(string: formattedString) else { return }
//                            UIApplication.shared.open(url)
                        callNumber(phoneNumber: contact.phone)
                    }) {
                        Text("Call")
                    }
                }
            }
        }
    }
}

private func callNumber(phoneNumber: String) {
  if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
    let application:UIApplication = UIApplication.shared
    if (application.canOpenURL(phoneCallURL)) {
        application.open(phoneCallURL, options: [:], completionHandler: nil)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: contacts[0])
    }
}
