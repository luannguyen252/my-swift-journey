import SwiftUI

struct GCTimeIntervalView: View {
    @State var alert = false
    @State var second = ""
    
    var body: some View {
        VStack {
            TextField("请输入秒数，将在N秒后收到通知", text: $second)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                guard let second = Double(self.second) else { return }
                
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (status, err) in
                    if !status {
                        self.alert.toggle()
                        return
                    }

                    let content = UNMutableNotificationContent()
                    content.title = "添加朋友 对着月亮敲代码"
                    // content.subtitle = "子标题"
                    content.body = "公众号 gh_6a83a7c19315"
                    content.badge = 1

                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: second, repeats: false)
                    let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request) { err in
                        err != nil ? print("添加本地通知错误", err!.localizedDescription) : print("添加本地通知成功")
                    }
                }
            }) {
                Text("本地通知")
            }
        }
        .alert(isPresented: $alert) {
            Alert(title: Text("APP需要你给予通知权限，才能每天提醒你记录成功日记噢，点击确定前往设置开启。 "),
            message: nil,
            primaryButton: .cancel(Text("取消"), action: {}),
            secondaryButton: .default(Text("确定"), action: {
              guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
              if UIApplication.shared.canOpenURL(url) {
                  UIApplication.shared.open(url, completionHandler: nil)
              }
            }))
        }
    }
}

struct GCTimeIntervalView_Previews: PreviewProvider {
    static var previews: some View {
        GCTimeIntervalView()
    }
}
