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

import PhotosUI
import SwiftUI

extension PHPickerViewController {
  struct View {
    @Binding var image: UIImage?
  }
}

// MARK: - UIViewControllerRepresentable
extension PHPickerViewController.View: UIViewControllerRepresentable {
  func makeCoordinator() -> some PHPickerViewControllerDelegate {
    PHPickerViewController.Delegate(image: $image)
  }

  func makeUIViewController(context: Context) -> PHPickerViewController {
    let picker = PHPickerViewController( configuration: .init() )
    picker.delegate = context.coordinator
    return picker
  }

  func updateUIViewController(_: UIViewControllerType, context _: Context) { }
}

// MARK: - PHPickerViewControllerDelegate
extension PHPickerViewController.Delegate: PHPickerViewControllerDelegate {
  func picker(
    _ picker: PHPickerViewController,
    didFinishPicking results: [PHPickerResult]
  ) {
    results.first?.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
      DispatchQueue.main.async { self.image = image as? UIImage }
    }

    picker.dismiss(animated: true)
  }
}

// MARK: - private
private extension PHPickerViewController {
  final class Delegate {
    init(image: Binding<UIImage?>) {
      _image = image
    }

    @Binding var image: UIImage?
  }
}
