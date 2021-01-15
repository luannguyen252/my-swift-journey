//
//  ContentView.swift
//  SwiftUI-State-Changes
//
//  Created by Luan Nguyen on 15/01/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ExampleView1(), label: { Text("Example #1 - OutOfControlView") })
                NavigationLink(destination: ExampleView2(), label: { Text("Example #2 - Cardinal Direction") })
                NavigationLink(destination: ExampleView3(), label: { Text("Example #3 - Observable Object") })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Example #1
struct ExampleView1: View {
    @State private var showOutOfControlView = false
    
    var body: some View {
        VStack(spacing: 10) {
            CPUWheel().frame(height: 150)

            VStack {
                if showOutOfControlView { OutOfControlView() }
            }.frame(height: 80)

            Button(self.showOutOfControlView ? "Hide": "Show") {
                self.showOutOfControlView.toggle()
            }
        }
    }
}

struct OutOfControlView: View {
    @State private var counter = 0
    
    var body: some View {

        DispatchQueue.main.async {
            self.counter += 1
        }
        
        return Text("Computed Times\n\(counter)").multilineTextAlignment(.center)
    }
}

// MARK: - Example #2
struct ExampleView2: View {
    @State private var flag = false
    @State private var cardinalDirection = ""
    
    var body: some View {
        return VStack(spacing: 30) {
            CPUWheel().frame(height: 150)
            
            Text("\(cardinalDirection)").font(.largeTitle)
            Image(systemName: "location.north")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .modifier(RotateNeedle(cardinalDirection: self.$cardinalDirection, angle: self.flag ? 0 : 360))
            
            
            Button("Animate") {
                withAnimation(.easeInOut(duration: 3.0)) {
                    self.flag.toggle()
                }
            }
        }
    }
}

struct RotateNeedle: GeometryEffect {
    @Binding var cardinalDirection: String
    
    var angle: Double
    
    var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            self.cardinalDirection = self.angleToString(self.angle)
        }
        
        let rotation = CGAffineTransform(rotationAngle: CGFloat(angle * (Double.pi / 180.0)))
        let offset1 = CGAffineTransform(translationX: size.width/2.0, y: size.height/2.0)
        let offset2 = CGAffineTransform(translationX: -size.width/2.0, y: -size.height/2.0)
        return ProjectionTransform(offset2.concatenating(rotation).concatenating(offset1))
    }
    
    func angleToString(_ a: Double) -> String {
        switch a {
        case 315..<405:
            fallthrough
        case 0..<45:
            return "North"
        case 45..<135:
            return "East"
        case 135..<225:
            return "South"
        default:
            return "West"
        }
    }
}

// MARK: - Example #3
class MyObservable: ObservableObject {
    @Published var someValue = "Here's a value!"
}

struct ExampleView3: View {
    var body: some View {
        VStack(spacing: 20) {
            MyView()
            
            MyView()
                .environmentObject(MyObservable())
        }
    }
}
extension EnvironmentObject {
    var safeToUse: Bool {
        return (Mirror(reflecting: self).children.first(where: { $0.label == "_store" })?.value as? ObjectType) != nil
    }
}

struct MyView: View {
    @EnvironmentObject var model: MyObservable

    var body: some View {

        let txt = _model.safeToUse ? model.someValue : "No Value"
        
        return Text(txt)
    }
}

// MARK: - CPU Wheel
struct CPUWheel: View {
    @State private var cpu: Int = 0
    
    var timer = Timer.publish(every: 0.1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        let gradient = AngularGradient(gradient: Gradient(colors: [Color.green, Color.yellow, Color.red]),
                                       center: .center, angle: Angle(degrees: 0))
        
        return Circle()
            .stroke(lineWidth: 3)
            .foregroundColor(.primary)
            .background(Circle().fill(gradient).clipShape(CPUClip(pct: Double(self.cpu))))
            .shadow(radius: 4)
            .overlay(CPULabel(pct: self.cpu))
            .onReceive(timer) { _ in
                withAnimation {
                    self.cpu = Int(CPUWheel.cpuUsage())
                }
            }
    }
    
    struct CPULabel: View {
        let pct: Int
        
        var body: some View {
            VStack {
                Text("\(self.pct) %")
                    .font(.largeTitle)
                    
                Text("CPU")
                    .font(.body)
            }.transaction({ $0.animation = nil })
        }
    }
    
    struct CPUClip: Shape {
        var pct: Double
        
        var animatableData: Double {
            get { pct }
            set { pct = newValue }
        }
        
        func path(in rect: CGRect) -> Path {
            var path = Path()

            let c = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: c)
            path.addArc(center: c,
                        radius: rect.width/2.0,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: (pct/100.0) * 360), clockwise: false)
            
            path.closeSubpath()
            return path
        }
    }
    
    // Source for cpuUsage(): based on https://stackoverflow.com/a/44134397/7786555
    static func cpuUsage() -> Double {
        var kr: kern_return_t
        var task_info_count: mach_msg_type_number_t

        task_info_count = mach_msg_type_number_t(TASK_INFO_MAX)
        var tinfo = [integer_t](repeating: 0, count: Int(task_info_count))

        kr = task_info(mach_task_self_, task_flavor_t(TASK_BASIC_INFO), &tinfo, &task_info_count)
        if kr != KERN_SUCCESS {
            return -1
        }

        return [thread_act_t]().withUnsafeBufferPointer { bufferPointer in
            var thread_list: thread_act_array_t? = UnsafeMutablePointer(mutating: bufferPointer.baseAddress)
            var thread_count: mach_msg_type_number_t = 0
            defer {
                if let thread_list = thread_list {
                    vm_deallocate(mach_task_self_, vm_address_t(bitPattern: thread_list), vm_size_t(Int(thread_count) * MemoryLayout<thread_t>.stride) )
                }
            }

            kr = task_threads(mach_task_self_, &thread_list, &thread_count)

            if kr != KERN_SUCCESS {
                return -1
            }

            var tot_cpu: Double = 0

            if let thread_list = thread_list {

                for j in 0 ..< Int(thread_count) {
                    var thread_info_count = mach_msg_type_number_t(THREAD_INFO_MAX)
                    var thinfo = [integer_t](repeating: 0, count: Int(thread_info_count))
                    kr = thread_info(thread_list[j], thread_flavor_t(THREAD_BASIC_INFO),
                                     &thinfo, &thread_info_count)
                    if kr != KERN_SUCCESS {
                        return -1
                    }

                    let threadBasicInfo = convertThreadInfoToThreadBasicInfo(thinfo)

                    if threadBasicInfo.flags != TH_FLAGS_IDLE {
                        tot_cpu += (Double(threadBasicInfo.cpu_usage) / Double(TH_USAGE_SCALE)) * 100.0
                    }
                } // for each thread
            }
            
            return tot_cpu

        }
    }

    static func convertThreadInfoToThreadBasicInfo(_ threadInfo: [integer_t]) -> thread_basic_info {
        var result = thread_basic_info()

        result.user_time = time_value_t(seconds: threadInfo[0], microseconds: threadInfo[1])
        result.system_time = time_value_t(seconds: threadInfo[2], microseconds: threadInfo[3])
        result.cpu_usage = threadInfo[4]
        result.policy = threadInfo[5]
        result.run_state = threadInfo[6]
        result.flags = threadInfo[7]
        result.suspend_count = threadInfo[8]
        result.sleep_time = threadInfo[9]

        return result
    }

}
