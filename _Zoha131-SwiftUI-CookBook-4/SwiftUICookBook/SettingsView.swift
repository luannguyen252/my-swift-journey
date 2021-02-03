import SwiftUI

struct SettingsView: View {
  @State var darkMode = false
  @State var selection = 1
  @State var firstDay = WeekDay.Sunday
  @State var inAppSound = true
  @State var need = Need.Required

  var body: some View {
    Form {
      Section(header: SectionHeader(title: "Settings")){
        Toggle(isOn: $darkMode){
          Text("Dark Mode")
        }

        Picker(
          selection: $selection,
          label: Text("Privacy Look")
        ) {
          ForEach(1...2, id: \.self){ value in
            Text(String(value == 1))
          }
        }

        Picker(
          selection: $firstDay,
          label: Text("First Day of the Week")
        ) {
          ForEach(WeekDay.allCases, id: \.self){
            Text($0.id).tag($0)
          }
        }
      }

      Section {
        Toggle(isOn: $inAppSound){
          Text("In App Sound")
        }

        Picker(
          selection: $need,
          label: Text("App Badge")
        ) {
          ForEach(Need.allCases, id: \.self) {
            Text($0.id).tag($0)
          }
        }

        NavigationLink("Notifications", destination: EmptyView())
      }

      Section(header: SectionHeader(title: "Application")) {

        NavigationLink("Upgrade to Premium", destination: EmptyView())

        NavigationLink("Subscription info", destination: EmptyView())

        NavigationLink("About App", destination: EmptyView())
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarItems(trailing: Button(action: {}){
      Image(systemName:"plus.circle.fill")
        .foregroundColor(.gray)
    })
  }
}

fileprivate struct SectionHeader: View {
  var title: String

  var body: some View {
    Text(title)
      .font(.largeTitle)
      .fontWeight(.light)
      .textCase(.none)
      .padding(.leading)
  }
}

enum WeekDay: String, Identifiable, CaseIterable {
  var id: String { rawValue }

  case Saturday
  case Sunday
  case Monday
  case Tuesday
  case Wednesday
  case Thursday
  case Friday
}

enum Need: String,Identifiable, CaseIterable {
  var id: String { rawValue }

  case Required
  case Optional
  case None
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      SettingsView()
    }
  }
}
