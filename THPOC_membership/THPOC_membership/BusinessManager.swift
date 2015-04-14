//
//  BusinessManager.swift
//  THPOC_membership
//
//  Created by Dev on 3/24/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import Foundation


class BusinessManager
{
    
    func Login(credential: LoginCredential) -> Bool {
        
    
        if (credential.userName == "test" && credential.pin ==  "123")
        {
            return true
        }
        
        return false
        
    }
    
   // func register(req: RegistrationRequest) -
}