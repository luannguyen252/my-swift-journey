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

class NewBookViewController: UITableViewController {
  @IBOutlet var titleTextField: UITextField!
  @IBOutlet var authorTextField: UITextField!
  @IBOutlet var bookImageView: UIImageView!
  
  var newBookImage: UIImage?
  
  @IBAction func cancel() {
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func saveNewBook() {
    guard let title = titleTextField.text,
          let author = authorTextField.text,
          !title.isEmpty,
          !author.isEmpty
    else { return }
    
    Library.addNew(book: Book(title: title, author: author, readMe: true, image: newBookImage))
    navigationController?.popViewController(animated: true)
  }
  
  @IBAction func updateImage() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera)
      ? .camera
      : .photoLibrary
    imagePicker.allowsEditing = true
    present(imagePicker, animated: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bookImageView.layer.cornerRadius = 16
  }
}

extension NewBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let selectedImage = info[.editedImage] as? UIImage else { return }
    bookImageView.image = selectedImage
    newBookImage = selectedImage
    dismiss(animated: true)
  }
}

extension NewBookViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == titleTextField {
      return authorTextField.becomeFirstResponder()
    } else {
      return textField.resignFirstResponder()
    }
  }
}
