import Foundation
import SwiftUI
import UIKit

// STARTUP/GET STARTED SHEET, PRESENTED WHEN PLAYGROUND IS FIRST RUN
public struct StartupView : View {
    @Binding var isStartupPresented: Bool
    
    public init(_ isStartupPresented: Binding<Bool>) {
        self._isStartupPresented = isStartupPresented
    }

    
    public var body : some View {
        VStack {
            VStack(alignment: .leading) {
                // DISPLAY THE MAIN ONBOARDING IMAGE
                // IMAGE CREDITS: UNDRAW.CO
                VStack(alignment: .center) {
                    Image(uiImage: UIImage(named: "MentalHealthStartupImage.png")!)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                
                // BOTTOM SECTION, FOR HEADING, DESCRIPTION, AND GET STARTED BUTTON
                VStack(alignment: .leading) {
                    // HEADING
                    Text("Mental Health")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    
                    // DESCRIPTION OF PLAYGROUND
                    Text("Mental health is a very important aspect of our lives. The exercises in this playground are meant to help your mind and emotions.")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16, weight: .regular, design: .rounded))
                        .lineSpacing(17)
                        .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.6))
                        .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
                    
                    // USE SPACER TO MOVE GET STARTED BUTTON TO BOTTOM
                    Spacer()
                    
                    // CONTAINER WITH GET STARTED BUTTON
                    VStack(alignment: .center) {
                        Button(action: {self.isStartupPresented = false}) {
                            Text("Get Started")
                                .padding(EdgeInsets(top: 15, leading: 35, bottom: 15, trailing: 35))
                                .foregroundColor(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.9))
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                        }
                        .background(Color(red: 95 / 255, green: 39 / 255, blue: 205 / 255, opacity: 0.1))
                        .cornerRadius(5)
                        .accessibility(value: Text("Get Started"))
                        .accessibility(hint: Text("Closes startup modal."))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
