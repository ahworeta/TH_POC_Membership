//
//  ContentResult.swift
//  THPOC_membership
//
//  Created by Matt Solano on 4/8/15.
//  Copyright (c) 2015 Inflexxion. All rights reserved.
//

import Foundation
import CoreData

class ContentResult: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var value: String

}
