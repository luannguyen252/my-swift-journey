import SwiftUI

func formatTime(time: Double) -> String {
    return String(format: "%.1f s", time)
}

struct PlusASecond: View {
    @State var stopCounting = true
    @State var time = 0.0
    
    var body: some View {
        VStack {
            Text(formatTime(time: time))
                .bold()
                .font(.system(size: 100, weight: .black, design: .default))
                .padding(.top, 120)
                .onAppear{
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){_ in
                        if !self.stopCounting{
                            self.time += 0.1
                        }
                    }
            }

            Spacer()
            
            Button(action: {
                self.time += 1.0
            }) {
                Text("+1s")
                    .frame(width: 190, height: 50)
                    .foregroundColor(.gray)
                    .background(Color.gray.opacity(0.4))
                    .font(.headline)
            }
            .cornerRadius(10)
            .padding(.bottom)
            
            Button(action: {
                self.stopCounting.toggle()
            }){
                if self.stopCounting {
                    Text("Start")
                        .frame(width: 190, height: 50)
                        .foregroundColor(.green)
                        .font(.headline)
                        .background(Color.green.opacity(0.4))
                        .cornerRadius(10)
                } else {
                    Text("Pause")
                        .frame(width: 190, height: 50)
                        .foregroundColor(.blue)
                        .font(.headline)
                        .background(Color.blue.opacity(0.4))
                        .cornerRadius(10)
                }
            }
            .padding(.bottom)
            
            Button(action: {
                self.time = 0.0
            }) {
                Text("Reset")
                    .frame(width: 190, height: 50)
                    .foregroundColor(.red)
                    .font(.headline)
                    .background(Color.red.opacity(0.4))
            }
            .cornerRadius(10)
            .padding(.bottom)
        }
    }
}

struct PlusASecond_Previews: PreviewProvider {
    static var previews: some View {
        PlusASecond()
            .previewDevice("iPhone 12 Pro Max")
    }
}
