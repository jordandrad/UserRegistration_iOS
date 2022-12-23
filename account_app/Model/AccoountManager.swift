//
//  AccountBrain.swift
//  account_app
//
//  Created by Jordan Andrade on 07/12/22.
//

import UIKit

protocol passDataDelegate{
    func updateLabel()
}

struct AccoountManager{
    
    let keys = DefaultsKeys()
    let defaults = UserDefaults.standard
 
    func setHasAccount(to bool: Bool){
    defaults.set(bool, forKey: keys.hasAccountKey)
    }
    
    func setUsername(_ username: String){
    defaults.set(username, forKey: keys.usernameKey)
    }
    
    func setPassword(_ password: String){
    defaults.set(password, forKey: keys.passwordKey)
    }
    
    func setEmail(_ email: String){
    defaults.set(email, forKey: keys.emailKey)
    }
    
    func setBirthDate(_ date: String){
    defaults.set(date, forKey: keys.birthDateKey)
    }
    
    func getHasAccount() -> Bool{
        defaults.bool(forKey: keys.hasAccountKey)
    }
    
    func getUsername() -> String {
        return defaults.string(forKey: keys.usernameKey) ?? "There's no username registred yet"
    }
    
    func getPassword() -> String {
        return defaults.string(forKey: keys.passwordKey) ?? "There's no password registred yet"
    }
    
    func getEmail()-> String {
        return defaults.string(forKey: keys.emailKey) ?? "There's no email registred yet"
    }
    
    func getBirthDate() -> String{
        return defaults.string(forKey: keys.birthDateKey) ?? "There's no date registred yet"
    }
    
    func deleteAccount(){
        defaults.removeObject(forKey: keys.usernameKey)
        defaults.removeObject(forKey: keys.passwordKey)
        defaults.removeObject(forKey: keys.emailKey)
        defaults.removeObject(forKey: keys.birthDateKey)
    }
}
   
    
    

