//
//  RecoverPasswordViewController.swift
//  account_app
//
//  Created by Jordan Andrade on 17/12/22.
//

import UIKit

class RecoverPasswordViewController: UIViewController {

    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var NewPasswordTextField: UITextField!
    var validation = UserValidation()
    var accountBrain = AccoountManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recoverButtonPressed(_ sender: UIButton) {
        if let safePassword = NewPasswordTextField.text,let safeEmail = EmailTextField.text, validation.canResetPassword(safeEmail){
            accountBrain.setPassword(safePassword)
            EmailTextField.text = ""
            NewPasswordTextField.text = ""
            MainLabel.text = "Done! Sign in again"
            Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {_ in
                self.dismiss(animated: true)
            }
        } else {
            MainLabel.text = "Try again"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - UITextFieldDelegate
extension RecoverPasswordViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
