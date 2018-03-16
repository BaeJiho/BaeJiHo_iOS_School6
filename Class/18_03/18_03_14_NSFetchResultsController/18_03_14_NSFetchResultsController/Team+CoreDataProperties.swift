//
//  Team+CoreDataProperties.swift
//  18_03_14_NSFetchResultsController
//
//  Created by 배지호 on 2018. 3. 14..
//  Copyright © 2018년 baejiho. All rights reserved.
//
//

import Foundation
import CoreData


extension Team {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Team> {
        return NSFetchRequest<Team>(entityName: "Team")
    }

    @NSManaged public var imageName: String?
    @NSManaged public var losses: Int32
    @NSManaged public var qualiftingZone: String?
    @NSManaged public var teamName: String?
    @NSManaged public var wins: Int32

}
