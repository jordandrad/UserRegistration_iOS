//
//  UserValidation.swift
//  account_app
//
//  Created by Jordan Andrade on 10/12/22.
//

import UIKit

struct UserValidation{
    
    var accountBrain = AccoountManager()
  
    var canAccess = false
    var typedUsername: String?
    var typedPassword: String?
   
    mutating  func setLoginStatus(_ username: String,_ password: String)  {
            self.typedUsername = username
            self.typedPassword = password
    }
    
    func textFields(_ a : UITextField, _ b : UITextField, _ c : UITextField, _ d : UITextField) -> Bool {
        if a.text == "" || b.text == "" || c.text == "" || d.text == ""{
            return false
        } else {return true}
    }
    
    mutating func setAccess(){
        let hasAccount = accountBrain.getHasAccount()
        let username = accountBrain.getUsername()
        let password = accountBrain.getPassword()
        if typedUsername == username && typedPassword == password && hasAccount{
             canAccess = true
        }; if hasAccount && typedUsername != username {
             canAccess = false
        };if hasAccount && typedPassword != password {
            canAccess = false
        };if hasAccount == false{
            canAccess = false
        } else{
            canAccess = false
        }
    }
    
    mutating func getLoginStatus() -> String{
        let username = accountBrain.getUsername()
        let password = accountBrain.getPassword()
        let hasAccount = accountBrain.getHasAccount()
        if typedUsername == username && typedPassword == password && hasAccount{
             canAccess = true
             return "Welcome to your app!"
        }; if typedUsername == "" || typedPassword == ""{
            return "Fill all fields"
        }; if hasAccount && typedUsername != username && typedPassword != password{
            return "Wrong username and password"
        }; if hasAccount && typedUsername != username {
             canAccess = false
             return "Wrong username"
        };if hasAccount && typedPassword != password {
            canAccess = false
            return "Wrong password"
        };if hasAccount == false{
            canAccess = false
            return "Please create an account first"
        };          return "Hello, welcome to your app!"
         
     }
    
    mutating func getFirstStatus() -> String {
        if accountBrain.getHasAccount(){
            return "Welcome back, \(accountBrain.getUsername())!"
        }
        else {return "Welcome to your app!"}
    }
    
    mutating func canResetPassword(_ email: String) -> Bool {
        if email != accountBrain.getEmail(){
            return false
        } else {return true}
    }
    
    func validate(email: String) -> Bool {
        if email.contains("@") && email.contains("."){
            return true
        }
        else {return false}
    }
}

