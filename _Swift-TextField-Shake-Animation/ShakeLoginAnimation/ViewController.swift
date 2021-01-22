import UIKit

class ViewController: UIViewController {
    @IBOutlet var passwordTextField: UITextField!
    
    let CORRECT_PASSWORD = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = CGFloat(3)
        passwordTextField.layer.cornerRadius = CGFloat(10)
        passwordTextField.addTarget(self, action: #selector(passwordDidEnterText), for: UIControl.Event.editingDidEndOnExit)
        let viewTapped = UITapGestureRecognizer(target: self, action: #selector(viewIsTapped))
        view.addGestureRecognizer(viewTapped)
    }
    
    @objc func viewIsTapped() {
        view.endEditing(true)
    }

    @objc func passwordDidEnterText() {
        passwordTextField.resignFirstResponder()
        if passwordTextField.text != CORRECT_PASSWORD {
            let shakeAnimation = CAKeyframeAnimation(keyPath: "position.x")
//            shakeAnimation.values = [0, -15, 15, -15, 15, -15, 15, 0]
//            shakeAnimation.keyTimes = [0, 0.15, 0.3, 0.45, 0.6, 0.75, 0.9, 1]
            shakeAnimation.values = [0, -15, 15, -15, 15, 0]
            shakeAnimation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
            shakeAnimation.duration = 0.4
            shakeAnimation.isAdditive = true
            passwordTextField.layer.add(shakeAnimation, forKey: nil)
        } else {
            alert(title: "GREAT JOB", message: "You Remembered your Password...")
        }
    }
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
