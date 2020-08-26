//
//  LoginViewModel.swift
//  Feeds
//
//  Created by Nishita Shukla on 26/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import Foundation

class LoginViewModel
{
    //MARK: Variables

    func validateUsername(username:String?) -> LoginError?
    {
        guard let userName = username, !userName.isEmpty else
        {
            return .emptyUsername;
        }
        return nil;
        
    }
    
    func validatePassword(password:String?) -> LoginError?
    {
        guard let passWord = password, !passWord.isEmpty else
        {
            return .emptyPassword;
        }
        return nil;
    }
    
    func checkSignIn(forUsername username:String? , forPassword password:String?)-> Bool
    {
        guard let userName = username else
        {
            return false
        }
        
        guard let passWord = password else
        {
            return false;
        }
        
        if(userName == "admin" && passWord == "admin")
        {
            return true;
        }
        
        return false
    }
}
