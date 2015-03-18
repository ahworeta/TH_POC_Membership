//
//  LoginCredential.swift
//  THPOC_membership
//
//  Created by Dev on 3/17/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import Foundation

class LoginCredential
{
    var userName:String
    var pin:String
    
    init(loginUserName:String, loginPin:String)
    {
        userName = loginUserName
        pin = loginPin
    }
}