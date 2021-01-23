import SwiftUI

struct TimePauseView: View {
    @EnvironmentObject var viewModel: RecordViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var floatKeybord = false
    
    var body: some View {
        VStack() {
            Group {
                ZStack {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(height: SGConvenience.deviceHeight*0.35)
                    
                    Text(timeFomatter(iHour: viewModel.workHour,
                                      iMinute: viewModel.workMinute,
                                      iSeconds: viewModel.workSecond))
                }
                .background(Color.yellow).edgesIgnoringSafeArea(.all)
                
                TextField("イベント名を入力してください", text: $viewModel.eventTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(25)
                    .keyboardType(.default)
            }
            .onTapGesture(perform: {
                UIApplication.shared.closeKeyboard()
            })
            
            Divider()
            
            TextEditor(text: $viewModel.memoEditor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.custom("HelveticaNeue", size: 13))
                .lineSpacing(5)
            
            Divider()
            
            Spacer()
            
            if(floatKeybord != true) {
                HStack {
                    Button(action: {
                        let eventEndTime = EventDay.singleton
                        let workTimeStr = timeFomatter(iHour: viewModel.workHour,
                                                       iMinute: viewModel.workMinute,
                                                       iSeconds: viewModel.workSecond)
                        AddNewRecord(sTime: eventEndTime.StartDay,eTime: eventEndTime.EndDay,wTime: workTimeStr,eTitle: viewModel.eventTitle,eMemo: viewModel.memoEditor)
                        viewModel.deleteView.toggle()
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "stop.circle.fill")
                            .font(.system(size: 90))
                            .foregroundColor(Color.black)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.moveToView.toggle()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color.yellow)
                                .frame(width: 90, height: 90)
                            
                            Image(systemName: "play.fill")
                                .foregroundColor(Color.black)
                                .font(.system(size: 45))
                        }
                    }
                }
                .padding(70).navigationBarHidden(true)
            }
        }
        // キーボードを開いた
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
            floatKeybord = true
        }
        // キーボードを閉じた
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            floatKeybord = false
        }
    }
    
    func AddNewRecord(sTime:String,eTime:String,wTime:String,eTitle:String,eMemo:String) {
        let newTimeRecord = TimeRecord(context: viewContext)
        newTimeRecord.strTime = sTime
        newTimeRecord.endTime = eTime
        newTimeRecord.wrkTime = wTime
        newTimeRecord.eventTitle = eTitle
        newTimeRecord.eventMemo = eMemo

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct TimePauseView_Previews: PreviewProvider {
    static var previews: some View {
        TimePauseView()
            .environmentObject(RecordViewModel())
    }
}
