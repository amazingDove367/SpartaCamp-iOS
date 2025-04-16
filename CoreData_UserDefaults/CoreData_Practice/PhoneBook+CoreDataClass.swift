//
//  PhoneBook+CoreDataClass.swift
//  CoreData_Practice
//
//  Created by kingj on 4/16/25.
//
//

import Foundation
import CoreData

@objc(PhoneBook)
public class PhoneBook: NSManagedObject {
    public static let className = "PhoneBook"
    public enum Key {
        static let name = "name"
        static let phoneNumber = "phoneNumber"
    }
}
