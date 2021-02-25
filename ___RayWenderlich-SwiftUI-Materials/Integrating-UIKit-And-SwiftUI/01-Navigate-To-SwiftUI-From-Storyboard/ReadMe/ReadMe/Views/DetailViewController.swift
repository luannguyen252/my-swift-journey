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
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit
import SwiftUI

class DetailViewController: UITableViewController {
  var book: Book
  
  @IBOutlet var readMeButton: UIButton!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var authorLabel: UILabel!
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var reviewTextView: UITextView!
  
  @IBAction func toggleReadMe() {
    book.readMe.toggle()
    let image = book.readMe
      ? UIImage(systemName: LibrarySymbol.bookmarkFill)
      : UIImage(systemName: LibrarySymbol.bookmark)
    readMeButton.setImage(image, for: .normal)
  }
  
  @IBAction func updateImage() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera)
      ? .camera
      : .photoLibrary
    present(imagePicker, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.image = book.image ?? UIImage(systemName: LibrarySymbol.letterCircle(letter: book.title.first))
    imageView.layer.cornerRadius = 16
    titleLabel.text = book.title
    authorLabel.text = book.author
    
    if let review = book.review {
      reviewTextView.text = review
    }
    
    let image = book.readMe
      ? UIImage(systemName: LibrarySymbol.bookmarkFill)
      : UIImage(systemName: LibrarySymbol.bookmark)
    readMeButton.setImage(image, for: .normal)

    reviewTextView.addDoneButton()    
  }
  
  required init?(coder: NSCoder) { fatalError("This should never be called!") }
  
  init?(coder: NSCoder, book: Book) {
    self.book = book
    super.init(coder: coder)
  }
}

extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let selectedImage = info[.originalImage] as? UIImage else { return }
    book.image = selectedImage
    Library.update(book: book)
    dismiss(animated: true)
  }
}

// MARK: - TextViewDelegate
extension DetailViewController: UITextViewDelegate {
  func textViewDidEndEditing(_ textView: UITextView) {
    book.review = textView.text
  }
}

extension UITextView {
  func addDoneButton() {
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.resignFirstResponder))
    toolbar.items = [flexSpace, doneButton]
    self.inputAccessoryView = toolbar
  }
}
