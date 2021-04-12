//
//  WorkerEntity+CoreDataProperties.swift
//  TestProject
//
//  Created by Viktoriia Skvarko on 10.04.2021.
//
//

import Foundation
import CoreData


extension WorkerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkerEntity> {
        return NSFetchRequest<WorkerEntity>(entityName: "WorkerEntity")
    }

    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var secondName: String?
    @NSManaged public var birthday: String?
    @NSManaged public var company: String?

}

extension WorkerEntity : Identifiable {

}
