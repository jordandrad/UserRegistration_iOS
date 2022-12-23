//
//  DeleteViewController.swift
//  account_app
//
//  Created by Jordan Andrade on 17/12/22.
//

import UIKit

class DeleteViewController: UIViewController {
    var accountBrain = AccoountManager()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        accountBrain.deleteAccount()
        accountBrain.setHasAccount(to: false)
        self.view.window?.rootViewController?.dismiss(animated: true)
  
       
        
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
