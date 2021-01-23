import SwiftUI

struct TimeRecordView: View {
    @EnvironmentObject var viewModel: RecordViewModel
    @State var checkTheEnd = false
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.eventTitle)

                Spacer()

                Text(timeFomatter(iHour: viewModel.workHour,
                                  iMinute: viewModel.workMinute,
                                  iSeconds: viewModel.workSecond))

                .onReceive(timer) { _ in
                    if((viewModel.moveToView != true) && (checkTheEnd != true)){
                        viewModel.workSecond += 1
                        // 秒→分
                        if(viewModel.workSecond > 59){
                            viewModel.workSecond = 0
                            viewModel.workMinute += 1
                        }
                        // 分→時
                        if(viewModel.workMinute > 59){
                            viewModel.workMinute = 0
                            viewModel.workHour += 1
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink(
                    destination: TimePauseView(),
                    isActive: $viewModel.moveToView,
                    label: {
                        Image(systemName: "pause.circle.fill")
                            .foregroundColor(Color.black)
                            .font(.system(size: 90))
                            .onTapGesture {
                                viewModel.moveToView.toggle()
                                // 終了日時を記録
                                let eventEndTime = EventDay.singleton
                                eventEndTime.EndDay = dateFormatStr()
                            }
                            .onLongPressGesture {
                                checkTheEnd = true
                            }
                            .actionSheet(isPresented: $checkTheEnd) {
                                ActionSheet(title: Text("記録を中止しますか？"), message: Text("記録していたデータが削除されますがよろしいですか？"),
                                            buttons: [.destructive(Text("記録を中断"), action: {
                                                presentationMode.wrappedValue.dismiss()
                                            }),
                                            .cancel(Text("キャンセル"))
                                            ])
                            }
                    })
            }
            .padding(70)
            .onAppear {
                if(viewModel.deleteView){
                    presentationMode.wrappedValue.dismiss()
                    viewModel.memoEditor = .init()
                    viewModel.moveToView = .init()
                    viewModel.deleteView = .init()
                }
            } 
        }
        .navigationBarHidden(true)
        .onDisappear {
            viewModel.eventTitle = .init()
            viewModel.workHour = .init()
            viewModel.workMinute = .init()
            viewModel.workSecond = .init()
        }
    }
}

struct TimeRecordView_Previews: PreviewProvider {
    static var previews: some View {
        TimeRecordView()
            .environmentObject(RecordViewModel())
    }
}
