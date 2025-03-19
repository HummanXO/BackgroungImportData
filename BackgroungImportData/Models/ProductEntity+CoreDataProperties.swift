//
//  ProductEntity+CoreDataProperties.swift
//  BackgroungImportData
//
//  Created by Alexandr on 3/17/25.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var category: String?
    @NSManaged public var price: Double
    @NSManaged public var discountPercentage: Double
    @NSManaged public var rating: Double
    @NSManaged public var stock: Int64
    @NSManaged public var tags: NSArray?
    @NSManaged public var brand: String?
    @NSManaged public var sku: String?
    @NSManaged public var weight: Int64
    @NSManaged public var warrantyInformation: String?
    @NSManaged public var shippingInformation: String?
    @NSManaged public var availabilityStatus: String?
    @NSManaged public var returnPolicy: String?
    @NSManaged public var minimumOrderQuantity: Int64
    @NSManaged public var images: NSArray?
    @NSManaged public var thumbnail: String?
    @NSManaged public var review: NSSet?
    @NSManaged public var dimensions: DimensionsEntity?
    @NSManaged public var meta: MetaEntity?

}

// MARK: Generated accessors for review
extension ProductEntity {

    @objc(addReviewObject:)
    @NSManaged public func addToReview(_ value: ReviewEntity)

    @objc(removeReviewObject:)
    @NSManaged public func removeFromReview(_ value: ReviewEntity)

    @objc(addReview:)
    @NSManaged public func addToReview(_ values: NSSet)

    @objc(removeReview:)
    @NSManaged public func removeFromReview(_ values: NSSet)

}

extension ProductEntity : Identifiable {

}
