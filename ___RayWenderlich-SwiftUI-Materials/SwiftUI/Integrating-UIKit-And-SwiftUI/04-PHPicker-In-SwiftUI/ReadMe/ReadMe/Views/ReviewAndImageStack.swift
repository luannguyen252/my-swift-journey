/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import class PhotosUI.PHPickerViewController
import SwiftUI

struct ReviewAndImageStack: View {
  @ObservedObject var book: Book
  @Binding var image: UIImage?
  @State var showingImagePicker = false
  @State var showingAlert = false

  var body: some View {
    VStack {
      Divider()
        .padding(.vertical)
      TextField("Review…", text: $book.microReview)
      Divider()
        .padding(.vertical)

      Book.Image(
        uiImage: image,
        title: book.title,
        cornerRadius: 16
      )
      .scaledToFit()

      let updateButton =
        Button("Update Image…") {
          showingImagePicker = true
        }
        .padding()

      if image != nil {
        HStack {
          Spacer()

          Button("Delete Image") {
            showingAlert = true
          }

          Spacer()
          updateButton
          Spacer()
        }
      } else {
        updateButton
      }

      Spacer()
    }
    .sheet(isPresented: $showingImagePicker) {
      PHPickerViewController.View(image: $image)
    }
    .alert(isPresented: $showingAlert) {
      .init(
        title: .init("Delete image for \(book.title)?"),
        primaryButton: .destructive(.init("Delete")) {
          image = nil
        },
        secondaryButton: .cancel()
      )
    }
  }
}

struct ReviewAndImageStack_Previews: PreviewProvider {
  static var previews: some View {
    ReviewAndImageStack(book: .init(), image: .constant(nil))
      .padding(.horizontal)
      .previewedInAllColorSchemes
  }
}
