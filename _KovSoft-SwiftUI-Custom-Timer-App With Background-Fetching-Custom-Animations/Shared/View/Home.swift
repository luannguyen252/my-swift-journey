import SwiftUI
import UserNotifications // Sending Notifications

struct Home: View {
    @EnvironmentObject var data: TimerData
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    // Timer Buttons
                    HStack(spacing: 24) {
                        ForEach(1...6, id: \.self) { index in
                            // Each time will be multiples of 5
                            let time = index * 5
                            
                            Text("\(time)")
                                .font(.system(size: 45, weight: .heavy))
                                .frame(width: 100, height: 100)
                                // Changing color for selected ones
                                .foregroundColor(data.time == time ? Color("pink2") : Color("green"))
                                .background(data.time == time ? Color("pink2").opacity(0.15) : Color("green").opacity(0.15))
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation{
                                        data.time = time
                                        data.selectedTime = time
                                    }
                                }
                        }
                    }
                    .padding()
                })
                // Setting to center
                .offset(y: 40)
                .opacity(data.buttonAnimation ? 0 : 1)
                
                Spacer()
                
                // Start Button
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 0.65)) {
                        data.buttonAnimation.toggle()
                    }
                    // Delay animation, after button goes down view is moving up
                    withAnimation(Animation.easeIn.delay(0.6)) {
                        data.timerViewOffset = 0
                    }
                    performNotifications()
                }, label: {
                    ZStack {
                        Circle()
                            .fill(data.time == 0 ? Color("dark3") : Color("pink2"))
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "play.fill")
                            .font(.system(size: 32))
                            .foregroundColor(Color("white"))
                            .opacity(data.time == 0 ? 0.5 : 1)
                    }
                })
                .padding(.bottom, 32)
                // Disabling if not selected
                .disabled(data.time == 0)
                // .opacity(data.time == 0 ? 0.5 : 1)
                // Moving down smoothly
                .offset(y: data.buttonAnimation ? 300 : 0)
            }
            .padding(.bottom, 16)

            Color("pink2")
                // Decreasing height for each count
                .overlay(
                    Text("\(data.selectedTime)")
                        .font(.system(size: 56, weight: .heavy))
                        .foregroundColor(.white)
                )
                .frame(height: UIScreen.main.bounds.height - data.timerHeightChange)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottom)
                .ignoresSafeArea(.all, edges: .all)
                .offset(y: data.timerViewOffset)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("dark").ignoresSafeArea(.all, edges: .all))
        // Timer functionality
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            // Conditions
            if data.time != 0 && data.selectedTime != 0 && data.buttonAnimation {
                // Counting Timer
                data.selectedTime -= 1
                
                // Updating Height
                let ProgressHeight = UIScreen.main.bounds.height / CGFloat(data.time)
                
                let diff = data.time - data.selectedTime
                
                withAnimation(.default) {
                    data.timerHeightChange = CGFloat(diff) * ProgressHeight
                }
                
                if data.selectedTime == 0 {
                    // Resetting
                    data.resetView()
                }
            }
        })
        .onAppear(perform: {
            // Permissions
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
                
            }
            
            // Setting delagete for In-App Notifications
            UNUserNotificationCenter.current().delegate = data
        })
        .statusBar(hidden: true)
    }
    
    func performNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "Notification from Timer App"
        content.body = "Timer has been finished"
        
        // Triggring at selected timer
        // For eg 5 seconds means after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(data.time), repeats: false)
        let request = UNNotificationRequest(identifier: "TIMER", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (err) in
            if err != nil{
                print(err!.localizedDescription)
            }
        }
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif
