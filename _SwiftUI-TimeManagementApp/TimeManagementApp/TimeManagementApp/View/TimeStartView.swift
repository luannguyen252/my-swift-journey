import SwiftUI

struct TimeStartView: View {
    @EnvironmentObject var viewModel: RecordViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("イベント名を入力してください", text: $viewModel.eventTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(25)
                
                Spacer()
                
                ZStack {
                    NavigationLink(
                        destination: TimeRecordView(),
                        label: {
                            ZStack {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width:130, height: 130)
                                Text("Start")
                                    .font(.callout)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.center)
                            }.padding(50)
                        })
                    
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            ZStack{
                                Circle()
                                    .frame(width: 80, height: 80)
                                Image(systemName: "stop.circle")
                                    .background(Color.white)
                            }
                        })
                        .offset(x: -SGConvenience.deviceWidth/3,y: SGConvenience.deviceHeight/10)
                }
                
            }
            .onDisappear(perform: {
                // 開始日時を記録
                let eventStartTime = EventDay.singleton
                eventStartTime.StartDay = dateFormatStr()
            })
        }
    }
}

struct TimeStartView_Previews: PreviewProvider {
    static var previews: some View {
        TimeStartView()
            .environmentObject(RecordViewModel())
    }
}
