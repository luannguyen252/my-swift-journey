//
//  ContentView.swift
//  Cybertruck
//
//  Created by Anik on 19/8/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                WelcomeView()
                //DashboardView()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .background(Color.backgroundColor)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DashboardView: View {
    
    var body: some View {
        ZStack {
            VStack {
                DashboardTopView()
                
                Image("cyber_tuck_4")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 40)
                
                StatusView()
                
                InformationView()
                    .padding(.top, 30)
                
                HStack {
                    Text("Navigation")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.textPrimary)
                    
                    Spacer()
                    
                    Text("History")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.buttonTintColor)
                }
                .padding(.top, 10)

                Spacer()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            VStack {
                Spacer()
                ACControlView()
            }
        }
        .background(Color.backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ACControlView: View {
    @State var barHeight: CGFloat = 655
    let swipeBarHeight: CGFloat = 655
    let radius: CGFloat = 110
    let knobRadius: CGFloat = 20
    let strokeWidth: CGFloat = 40
    
    @State var progress: CGFloat = 15.0
    @State var angleValue: CGFloat = 0.0
    let config = CircularProgressConfig(minimumValue: 0, maximumValue: 40, totalValue: 40)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(Color.backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.backgroundBorderColor, lineWidth: 2)
                )
            
            VStack {
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.sliderIndicator)
                    .frame(width: 60, height: 4)
                
                ACQuickControl()
                
                ZStack {
                    ProgressBackgroundView(radius: radius)
                    Circle()
                        .trim(from: 0.0, to: progress/config.totalValue)
                        .stroke(Color.blueIndicaor, style: StrokeStyle(lineWidth: strokeWidth + 5, lineCap: .round))
                        .frame(width: radius * 2, height: radius * 2)
                        .rotationEffect(.degrees(90))
                    
                    KnobView(radius: knobRadius)
                        .offset(y: -radius)
                        .rotationEffect(.degrees(Double(angleValue)))
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: -4)
                        .gesture(DragGesture(minimumDistance: 10)
                                    .onChanged({ value in
                                        self.changeProgress(locaton: value.location)
                                    })
                        )
                        .rotationEffect(.degrees(180))
                    
                    ProgressIndicatorsView(progress: $progress, totalValue: config.totalValue)
                        .rotationEffect(.degrees(90))
                    
                    VStack {
                        Text("\(String.init(format: "%.0f", progress))℃")
                            .font(.system(size: 36, weight: .black))
                            .foregroundColor(.textPrimary)
                        
                        Text(progress > 25 ? "Heating..." : "Cooling...")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.textPrimary)
                    }
                }
                .padding(.top, 60)
                
                //fan slider
                FanSliderView()
                    .padding(.top, 70)
                //fan mode
                FanModeView()
                    .padding(.top, 20)
                Spacer()
            }
            .padding(.top, 16)
            .padding(.leading, 20)
            .padding(.trailing, 20)
                
        }
        .frame(height: 770)
        .offset(y: barHeight)
        .gesture(DragGesture(minimumDistance: 10)
                    .onChanged({ value in
                        updateBarHeight(height: value.translation.height)
                    })
                    .onEnded({ value in
                        finishUpdateBarHeight(height: value.translation.height)
                    })
        )
       // .animation(.spring())
        .onAppear {
            updateInitialValue()
        }
    }
    
    private func updateInitialValue() {
        angleValue = CGFloat(progress/config.totalValue) * 360
    }
    
    private func changeProgress(locaton: CGPoint) {
        let vector = CGVector(dx: locaton.x, dy: locaton.y)
        let angle = atan2(vector.dy - knobRadius, vector.dx - knobRadius) + .pi/2.0
        
        let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
        let value = fixedAngle / (2.0 * .pi) * config.totalValue
        
        if value > config.minimumValue && value < config.maximumValue {
            progress = value
            angleValue = fixedAngle * 180 / .pi
        }
    }
    
    private func updateBarHeight(height: CGFloat) {
        barHeight = height > 0 ? height : swipeBarHeight + height
    }
    
    private func finishUpdateBarHeight(height: CGFloat) {
        if height > 0 {
            barHeight = height > 320 ? swipeBarHeight : 0
        } else {
            barHeight = height < -320 ? 0 : swipeBarHeight
        }
    }
}

struct FanSliderView: View {
    var body: some View {
        VStack {
            Text("Fan speed")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.textPrimary)
            
            GeometryReader { geometry in
                FanSlider(width: geometry.size.width)
                    .padding(.top, 6)
            }
            .frame(height: 50)
        }
    }
}

struct FanSlider: View {
    @State var progress: CGFloat = 0.0
    @State var knobPosition: CGFloat = 0.0
    let sliderConfig = FanSliderConfig()
    let width: CGFloat
    
    var body: some View {
        VStack {
            HStack {
                ForEach(1...5, id: \.self) { i in
                    Text("\(i)")
                    if i != 5 {
                        Spacer()
                    }
                }
            }
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(.buttonTintColor)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.darkShadow)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.black.opacity(0.95))
                            .blur(radius: 5)
                            .mask(RoundedRectangle(cornerRadius: 5))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.sliderTopShadow)
                            .blur(radius: 3)
                            .offset(y: 6)
                            .mask(RoundedRectangle(cornerRadius: 5))
                    )
                    .frame(height: 9)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blueIndicaor)
                    .frame(width: knobPosition, height: 9)
                
                KnobView(radius: sliderConfig.knobRadius)
                    .offset(x: knobPosition)
                    .gesture(DragGesture(minimumDistance: 0)
                                .onChanged({ value in
                                    calculateProgressWidth(xLocation: value.location.x)
                                })
                                .onEnded({ value in
                                    calculateStep(xLocation: value.location.x)
                                })
                    )
            }
        }
    }
    
    func calculateInitialKnobPosition() {
        progress = sliderConfig.minimumValue
        knobPosition = (progress * width) - knobPosition
    }
    
    func calculateProgressWidth(xLocation: CGFloat) {
        let tempProgress = xLocation/width
        if tempProgress > 0 && tempProgress <= 1 {
            progress = (tempProgress * (sliderConfig.maximumValue - sliderConfig.minimumValue)) + sliderConfig.minimumValue
            let tempPosition = (tempProgress * width) - sliderConfig.knobRadius
            knobPosition = tempPosition > 0 ? tempPosition : 0
        }
    }
    
    func calculateStep(xLocation: CGFloat) {
        let tempProgress = xLocation/width
        if tempProgress >= 0 && tempProgress <= 1 {
            var roundedProgress = (tempProgress * (sliderConfig.maximumValue - sliderConfig.minimumValue)) + sliderConfig.minimumValue
            roundedProgress = roundedProgress.rounded()
            progress = roundedProgress
            
            let updatedTempProgress = (roundedProgress - sliderConfig.minimumValue) / (sliderConfig.maximumValue - sliderConfig.minimumValue)
            knobPosition = updatedTempProgress == 0 ? 0 : (updatedTempProgress * width) - sliderConfig.knobRadius
           // print(updatedTempProgress)
        }
    }
}

struct FanSliderConfig {
    let minimumValue: CGFloat = 1.0
    let maximumValue: CGFloat = 5.0
    let knobRadius: CGFloat = 14
}

struct FanModeView: View {
    var body: some View {
        VStack {
            Text("Mode")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.textPrimary)
            
            ModeTabView()
                .padding(.top, 10)
        }
    }
}

struct ModeTabView: View {
    @ObservedObject var modeManager = ACModeManager()
    var body: some View {
        HStack(spacing: 20) {
            ForEach(modeManager.modeData) { mode in
                ModeItemView(mode: mode)
                    .onTapGesture {
                        modeManager.selectMode(index: mode.id)
                    }
            }
        }
    }
}

struct ModeItemView: View {
    let mode: ACMode
    var body: some View {
        VStack() {
            Text(mode.title)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.buttonTintColor)
            Image(mode.imageName)
                .renderingMode(.template)
                .foregroundColor(mode.selected ? .white : .gray)
                .frame(width: 28, height: 28)
                .padding(22)
                .background(ACModeBackground(shape: Circle(), isHighlighted: mode.selected))
        }
    }
}

struct ACModeBackground<S: Shape>: View {
    var shape: S
    var isHighlighted: Bool
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(Color.blueButtonBackground)
                    .overlay(
                        shape.stroke(Color.blueButtonBorder, lineWidth: 2)
                    )
                    .shadow(color: .black, radius: 10, x: 7, y: 7)
                    .shadow(color: .darkStart, radius: 10, x: -7, y: -7)
            } else {
                shape
                    .fill(Color.buttonBackground)
                    .overlay(
                        shape.stroke(Color.buttonSelectedEnd, lineWidth: 2)
                    )
                    .shadow(color: .black, radius: 10, x: 7, y: 7)
                    .shadow(color: .darkStart, radius: 10, x: -7, y: -7)
            }
        }
    }
}

struct ACMode: Identifiable {
    let id: Int
    let title: String
    let imageName: String
    var selected: Bool = false
}

struct Data {
    static let data = [
        ACMode(id: 0, title: "Auto", imageName: "A"),
        ACMode(id: 1, title: "Dry", imageName: "dry"),
        ACMode(id: 2, title: "Cool", imageName: "cool"),
        ACMode(id: 3, title: "Program", imageName: "program"),
    ]
}

class ACModeManager: ObservableObject {
    @Published var modeData = Data.data
    @Published var selectedIndex = -1
    
    func selectMode(index: Int) {
        if selectedIndex != index {
            modeData[index].selected = true
            if selectedIndex != -1 {
                modeData[selectedIndex].selected = false
            }
            selectedIndex = index
        }
    }
}

struct CircularProgressConfig {
    let minimumValue: CGFloat
    let maximumValue: CGFloat
    let totalValue: CGFloat
}

struct ProgressIndicatorsView: View {
    @Binding var progress: CGFloat
    let totalValue: CGFloat
    let indicatorCount = 8
    var body: some View {
        ZStack {
            ForEach(Array(stride(from: 0, to: indicatorCount, by: 1)), id: \.self) { i in
                IndicatorView(
                    isOn: progress >= CGFloat(i) * totalValue/CGFloat(indicatorCount),
                    offsetValue: 160)
                    .rotationEffect(.degrees(Double(i * 360/indicatorCount)))
            }
        }
    }
}

struct IndicatorView: View {
    let isOn: Bool
    let offsetValue: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(isOn ? Color.blueIndicaor : Color.sliderIndicator)
            .frame(width: 15, height: 3)
            .offset(x: offsetValue)
    }
}

struct ProgressBackgroundView: View {
    let radius: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.sliderBackgroundEnd)
                .frame(width: radius * 2, height: radius * 2)
                .scaleEffect(1.3)
                .shadow(color: .sliderTopShadow, radius: 30, x: -20, y: -20)
                .shadow(color: .sliderBottomShadow, radius: 30, x: 20, y: 20)
            
            Circle()
                .stroke(Color.sliderInnerBackground, lineWidth: 52)
                .frame(width: radius * 2, height: radius * 2)
        }
    }
}

struct KnobView: View {
    let radius: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.knobLinear)
                .frame(width: radius * 2, height: radius * 2)
            
            Circle()
                .fill(Color.blueIndicaor)
                .frame(width: 4, height: 4)
        }
    }
}

struct InformationView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Information")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.textPrimary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    InformationItemView(informationItem: InformationItem(title: "Engine", image: "circle", value: "Sleeping mode", isOn: false))
                    
                    InformationItemView(informationItem: InformationItem(title: "Climate", image: "rectangle", value: "A/C is on", isOn: true))
                    
                    InformationItemView(informationItem: InformationItem(title: "Tire", image: "triangle_1", value: "Low pressure", isOn: true))
                }
            }
        }
    }
}

struct InformationItemView: View {
    let informationItem: InformationItem
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.infoBackground)
                .frame(width: 150, height: 160)
                .shadow(color: .infoShadowTop, radius: 20, x: 14, y: 14)
                .shadow(color: .infoShadowBottom, radius: 20, x: -7, y: -7)
            
            Image(informationItem.image)
            
            VStack(alignment: .leading) {
                Circle()
                    .fill(Color.onCircle)
                    .frame(width: 4, height: 4)
                    .shadow(color: .onCircleShadow, radius: 8)
                    .opacity(informationItem.isOn ? 1.0 : 0.0)
                
                Spacer()
                
                Text(informationItem.title)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.textPrimary)
                Text(informationItem.value)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.buttonTintColor)
            }
            .padding(.top, 16)
            .padding(.bottom, 16)
            .padding(.leading, 16)
        }
        .frame(height: 160)
    }
}

struct StatusItemView: View {
    let statusItem: StatusItem
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Image(statusItem.image)
            VStack(alignment: .leading, spacing: 8) {
                Text(statusItem.title)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.buttonTintColor)
                Text(statusItem.value)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.textPrimary)
            }
        }
    }
}

struct StatusItem {
    let title: String
    let image: String
    let value: String
}

struct InformationItem {
    let title: String
    let image: String
    let value: String
    var isOn: Bool
}

extension Color {
    static let buttonTintColor          = Color.init(red: 127/255, green: 132/255, blue: 137/255)
    static let textPrimary              = Color.init(red: 253/255, green: 253/255, blue: 253/255)
    
    static let darkStart                = Color.init(red: 47/255, green: 53/255, blue: 58/255)
    static let darkEnd                  = Color.init(red: 28/255, green: 31/255, blue: 34/255)
    
    static let darkShadow               = Color.init(red: 31/255, green: 36/255, blue: 39/255)
    static let lightShadow              = Color.init(red: 72/255, green: 80/255, blue: 87/255)

    static let buttonSelectedStart      = Color.init(red: 29/255, green: 35/255, blue: 40/255)
    static let buttonSelectedEnd        = Color.init(red: 19/255, green: 19/255, blue: 20/255)
    
    static let blueButtonBorderStart    = Color.init(red: 17/255, green: 168/255, blue: 253/255)
    static let blueButtonBorderEnd      = Color.init(red: 0/255, green: 94/255, blue: 163/255)
    
    static let backgroundStart          = Color.init(red: 53/255, green: 58/255, blue: 64/255)
    static let backgroundEnd            = Color.init(red: 22/255, green: 23/255, blue: 27/255)
    
    static let backgroundBorderStart    = Color.init(red: 66/255, green: 71/255, blue: 80/255)
    static let backgroundBorderEnd      = Color.init(red: 32/255, green: 35/255, blue: 38/255)
    
    static let blueButtonStart          = Color.init(red: 0/255, green: 94/255, blue: 163/255)
    static let blueButtonEnd            = Color.init(red: 17/255, green: 168/255, blue: 253/255)
    
    static let sliderIndicator          = Color.init(red: 23/255, green: 24/255, blue: 28/255)
    static let sliderIndicatorShadow    = Color.init(red: 83/255, green: 89/255, blue: 96/255)

    static let sliderBackgroundEnd      = Color.init(red: 19/255, green: 19/255, blue: 20/255)
    static let sliderInnerBackground    = Color.init(red: 31/255, green: 33/255, blue: 36/255)
    
    static let sliderTopShadow          = Color.init(red: 72/255, green: 80/255, blue: 87/255)
    static let sliderBottomShadow       = Color.init(red: 20/255, green: 20/255, blue: 21/255)
    
    static let blueIndicaorShadow       = Color.init(red: 10/255, green: 138/255, blue: 218/255)
    static let blueIndicaor             = Color.init(red: 14/255, green: 155/255, blue: 239/255)
    
    static let knobStart                = Color.init(red: 20/255, green: 21/255, blue: 21/255)
    static let knobEnd                  = Color.init(red: 46/255, green: 50/255, blue: 54/255)
    
    static let infoBackground           = Color.init(red: 31/255, green: 35/255, blue: 40/255)
    static let infoShadowTop            = Color.init(red: 16/255, green: 16/255, blue: 18/255)
    static let infoShadowBottom         = Color.init(red: 38/255, green: 46/255, blue: 50/255)
    
    static let onCircle                 = Color.init(red: 1/255, green: 114/255, blue: 190/255)
    static let onCircleShadow           = Color.init(red: 10/255, green: 141/255, blue: 221/255)
    
    static let knobLinear = LinearGradient(
        gradient: Gradient(
            colors: [knobStart,knobEnd]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)

    static let buttonSelectedBackground = LinearGradient(
        gradient: Gradient(
            colors: [buttonSelectedStart,buttonSelectedEnd]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let buttonSelectedReverseBackground = LinearGradient(
        gradient: Gradient(
            colors: [buttonSelectedEnd,buttonSelectedStart]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let buttonBackground = LinearGradient(
        gradient: Gradient(
            colors: [darkStart,darkEnd]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let blueButtonBorder = LinearGradient(
        gradient: Gradient(
            colors: [blueButtonBorderStart,blueButtonBorderEnd]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    
    static let backgroundColor = LinearGradient(
        gradient: Gradient(
            colors: [backgroundStart, backgroundEnd]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let backgroundBorderColor = LinearGradient(
        gradient: Gradient(
            colors: [backgroundBorderStart, backgroundBorderEnd]),
        startPoint: .top,
        endPoint: .bottom)
    
    static let blueButtonBackground = LinearGradient(
        gradient: Gradient(
            colors: [blueButtonStart, blueButtonEnd]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DashboardTopView: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        HStack {
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Image("menu")
            })
            .buttonStyle(DarkButtonStyle())
            
            Spacer()
            
            VStack {
                Text("Tesla")
                    .font(.system(size: 18))
                    .foregroundColor(.buttonTintColor)
                Text("Cybertruck")
                    .font(.system(size: 18, weight: .black))
                    .foregroundColor(.textPrimary)
            }
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Image("profile")
            })
            .buttonStyle(DarkButtonStyle())
        }
        .padding(.top, 44)
    }
}

struct StatusView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Status")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.textPrimary)
            
            HStack(spacing: 30) {
                StatusItemView(statusItem: StatusItem(title: "Battery", image: "battery", value: "54%"))
                
                StatusItemView(statusItem: StatusItem(title: "Range", image: "range", value: "297 km"))
                
                StatusItemView(statusItem: StatusItem(title: "Temperture", image: "temerature", value: "27℃"))
                
                Spacer()
            }
        }
    }
}

struct ACQuickControl: View {
    @State var status = true
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(status ? "A/C is ON" : "A/C is OFF")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.textPrimary)
                Text(status ? "Tap to turn off or swipe up \nfor a fast setup" : "Tap to turn on or swipe up \nfor a fast setup")
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.buttonTintColor)
            }
            
            Spacer()
            
            Toggle(isOn: $status, label: {
                Image("power")
            })
            .toggleStyle(CustomToggleStyle(diameter: 70))
        }
    }
}
