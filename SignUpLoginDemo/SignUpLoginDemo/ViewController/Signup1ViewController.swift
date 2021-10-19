//
//  SignUpViewController.swift
//  SignUpLoginDemo
//
//  Created by Panchami Shenoy on 18/10/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class Signup1ViewController: UIViewController {

    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var secondNameTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || secondNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "please fill in all details"
        }
       let cleanpassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if utilities.isPasswordValid(cleanpassword) == false {
            return "please enter password with minimum 8 character with atleast one special character and one number"
        }
        
        return nil
    }
    
    @IBAction func onSignup(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }else{
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let secondName = secondNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                if err != nil {
                    self.showError("error creating user")
                }
                else{
                    
                    let db = Firestore.firestore()
                    
                    db.collection("Users").addDocument(data: ["firstname":firstName, "lastname":secondName,"uid":result!.user.uid]){(error) in
                        if error != nil {
                            self.showError("user data cudnt")
                        }
                    }
                    self.transitionToHome()
                        
                    }
                    
                }
            }
            
            
            
        }
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier:"homeVC") as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
}

