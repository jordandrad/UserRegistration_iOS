//
//  AccountCreatorViewController.swift
//  account_app
//
//  Created by Jordan Andrade on 16/12/22.
//

import UIKit

class AccountCreatorViewController: UIViewController {

    @IBOutlet weak var NewUsernameTextField: UITextField!
    @IBOutlet weak var NewPasswordTextField: UITextField!
    @IBOutlet weak var NewEmailTextField: UITextField!
    @IBOutlet weak var NewBirthDateTextField: UITextField!
    @IBOutlet weak var MainLabel: UILabel!
    
    var validation = UserValidation()
    var accountBrain = AccoountManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
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
            accountBrain.setHasAccount(to: true)
                dismiss(animated: true)
            }
        else {
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
extension AccountCreatorViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if NewUsernameTextField.text == ""{
            NewUsernameTextField.placeholder = "Type your username"
        }
        if NewPasswordTextField.text == ""{
            NewPasswordTextField.placeholder = "Type ypur password"
        }
        if NewEmailTextField.text == ""{
            NewEmailTextField.placeholder = "Type your email"
        }
        if NewBirthDateTextField.text == ""{
            NewBirthDateTextField.placeholder = "Type your date of birth"
        }
        return true
        }
    }
    

