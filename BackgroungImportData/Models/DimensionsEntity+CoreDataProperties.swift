//
//  DimensionsEntity+CoreDataProperties.swift
//  BackgroungImportData
//
//  Created by Alexandr on 3/17/25.
//
//

import Foundation
import CoreData


extension DimensionsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DimensionsEntity> {
        return NSFetchRequest<DimensionsEntity>(entityName: "DimensionsEntity")
    }

    @NSManaged public var depth: Double
    @NSManaged public var height: Double
    @NSManaged public var width: Double

}

extension DimensionsEntity : Identifiable {

}
