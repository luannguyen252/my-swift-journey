//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Text_WrappingImages: View {
    var body: some View {
        VStack(spacing: 40) {
            HeaderView("Text",
                       subtitle: "Wrapping Images",
                       desc: "You can \"wrap\" an image inside of text so you can concatenate it to other Text views.",
                       back: .green, textColor: .white)
            
            Text("Completed! ") +
                Text(Image(systemName: "checkmark.square.fill")).foregroundColor(.green)
                + Text(" You can now continue.")
            
            Text(Image(systemName: "trash.circle.fill")).foregroundColor(.red)
                + Text(" Are you sure you want to delete?")
        }
        .font(.title)
    }
}

struct Text_WrappingImages_Previews: PreviewProvider {
    static var previews: some View {
        Text_WrappingImages()
    }
}
