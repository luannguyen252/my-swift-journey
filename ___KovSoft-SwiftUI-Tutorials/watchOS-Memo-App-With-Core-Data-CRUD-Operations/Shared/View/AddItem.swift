import SwiftUI

struct AddItem: View {
    @State var memoText = ""

    // Getting context from environment
    @Environment(\.managedObjectContext) var context
    
    // Presentation
    @Environment(\.presentationMode) var presentation
    
    // Edit Options
    var memoItem: Memo?
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Memories...", text: $memoText)
                .font(.custom("TTFirsNeue-Regular", size: 14))
                .padding(.vertical, 16)
            
            Button(action: addMemo, label: {
                Text("Save")
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("TTFirsNeue-Bold", size: 14))
                    .foregroundColor(.white)
                    .background(Color("pink"))
                    .cornerRadius(8)
            })
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle())
            .disabled(memoText == "")
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .navigationTitle("\(memoItem == nil ? "Add Memo" : "Update")")
        .onAppear(perform: {
            // Verifying it memo item has data
            if let memo = memoItem{
                memoText = memo.title ?? ""
            }
        })
    }
    
    // Adding Memo
    func addMemo() {
        let memo = memoItem == nil ? Memo(context: context) : memoItem!
        
        memo.title = memoText
        memo.dateAdded = Date()
        
        // Saving
        do {
            try context.save()
            // If success, closing view
            presentation.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#if DEBUG
struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
    }
}
#endif
