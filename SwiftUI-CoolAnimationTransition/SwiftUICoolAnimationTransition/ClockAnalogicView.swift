//
//  ClockAnalogicView.swift
//  SwiftUICoolAnimationTransition
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

struct ClockAnalogicView: View {
    @State private var time: ClockTime = ClockTime(9, 50, 5)
    @State private var duration: Double = 2.0

    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                GeometryReader { geometry in
                    ClockHours(radius: Double(min(geometry.size.width / 2.0, geometry.size.height / 2.0)) - 50)
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)

                    ClockShape(clockTime: self.time)
                        .stroke(Color.black, lineWidth: 3)
                        .padding(20)
                        .animation(.easeInOut(duration: self.duration))
                        .layoutPriority(1)
                }
            }
            .padding()

            Text("\(time.asString())")

            Spacer()

            HStack(spacing: 20) {
                Button(action: {
                    self.duration = 2.0
                    self.time = ClockTime(9, 51, 45)
                }, label: {
                    Text("9:51:45")
                })

                Button(action: {
                    self.duration = 2.0
                    self.time = ClockTime(9, 51, 15)
                }, label: {
                    Text("9:51:15")
                })

                Button(action: {
                    self.duration = 2.0
                    self.time = ClockTime(9, 52, 15)
                }, label: {
                    Text("9:52:15")
                })

                Button(action: {
                    self.duration = 10.0
                    self.time = ClockTime(10, 01, 45)
                }, label: {
                    Text("10:01:45")
                })
            }
        }
        .navigationBarTitle("Example 5").padding(.bottom, 50)
    }
}

struct ClockAnalogicView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClockAnalogicView()
        }
    }
}


struct ClockShape: Shape {
    var clockTime: ClockTime

    var animatableData: ClockTime {
        get { clockTime }
        set { clockTime = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let radius = min(rect.size.width / 2.0, rect.size.height / 2.0)
        let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)

        let hHypotenuse = Double(radius) * 0.5 // hour needle length
        let mHypotenuse = Double(radius) * 0.7 // minute needle length
        let sHypotenuse = Double(radius) * 0.9 // second needle length

        let hAngle: Angle = .degrees(Double(clockTime.hours) / 12 * 360 - 90)
        let mAngle: Angle = .degrees(Double(clockTime.minutes) / 60 * 360 - 90)
        let sAngle: Angle = .degrees(Double(clockTime.seconds) / 60 * 360 - 90)

        let hourNeedle = CGPoint(x: center.x + CGFloat(cos(hAngle.radians) * hHypotenuse), y: center.y + CGFloat(sin(hAngle.radians) * hHypotenuse))
        let minuteNeedle = CGPoint(x: center.x + CGFloat(cos(mAngle.radians) * mHypotenuse), y: center.y + CGFloat(sin(mAngle.radians) * mHypotenuse))
        let secondNeedle = CGPoint(x: center.x + CGFloat(cos(sAngle.radians) * sHypotenuse), y: center.y + CGFloat(sin(sAngle.radians) * sHypotenuse))

        path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)

        path.move(to: center)
        path.addLine(to: hourNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 3.0))

        path.move(to: center)
        path.addLine(to: minuteNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 3.0))

        path.move(to: center)
        path.addLine(to: secondNeedle)
        path = path.strokedPath(StrokeStyle(lineWidth: 1.0))

        return path
    }
}

struct ClockHours: View {
    var radius: Double
    private var coordinates: [CGSize] = []
    private var hours: [Int] = []

    init(radius: Double) {
        self.radius = radius

        for i in 0...12 {

            let hour = (i + 3) % 12;
            self.hours.append(hour)

            let theta = Double(i) / 6.0 * .pi;
            let x = radius * cos(theta)
            let y = radius * sin(theta)
            coordinates.append(CGSize(width: x, height: y))
        }
    }

    var body: some View {
        ZStack {
            ForEach(0..<self.coordinates.count, id: \.self) { (index) in
                Text("\(self.hours[index])")
                    .offset(self.coordinates[index])
            }
        }
    }
}

struct ClockTime {
    var hours: Int      // Hour needle should jump by integer numbers
    var minutes: Int    // Minute needle should jump by integer numbers
    var seconds: Double // Second needle should move smoothly

    // Initializer with hour, minute and seconds
    init(_ h: Int, _ m: Int, _ s: Double) {
        self.hours = h
        self.minutes = m
        self.seconds = s
    }

    // Initializer with total of seconds
    init(_ seconds: Double) {
        let h = Int(seconds) / 3600
        let m = (Int(seconds) - (h * 3600)) / 60
        let s = seconds - Double((h * 3600) + (m * 60))

        self.hours = h
        self.minutes = m
        self.seconds = s
    }

    // compute number of seconds
    var asSeconds: Double {
        return Double(self.hours * 3600 + self.minutes * 60) + self.seconds
    }

    // show as string
    func asString() -> String {
        return String(format: "%2i", self.hours) + ":" + String(format: "%02i", self.minutes) + ":" + String(format: "%02.0f", self.seconds)
    }
}

extension ClockTime: VectorArithmetic {
    static func -= (lhs: inout ClockTime, rhs: ClockTime) {
        lhs = lhs - rhs
    }

    static func - (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
        return ClockTime(lhs.asSeconds - rhs.asSeconds)
    }

    static func += (lhs: inout ClockTime, rhs: ClockTime) {
        lhs = lhs + rhs
    }

    static func + (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
        return ClockTime(lhs.asSeconds + rhs.asSeconds)
    }

    mutating func scale(by rhs: Double) {
        var s = Double(self.asSeconds)
        s.scale(by: rhs)

        let ct = ClockTime(s)
        self.hours = ct.hours
        self.minutes = ct.minutes
        self.seconds = ct.seconds
    }

    var magnitudeSquared: Double {
        1
    }

    static var zero: ClockTime {
        return ClockTime(0, 0, 0)
    }
}
