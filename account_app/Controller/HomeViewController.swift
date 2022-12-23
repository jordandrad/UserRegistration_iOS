//
//  HomeViewController.swift
//  account_app
//
//  Created by Jordan Andrade on 20/12/22.
//
import UIKit

class HomeViewController: UIViewController {
   
    var accountBrain = AccoountManager()
    var homeLabelValue: String?
    var usernameValue: String?
    var passwordValue: String?
    var emailValue: String?
    var birthDateValue: String?
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var UsernameLabel: UIButton!
    @IBOutlet weak var PasswordLabel: UIButton!
    @IBOutlet weak var EmailLabel: UIButton!
    @IBOutlet weak var BirthDateLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeLabel.text = homeLabelValue
        UsernameLabel.setTitle(usernameValue, for: .normal)
        PasswordLabel.setTitle(passwordValue, for: .normal)
        EmailLabel.setTitle(emailValue, for: .normal)
        BirthDateLabel.setTitle(birthDateValue, for: .normal)
       
       // Do any additional setup after loading the view.
    }
 
    @IBAction func updateDataPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToUpdate", sender: self)
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func deleteAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToDelete", sender: self)
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUpdate"{
            if let updateVC = segue.destination as? UpdateScreenViewController{
                updateVC.delegate = self
            }
        }
    }
}

// MARK: PassDataDelegate

extension HomeViewController: passDataDelegate{
    func updateLabel() {
        homeLabel.text = "Hello, \(accountBrain.getUsername())!"
        UsernameLabel.setTitle(accountBrain.getUsername(), for: .normal)
        PasswordLabel.setTitle(accountBrain.getPassword(), for: .normal)
        EmailLabel.setTitle(accountBrain.getEmail(), for: .normal)
        BirthDateLabel.setTitle(accountBrain.getBirthDate(), for: .normal)
    }
}



    
    
    

    
    


