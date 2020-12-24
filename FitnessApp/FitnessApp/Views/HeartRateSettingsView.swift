//
//  HeartRateSettingsView.swift
//  FitnessApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct HeartRateSettingsView: View {
    var body: some View {
        HStack(spacing: 0) {
            InfoView()
            ControlView()
                .frame(width: 100)
        }
        .padding(.top, 50)
        .background(ColorConstants.heartRateBackground)
        .edgesIgnoringSafeArea(.all)
        .environmentObject(HeartRateManager())
    }
}

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var status = true
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    BackButtonView()
                })
                
                VStack(alignment: .leading) {
                    Text("Back to")
                        .foregroundColor(ColorConstants.textCircleSecendary)
                    Text("settings")
                        .foregroundColor(.white)
                        .bold()
                }
                Spacer()
            }
            
            Text("Heart\nLimit")
                .font(.system(size: 50))
                .bold()
                .foregroundColor(.white)
                .padding(.top, 50)
            
            Text("Set a heart rate limit \nfor timely control")
                .font(.system(size: 14))
                .foregroundColor(ColorConstants.textCircleSecendary)
            
            HeartRateOptionView()
            
            Spacer()
            
            Toggle(isOn: $status) {
                Text("Notification")
                    .font(.caption)
                    .foregroundColor(ColorConstants.textCircleSecendary)
            }.toggleStyle(CustomToggleStyle())

                
        }
        .padding(.leading, 30)
        .padding(.bottom, 40)
    }
}

struct HeartRateOptionView: View {
    @EnvironmentObject var manager: HeartRateManager
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.clear)
                    .invertedRectangleNeomorphify(
                        topBlur: 6,
                        bottomBlur: 8,
                        cornerRadius: 40)
                    .frame(width: 170, height: 170)
                    .padding(.top, 16)
                
                VStack {
                    Text("\(manager.menus[manager.lastSelectedMenuIndex].currentValue)")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundColor(.white)
                    Text("bpm")
                        .foregroundColor(ColorConstants.textCircleSecendary)
                }
            }
            
            HStack(spacing: 30) {
                ForEach(manager.menus) { menu in
                    OptionMenuView(menu: menu)
                        .onTapGesture{
                            manager.selectMenu(index: menu.id)
                        }
                }
            }
            .onAppear {
                manager.selectMenu(index: 1)
            }
        }
        
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.clear)
                        .frame(width: 60, height: 40)
                        .invertedRectangleMiddleNeomorphify()
                    
                    Group {
                        Circle()
                            .fill(configuration.isOn ? ColorConstants.selectedColor : ColorConstants.toggleUnselected)
                            .frame(width: 25, height: 25)
                        ThumbView(width: 9, spacing: 4)
                            .foregroundColor(ColorConstants.heartRateBackground)
                    }
                    .offset(x: configuration.isOn ? 13 : -13)
                    
                }
                .padding(.trailing, 10)
                
                configuration.label
            }
            .onTapGesture {
                withAnimation {
                    configuration.isOn.toggle()
                }
            }
    }
}

struct ThumbView: View {
    let width: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        VStack(spacing: spacing) {
            Rectangle()
                .frame(width: width, height: 1)
            Rectangle()
                .frame(width: width, height: 1)
        }
    }
}

struct OptionMenuView: View {
    let menu: Models.HeartRateMenu
    
    var body: some View {
        VStack(spacing: 4) {
            Text(menu.name)
                .foregroundColor(menu.selected ? Color.white: ColorConstants.textCircleSecendary)
            Rectangle()
                .fill(ColorConstants.selectedColor)
                .frame(width: 40, height: 2)
                .shadow(color: ColorConstants.selectedColor, radius: 8)
                .opacity(menu.selected ? 1.0 : 0.0)
        }
    }
}

struct BackButtonView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(ColorConstants.graphUnselected)
                .frame(width: 44, height: 60)
                .shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
            
            HStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 5, height: 5)
                VStack(spacing: 16) {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                    Circle()
                        .fill(Color.white)
                        .frame(width: 5, height: 5)
                }
            }
        }
    }
}

struct ControlView: View {
    @EnvironmentObject var manager: HeartRateManager
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(ColorConstants.hexagonLinearInverted)
                    .frame(width: 50, height: 50)
                Text("i")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
            }
            
            VerticalSlider(bpm: $manager.menus[manager.lastSelectedMenuIndex].currentValue)
        }
    }
}

struct VerticalSlider: View {
    @State var progress: CGFloat = -0.1
    let minProgress: CGFloat = 0.07
    let maxProgress: CGFloat = 1.0
    let step: CGFloat = 0.05
    @Binding var bpm: Int
    
    var body: some View {
        GeometryReader { geomemtry in
            ZStack {
                SliderShape(progress: progress, step: step)
                    .fill(ColorConstants.whiteToDarkGrayLinear)
                    .clipShape(Rectangle())
                    .gesture(DragGesture(minimumDistance: 5)
                                .onChanged { value in
                                    let nextProgress = 1 - (value.location.y / geomemtry.size.height)
                                    updateBPM(nextProgress: nextProgress)
                                }
                    )
                    .onAppear {
                        updateInitialProgress()
                    }
                
                ThumbView(width: 18, spacing: 6)
                    .offset(y: calculateThumbPosition(height: geomemtry.size.height))
                
                Rectangle()
                    .fill(ColorConstants.textCirclePrimary)
                    .frame(width: 2, height: 16)
                    .offset(
                        x: -geomemtry.size.width/2,
                        y: calculateThumbPosition(height: geomemtry.size.height))
                
                Rectangle()
                    .fill(ColorConstants.textCircleSecendary)
                    .frame(width: 2, height: 16)
                    .offset(
                        x: -geomemtry.size.width/2,
                        y: calculateThumbPosition(height: geomemtry.size.height, forProgress: minProgress))
                
                Rectangle()
                    .fill(ColorConstants.selectedColor)
                    .frame(width: 2, height: 16)
                    .offset(
                        x: -geomemtry.size.width/2,
                        y: calculateThumbPosition(height: geomemtry.size.height, forProgress: maxProgress))
            }
        }
    }
    
    public func updateInitialProgress() {
        progress = CGFloat(bpm)/250
    }
    
    func updateBPM(nextProgress: CGFloat) {
        if (nextProgress >= minProgress && nextProgress <= maxProgress) {
            let stepProgress = round(nextProgress / step) * step
            progress = max(minProgress, stepProgress)
            bpm = Int(progress * 250)
        }
    }
    
    func calculateThumbPosition(height: CGFloat) -> CGFloat {
        var position: CGFloat
        let progressFromMiddle = 0.5 - progress
        position = (progressFromMiddle * height) + 15
        return position
    }
    
    func calculateThumbPosition(height: CGFloat, forProgress: CGFloat) -> CGFloat {
        var position: CGFloat
        let progressFromMiddle = 0.5 - forProgress
        position = (progressFromMiddle * height) + 15
        return position
    }
}

struct SliderShape: Shape {
    var progress: CGFloat
    let step: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let gap: CGFloat = 8
        
        let progressHeight = height * (1 - progress)
        let stepCount = 1/step
        let gapHeight = (stepCount - 1) * gap
        let stepHeight = (height - gapHeight) / stepCount
        let progressStep = progress / step
        
        path.move(to: CGPoint(x: 0, y: progressHeight))
        
        var y = progressHeight
        
        for _ in stride(from: 0, to: progressStep, by: 1) {
            path.addRect(CGRect(
                            x: 0,
                            y: y,
                            width: width,
                            height: stepHeight))
            y += (stepHeight + gap)
        }
        
        return path
    }
}

struct HeartRateSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateSettingsView()
    }
}
