//
//  MiniPlayer.swift
//  AppleMusicAnimations
//
//  Created by Luan Nguyen on 10/12/2020.
//

import SwiftUI

struct MiniPlayer: View {
    // MARK: - PROPERTIES
    var animation: Namespace.ID

    @Binding var expand: Bool

    var height = UIScreen.main.bounds.height / 3
    
    // Safearea
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    // Volume Slider
    @State var volume: CGFloat = 0
    
    // Gesture Offset
    @State var offset: CGFloat = 0
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: expand ? 60 : 0, height: expand ? 4 : 0)
                .opacity(expand ? 1 : 0)
                .padding(.top,expand ? safeArea?.top : 0)
                .padding(.vertical,expand ? 30 : 0)
            
            HStack(spacing: 15) {
                // Centering Images
                if expand { Spacer(minLength: 0) }

                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: expand ? height : 55, height: expand ? height : 55)
                    .cornerRadius(15)
                
                if !expand {
                    Text("Lady Gaga")
                        .font(.title2)
                        .fontWeight(.bold)
                        .matchedGeometryEffect(id: "Label", in: animation)
                }
                
                Spacer(minLength: 0)
                
                if !expand {
                    Button(action: {}, label: {
                        Image(systemName: "play.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                    
                    Button(action: {}, label: {
                        Image(systemName: "forward.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                }
            } //: HSTACK
            .padding(.horizontal)
            
            VStack(spacing: 15) {

                Spacer(minLength: 0)
                
                HStack {
                    if expand {
                        Text("Lady Gaga")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "Label", in: animation)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                } //: HSTACK
                .padding()
                .padding(.top,20)
                // Live String
                HStack {
                    Capsule()
                        .fill(
                            LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.7),Color.primary.opacity(0.1)]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(height: 4)
                    
                    Text("LIVE")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Capsule()
                        .fill(
                            LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.1),Color.primary.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)
                        )
                        .frame(height: 4)
                } //: HSTACK
                .padding()
                // Stop Button
                Button(action: {}) {
                    Image(systemName: "stop.fill")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }
                .padding()
                
                Spacer(minLength: 0)
                
                HStack(spacing: 15) {
                    Image(systemName: "speaker.fill")
                    Slider(value: $volume)
                    Image(systemName: "speaker.wave.2.fill")
                } //: HSTACK
                .padding()
                
                HStack(spacing: 22) {
                    Button(action: {}) {
                        Image(systemName: "arrow.up.message")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                } //: HSTACK
                .padding(.bottom,safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
            }
            // This will give strech effect
            .frame(height: expand ? nil : 0)
            .opacity(expand ? 1 : 0)
        } //: VSTACK
        // Expanding to full screen when clicked
        .frame(maxHeight: expand ? .infinity : 80)
        // Moving the MiniPlayer above the tabbar
        // Approz tab bar height is 49
        // Divider Line For Separting MiniPlayer And Tab Bar
        .background(
            VStack(spacing: 0) {
                BlurView()
                Divider()
            } //: VSTACK
            .onTapGesture(perform: {
                withAnimation(.spring()){ expand = true }
            })
        )
        .cornerRadius(expand ? 20 : 0)
        .offset(y: expand ? 0 : -48)
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onended(value:)).onChanged(onchanged(value:)))
        .ignoresSafeArea()
    }
    
    func onchanged(value: DragGesture.Value) {
        // Only allowing when its expanded
        if value.translation.height > 0 && expand {
            offset = value.translation.height
        }
    }
    
    func onended(value: DragGesture.Value) {
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            // if value is > than height / 3 then closing view
            if value.translation.height > height {
                expand = false
            }
            offset = 0
        }
    }
}
