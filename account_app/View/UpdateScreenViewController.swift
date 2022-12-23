//
//  UpdateScreenViewController.swift
//  account_app
//
//  Created by Jordan Andrade on 17/12/22.
//

import UIKit

class UpdateScreenViewController: UIViewController {

    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var NewUsernameTextField: UITextField!
    @IBOutlet weak var NewPasswordTextField: UITextField!
    @IBOutlet weak var NewEmailTextField: UITextField!
    @IBOutlet weak var NewBirthDateTextField: UITextField!
    let accountBrain = AccoountManager()
    let validation = UserValidation()
    var delegate: passDataDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updatePressed(_ sender: Any) {
        if let safeNewUsername = NewUsernameTextField.text{
            accountBrain.setUsername(safeNewUsername)
        }
        
        if let safeNewPassword = NewPasswordTextField.text{
            accountBrain.setPassword(safeNewPassword)
        }
        
        if let safeNewEmail = NewEmailTextField.text{
            accountBrain.setEmail(safeNewEmail)
        }
        
        if let safeBirthDate = NewBirthDateTextField.text{
            accountBrain.setBirthDate(safeBirthDate)
        }
        
        if validation.validate(email: NewEmailTextField.text ?? "") == false {
            MainLabel.text = "Invalid email"
            }
        
        else if validation.textFields(NewUsernameTextField, NewPasswordTextField, NewEmailTextField, NewBirthDateTextField){
            NewUsernameTextField.text = ""
            NewPasswordTextField.text = ""
            NewEmailTextField.text = ""
            NewBirthDateTextField.text = ""
            delegate?.updateLabel()
            MainLabel.text = "Done! Data up to date"
           Timer.scheduledTimer(withTimeInterval: 3, repeats: false) {_ in
               self.dismiss(animated: true)
           }
        } else{
            MainLabel.text = "Fill all fields"
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
extension UpdateScreenViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
