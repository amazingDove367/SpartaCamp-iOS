//
//  PhoneBook+CoreDataProperties.swift
//  CoreData_Practice
//
//  Created by kingj on 4/16/25.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    // Key
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?

}

extension PhoneBook : Identifiable {

}
