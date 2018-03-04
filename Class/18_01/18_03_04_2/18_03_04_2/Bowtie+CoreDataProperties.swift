//
//  Bowtie+CoreDataProperties.swift
//  18_03_04_2
//
//  Created by 배지호 on 2018. 3. 4..
//  Copyright © 2018년 baejiho. All rights reserved.
//
//

import Foundation
import CoreData


extension Bowtie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bowtie> {
        return NSFetchRequest<Bowtie>(entityName: "Bowtie")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var tintColor: NSObject?
    @NSManaged public var url: URL?
    @NSManaged public var timesWorn: Int32
    @NSManaged public var searchKey: String?
    @NSManaged public var rating: Double
    @NSManaged public var photoData: NSData?
    @NSManaged public var lastWorn: NSDate?
    @NSManaged public var isFavorite: Bool

}
