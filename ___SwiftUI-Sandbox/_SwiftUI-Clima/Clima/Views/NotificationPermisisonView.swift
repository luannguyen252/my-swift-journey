//
//  NotificationPermisisonView.swift
//  Clima
//
//  Created by mohammad mugish on 29/01/21.
//

import SwiftUI

struct NotificationPermisisonView: View {
    
    @ObservedObject var notificatoinManager : NotificationManager
    
    var body: some View {
        
        VStack {
            Image("bell-notification")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 8)
            Spacer()
            VStack(spacing : 20){
            Text("Can we notify you ?")
                .font(.system(size: 30, weight: .bold, design: .default))
            Text("Please allow us to send you notifications for weather alert")
                .font(.system(size: 18, weight: .regular, design: .default))
                .multilineTextAlignment(.center)
            }.padding(24)
            Spacer()
            Button(action : {
                notificatoinManager.requestForNotificationAuthorization()
            }){
                Text("Allow")
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .frame(width: UIScreen.main.bounds.width - 40, height: 42, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4060639881)))
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0.0, y: 0.0)
                    .padding(.bottom)
            }
         
        }
            
            
    }
}

struct NotificationPermisisonView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPermisisonView(notificatoinManager: NotificationManager())
    }
}
