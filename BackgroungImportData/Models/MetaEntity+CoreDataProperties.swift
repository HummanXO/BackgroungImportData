//
//  MetaEntity+CoreDataProperties.swift
//  BackgroungImportData
//
//  Created by Alexandr on 3/17/25.
//
//

import Foundation
import CoreData


extension MetaEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MetaEntity> {
        return NSFetchRequest<MetaEntity>(entityName: "MetaEntity")
    }

    @NSManaged public var barcode: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var qrCode: String?
    @NSManaged public var updatedAt: String?

}

extension MetaEntity : Identifiable {

}
