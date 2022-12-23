//
//  ViewController.swift
//  account_app
//
//  Created by Jordan Andrade on 21/10/22.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextfield: UITextField!
    var accountBrain = AccoountManager()
    var validation = UserValidation()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        validation.setAccess()
        MainLabel.text = validation.getFirstStatus()
    }

    @IBAction func CreateAccountPressed(_ sender: UIButton) {
        if accountBrain.getHasAccount() == false {
            self.performSegue(withIdentifier: "goToAccountCreator", sender: self)
            MainLabel.text = "Welcome!"
        } else {
            MainLabel.text = "You're alredy registered"
        }
    }
    
    @IBAction func forgotPasswordPressed(_ sender: Any) {
        if accountBrain.getHasAccount() == true {
            performSegue(withIdentifier: "goToRecover", sender: self)
        } else {
            MainLabel.text = "SignUp first"
        }
    }
    
    
    @IBAction func EnterPressed(_ sender: UIButton) {
        validation.setLoginStatus(UsernameTextField.text!,PasswordTextfield.text!)
        validation.setAccess()
        UsernameTextField.text = ""
        PasswordTextfield.text = ""
        let status = validation.getLoginStatus()
        if validation.canAccess {
            MainLabel.text = status
            self.performSegue(withIdentifier: "goToHome", sender: self)
        } else{
            MainLabel.text = status
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome"{
            let destinationVC = segue.destination as! HomeViewController
            destinationVC.homeLabelValue = "Hello, \(accountBrain.getUsername())!"
            destinationVC.usernameValue = accountBrain.getUsername()
            destinationVC.passwordValue = accountBrain.getPassword()
            destinationVC.emailValue = accountBrain.getEmail()
            destinationVC.birthDateValue = accountBrain.getBirthDate()
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.modalTransitionStyle = .crossDissolve
        }
   
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

