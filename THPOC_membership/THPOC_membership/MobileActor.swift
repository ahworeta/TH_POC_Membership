//
//  MobileActor.swift
//  THPOC_membership
//
//  Created by Allen Xu on 4/10/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import Foundation

class MobileActor {
    
    var DeviceId: NSString!
    var MembershipId: NSString?
    var SecurityToken: NSString!
    var DomainId: NSString!

    init(_deviceId:NSString, _membershipId:NSString, _securityToken:NSString, _domainId:NSString)
    {
        DeviceId = _deviceId
        MembershipId = _membershipId
        SecurityToken = _securityToken
        DomainId = _domainId
    }
}

class MobileRequestBase {
    var Actor: MobileActor!
    
    init(actor:MobileActor){
        Actor = actor
    }
}

class RegistrationRequest : MobileRequestBase {
    var Email: NSString!
    var Password: NSString!
    
    init(actor: MobileActor, _email: NSString, _password:NSString){
        super.init(actor: actor)
        Email = _email
        Password = _password
    }
}