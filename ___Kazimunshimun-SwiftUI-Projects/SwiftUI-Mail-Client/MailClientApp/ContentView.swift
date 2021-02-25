//
//  ContentView.swift
//  MailClientApp
//
//  Created by Anik on 5/10/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager = MailManager()
    var body: some View {
        ZStack {
            Color.darkPurple
                .ignoresSafeArea()
            
            MailListView(manager: manager)
            
            if manager.selectedMail != nil {
                MailDetailView(manager: manager)
            }
        }
    }
}

// mail list view with LazyVStack
struct MailListView: View {
    @ObservedObject var manager: MailManager
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            ForEach(manager.mails) { mail in
                ZStack {
                    SwipeButtonView(manager: manager, mail: mail)
                    
                    MailItemView(mail: mail)
                        .gesture(
                            DragGesture(minimumDistance: 10)
                                .onChanged({ value in
                                    // handle swipe
                                    if value.translation.width > 0 {
                                        if !mail.isRead {
                                            manager.handleReadGesture(mail: mail, swipeWidth: value.translation.width)
                                        }
                                        //lets take it one step further by swipping left to delete the mail
                                    } else if value.translation.width < 0 {
                                        // handle delete gesture
                                        manager.handleDeleteGesture(mail: mail, swipeWidth: value.translation.width)
                                    }
                                })
                                .onEnded({ _ in
                                    manager.swipeEnded()
                                })
                        )
                        .onTapGesture {
                            manager.markRead(mail: mail)
                            manager.selectedMail = mail
                        }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

//swipe view
struct SwipeButtonView: View {
    @ObservedObject var manager: MailManager
    let mail: MailItem
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    manager.markRead(mail: mail)
                }, label: {
                    // wave shave view
                    ReadButtonView(mail: mail)
                })
                
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
                    withAnimation(.linear) {
                        manager.deleteMail(mail: mail)
                    }
                }, label: {
                    // wave shave view
                    DeleteButtonView(mail: mail)
                })
            }
        }
    }
}

struct ReadButtonView: View {
    let mail: MailItem
    var body: some View {
        ZStack {
            WaveShape(waveWidth: mail.offsetX, isLeft: true)
                .fill(Color.appGreen)
                .frame(width: 60)
            Image(systemName: "checkmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .opacity(mail.offsetX > 50 ? 1.0 : 0.0)
        }
    }
}

struct DeleteButtonView: View {
    let mail: MailItem
    var body: some View {
        ZStack {
            WaveShape(waveWidth: mail.offsetX, isLeft: false)
                .fill(Color.red)
                .frame(width: 60)
            Image(systemName: "xmark")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .opacity(mail.offsetX < -50 ? 1.0 : 0.0)
        }
    }
}

// lets create the wave like view first
struct WaveShape: Shape {
    var waveWidth: CGFloat
    var animatableData: CGFloat {
        get { waveWidth }
        set { waveWidth = newValue }
    }
    var isLeft: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let height = rect.height
        let width = rect.width
        let paddingValue: CGFloat = 10
        
        if isLeft {
            path.move(to: CGPoint(x: 0, y: 0))
            
            if waveWidth > paddingValue {
                let toPoint1 = CGPoint(x: waveWidth - paddingValue, y: height/2)
                let controlPoint1 = CGPoint(x: 0, y: 30)
                let controlPoint2 = CGPoint(x: waveWidth - paddingValue, y: 20)
                
                let toPoint2 = CGPoint(x: 0, y: height)
                let controlPoint3 = CGPoint(x: waveWidth - paddingValue, y: height - 20)
                let controlPoint4 = CGPoint(x: 0, y: height - 30)
                
                path.addCurve(to: toPoint1, control1: controlPoint1, control2: controlPoint2)
                path.addCurve(to: toPoint2, control1: controlPoint3, control2: controlPoint4)
            }

            path.addLine(to: CGPoint(x: 0, y: 0))
        } else {
            path.move(to: CGPoint(x: width, y: 0))
            
            if waveWidth < -paddingValue {
                let toPoint1 = CGPoint(x: width + waveWidth + paddingValue, y: height/2)
                let controlPoint1 = CGPoint(x: width, y: 30)
                let controlPoint2 = CGPoint(x: width + waveWidth + paddingValue, y: 20)
                
                let toPoint2 = CGPoint(x: width, y: height)
                let controlPoint3 = CGPoint(x: width + waveWidth + paddingValue, y: height - 20)
                let controlPoint4 = CGPoint(x: width, y: height - 30)
                
                path.addCurve(to: toPoint1, control1: controlPoint1, control2: controlPoint2)
                path.addCurve(to: toPoint2, control1: controlPoint3, control2: controlPoint4)
            }

            path.addLine(to: CGPoint(x: width, y: 0))
        }
        
        
        return path
    }
}

// full mail view
struct MailDetailView: View {
    @ObservedObject var manager: MailManager
    var body: some View {
        ZStack {
            Color.darkPurple
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(manager.selectedMail?.senderName ?? "")
                            .font(.system(size: 14, weight: .semibold))
                        Text(manager.selectedMail?.title ?? "")
                            .font(.system(size: 16, weight: .bold))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        manager.selectedMail = nil
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 32, weight: .light))
                            .padding()
                    })
                }
                
                Text(manager.selectedMail?.message ?? "")
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
        }
        .onAppear {
            manager.markRead(mail: manager.selectedMail!)
        }
    }
}

// mail item view
struct MailItemView: View {
    let mail: MailItem
    var body: some View {
        ZStack {
            Color.lightPurple
                .cornerRadius(15)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(mail.senderName)
                        .font(.system(size: 14, weight: .semibold))
                    Text(mail.title)
                        .font(.system(size: 16, weight: .bold))
                    Text(mail.message)
                        .font(.system(size: 14, weight: .regular))
                        .lineLimit(2)
                }
                
                Spacer()
                
                Text(mail.sendTime)
                    .font(.system(size: 12, weight: .regular))
            }
            .padding()
            .foregroundColor(mail.isRead ? Color(white: 0.85) : .white)
        }
        .offset(x: mail.offsetX)
    }
}

// View Model to control the list
class MailManager: ObservableObject {
    @Published var mails = Data.mailList
    @Published var selectedMail: MailItem? = nil
    var changingMailIndex = -1
    var isChanging = false
    // when user tap on mail item then mail will be read
    
    func markRead(mail: MailItem) {
        if let index = mails.firstIndex(where: { $0.id == mail.id }) {
            withAnimation(.linear) {
                mails[index].isRead = true
                mails[index].offsetX = 0.0
            }
        }
    }
    
    // now lets do same operation in swipe right gesture like design
    func handleReadGesture(mail: MailItem, swipeWidth: CGFloat) {
        if swipeWidth != 0 {
            if let index = mails.firstIndex(where: { $0.id == mail.id }) {
                withAnimation(.linear) {
                    swipeStarted(index: index)
                    
                    if swipeWidth <= 120 {
                        mails[index].offsetX = swipeWidth/2
                    }
                    
                    if swipeWidth > 120 {
                        mails[index].offsetX = 60
                    }
                    
                    if swipeWidth > 240 {
                        markRead(mail: mail)
                    }
                }
                
            }
        }
    }
    
    func handleDeleteGesture(mail: MailItem, swipeWidth: CGFloat) {
        if swipeWidth != 0 {
            if let index = mails.firstIndex(where: { $0.id == mail.id }) {
                withAnimation(.linear) {
                    swipeStarted(index: index)
                    
                    if swipeWidth >= -120 {
                        mails[index].offsetX = swipeWidth/2
                    }
                    
                    if swipeWidth < -120 {
                        mails[index].offsetX = -60
                    }
                    
                    if swipeWidth < -240 {
                        //delete mail
                        deleteMailIndex(index: index)
                    }
                }
                
            }
        }
    }
    
    func deleteMailIndex(index: Int) {
        if index == changingMailIndex {
            changingMailIndex = -1
        }
        mails.remove(at: index)
    }
    
    func deleteMail(mail: MailItem) {
        if let index = mails.firstIndex(where: { $0.id == mail.id }) {
            if index == changingMailIndex {
                changingMailIndex = -1
            }
            mails.remove(at: index)
        }
    }
    
    func swipeStarted(index: Int) {
        if (changingMailIndex != -1 && !isChanging) {
            mails[changingMailIndex].offsetX = 0.0
            isChanging = true
        }
        changingMailIndex = index
    }
    
    func swipeEnded() {
        isChanging = false
        
        let readStart: CGFloat = 55.0
        let readEnd: CGFloat = 60.0
        let markReadRange = readStart...readEnd
        
        let deleteStart: CGFloat = -60.0
        let delteEnd: CGFloat = -55.0
        let markDeleteRange = deleteStart...delteEnd
        
        if (changingMailIndex != -1) {
            if !markReadRange.contains(mails[changingMailIndex].offsetX) && !markDeleteRange.contains(mails[changingMailIndex].offsetX) {
                withAnimation(.linear) {
                    mails[changingMailIndex].offsetX = 0.0
                }
            }
        }
    }
}

// next data to populate the list
struct Data {
    // first lets add a lorem ipsum
    static let loremText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ut nulla interdum, consectetur mi vitae, blandit magna. Aenean mi quam, suscipit et fringilla a, lacinia vel odio. Donec sollicitudin nibh id eros malesuada cursus. Sed sed pulvinar mauris, quis faucibus mauris. In mollis dui quis quam tincidunt egestas. Donec nunc velit, sagittis venenatis posuere euismod, blandit vitae sapien. Nunc facilisis quam quis enim luctus accumsan. Curabitur tempus eros quis fermentum dictum. Nulla facilisi. Duis consequat facilisis orci ac rhoncus. Vestibulum dictum sagittis risus. Curabitur vitae rutrum magna. Morbi sit amet magna vestibulum, ultricies augue sed, faucibus risus. Maecenas vitae fermentum diam, a laoreet lorem."
    
    static let mailList = [
        MailItem(senderName: "Me & Luis allen", sendTime: "Nov 18", title: "Desktop Computers", message: "Over 92% of computers are infected with Adware and spyware. " + loremText),
        MailItem(senderName: "Mabelle Canzales", sendTime: "Nov 11", title: "Free Real Estate Listings", message: "Buisness cards represent not only your buisness but also tells people your " + loremText),
        MailItem(senderName: "Matilda Ward", sendTime: "Nov 11", title: "Writting A Good Headline", message: "I want to talk about the thinfs that are quite important to me. There are love " + loremText),
        MailItem(senderName: "Myrtle West", sendTime: "Nov 10", title: "Finally A Top Secret Way", message: "Conversations can be tricky buisness sometimes, decoding what is said with " + loremText),
        MailItem(senderName: "Lottie Diaz", sendTime: "Nov 6", title: "Internet Banner", message: "Spielberg's bloackbuster, 'Minority Report' is set in the year 2004. The" + loremText),
        MailItem(senderName: "Charlotte Holmes", sendTime: "Nov 3", title: "Advertising Outdoors", message: "There is no better advertisement campain tha is low cost and also " + loremText),
        MailItem(senderName: "Mable jennings", sendTime: "Nov 3", title: "Tremblant in Canada", message: "Over 92% of computers are infected with Adware and spyware" + loremText),
        MailItem(senderName: "Sophie allen", sendTime: "Nov 1", title: "Fresh Offer", message: "Spielberg's bloackbuster, 'Minority Report' is set in the year 2004. The" + loremText),
        MailItem(senderName: "Woddy Holmes", sendTime: "Oct 28", title: "Internet Listing", message: "There is no better advertisement campain tha is low cost and also " + loremText),
        MailItem(senderName: "Mike robinson", sendTime: "Oct 24", title: "Mobile Phones Deals", message: "Conversations can be tricky buisness sometimes, decoding what is said with " + loremText),
        MailItem(senderName: "Allen", sendTime: "Oct 22", title: "Low Cost Mobile Data", message: "There is no better advertisement campain tha is low cost and also " + loremText)
    ]
}

// mail model class
struct MailItem: Identifiable {
    let id = UUID()
    let senderName: String
    let sendTime: String
    let title: String
    let message: String
    var offsetX: CGFloat = 0.0
    var isRead = false
}

// first we need colors
extension Color {
    static let darkPurple = Color.init(red: 120/255, green: 106/255, blue: 213/255)
    static let extradarkPurple = Color.init(red: 105/255, green: 91/255, blue: 207/255)
    static let lightPurple = Color.init(red: 139/255, green: 124/255, blue: 225/255)
    static let appGreen = Color.init(red: 45/255, green: 188/255, blue: 179/255)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

