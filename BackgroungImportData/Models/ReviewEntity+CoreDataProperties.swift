//
//  ReviewEntity+CoreDataProperties.swift
//  BackgroungImportData
//
//  Created by Alexandr on 3/17/25.
//
//

import Foundation
import CoreData


extension ReviewEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReviewEntity> {
        return NSFetchRequest<ReviewEntity>(entityName: "ReviewEntity")
    }

    @NSManaged public var comment: String?
    @NSManaged public var date: String?
    @NSManaged public var rating: Int64
    @NSManaged public var reviewerEmail: String?
    @NSManaged public var reviewerName: String?
    @NSManaged public var review: ProductEntity?

}

extension ReviewEntity : Identifiable {

}
