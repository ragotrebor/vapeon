//
//  RegisterViewController.swift
//  vapeon
//
//  Created by Roberto García on 26-12-17.
//  Copyright © 2017 Roberto García. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleRegistration(){
//        let password = passwordTextField.text
//        let confirmPassword = confirmPasswordTextField.text
//        let email = emailTextField.text

//        if password != confirmPassword {
//            print("Fallo de confirmación de contraseña")
//            return
//        } else if email!.isEmpty || confirmPassword!.isEmpty || password!.isEmpty {
//            print("Algun valor es vacio")
//            return
//        }
        let password = "123123"
        let email = "raton@lala.cl"
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                //return
            } else {
                print("\(user!.email!) created")
            }
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        handleRegistration()
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // MARK: - TextFieldDelegate

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            view.endEditing(true)
            handleRegistration()
        default:
            return true
        }
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
