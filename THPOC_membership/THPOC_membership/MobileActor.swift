//
//  MobileActor.swift
//  THPOC_membership
//
//  Created by Allen Xu on 4/10/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import Foundation

class MobileActor {
    
    var _deviceId: NSString!
    var _membershipId: NSString?
    var _securityToken: NSString!
    var _domainId: NSString!

    init(deviceId:NSString, membershipId:NSString, securityToken:NSString, domainId:NSString)
    {
        _deviceId = deviceId
        _membershipId = membershipId
        _securityToken = securityToken
        _domainId = domainId
    }
}

class MobileRequestBase {
    var _actor: MobileActor!
    
    init(actor:MobileActor){
        _actor = actor
    }
}

class RegistrationRequest : MobileRequestBase {
    var _email: NSString!
    var _password: NSString!
    
    init(actor: MobileActor, email: NSString, password:NSString){
        super.init(actor: actor)
        _email = email
        _password = password
    }
}