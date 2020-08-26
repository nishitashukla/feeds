//
//  LoginViewController.swift
//  Feeds
//
//  Created by Nishita Shukla on 26/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import UIKit

enum LoginError:String
{
    case emptyUsername = "**Username is empty"
    case emptyPassword = "**Password is empty"
    case invalidLogin = "**Username or Password is invalid"
}

class LoginViewController: UIViewController,UITextFieldDelegate
{
    
    //MARK: Variables
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var lblUsernameError: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblPasswordError: UILabel!
    @IBOutlet weak var lblLoginError: UILabel!
    
    
    lazy var loginViewModel:LoginViewModel = {
        return LoginViewModel()
    }()
    
    //MARK: LifeCycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.txtUsername.delegate = self;
        self.txtPassword.delegate = self;
    }
    
    //MARK: Button Action
    @IBAction func btnLoginPressed(_ sender: UIButton)
    {
        if(!loginViewModel.checkSignIn(forUsername: self.txtUsername.text, forPassword: self.txtPassword.text))
        {
            var isUsernameError = false
            var isPasswordError = false;

            if (loginViewModel.validateUsername(username: self.txtUsername.text) != nil)
            {
                isUsernameError = true
                textFieldInvalidError(lblError: self.lblUsernameError, errorMessage: loginViewModel.validateUsername(username: self.txtUsername.text))
            }
            
            if (loginViewModel.validatePassword(password: self.txtPassword.text) != nil)
            {
                isPasswordError = true;
              textFieldInvalidError(lblError: self.lblPasswordError, errorMessage: loginViewModel.validatePassword(password: self.txtPassword.text))
            }
            
            if(!isUsernameError && !isPasswordError)
            {
                self.lblUsernameError.isHidden = true;
                self.lblPasswordError.isHidden = true;
                textFieldInvalidError(lblError: self.lblLoginError, errorMessage: .invalidLogin)
            }
        }
        else
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let feedsViewController = storyBoard.instantiateViewController(withIdentifier: "FeedsViewController") as! FeedsViewController
            self.navigationController?.pushViewController(feedsViewController, animated: true)
        }
    }
    
    //MARK: Show Error
    
    func textFieldInvalidError(lblError:UILabel,errorMessage:LoginError?)
    {
        
        if(errorMessage != nil)
        {
            lblError.text = errorMessage?.rawValue
            lblError.isHidden = false;
        }
        else
        {
            lblError.isHidden = true;
        }
    }
    
    //MARK: Textfield Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        if(textField == self.txtUsername)
        {
            textFieldInvalidError(lblError: self.lblUsernameError, errorMessage:loginViewModel.validateUsername(username: self.txtUsername.text))
        }
            
        else if(textField == self.txtPassword)
        {
            textFieldInvalidError(lblError: self.lblPasswordError, errorMessage:loginViewModel.validatePassword(password: self.txtPassword.text))
        }
        
    }
}
