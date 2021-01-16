import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var setup = ""
    @State private var rating = "Today"
    @State private var dealine = Date()

    let ratings = ["Today", "Someday", "Importamt"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                   MultiLineTF2(txt: $setup)
                }
                .frame(height: 200)
                
                Section {
                    Picker("Rating", selection: $rating) {
                        ForEach(ratings, id: \.self) { rating in
                            Text(rating)
                        }
                    }
                }
                
                Section {
                    DatePicker(selection: $dealine) {
                        Text("Dealine")
                    }
                }
                
                Button("Add in list") {
                    do {
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("Whoops! \(error.localizedDescription)")
                    }
                }
            }
            .navigationBarTitle("New Todo")
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddTodoView()
            .previewDevice("iPhone Pro")
            
            AddTodoView()
            .previewDevice("iPhone SE")
        }
    }
}


struct MultiLineTF2: UIViewRepresentable {
    @Binding var txt: String
  
    func makeCoordinator() -> MultiLineTF2.Coordinator {
        return MultiLineTF2.Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultiLineTF2>) -> UITextView {
        let textView = UITextView()
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.isScrollEnabled = true
        textView.text =  "Type something ..."
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 20)
        textView.delegate = context.coordinator
        textView.backgroundColor = .secondarySystemBackground
        textView.textColor = .placeholderText
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiLineTF2>) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultiLineTF2
        
        init(_ parent1: MultiLineTF2) {
            parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.txt = textView.text
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.textColor == .placeholderText {
                textView.text = ""
                textView.textColor = .label
            }
        }
    }
}
