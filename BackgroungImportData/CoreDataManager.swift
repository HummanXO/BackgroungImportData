import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BackgroungImportData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveProducts(from products: [Product]) {
        let context = persistentContainer.viewContext
        
        for product in products {
            let entity = ProductEntity(context: context)
            entity.id = Int64(product.id)
            entity.title = product.title
            entity.desc = product.description
            entity.category = product.category
            entity.price = product.price
            entity.discountPercentage = product.discountPercentage
            entity.rating = product.rating
            entity.stock = Int64(product.stock)
            entity.brand = product.brand
            entity.sku = product.sku
            entity.weight = Int64(product.weight)
            entity.warrantyInformation = product.warrantyInformation
            entity.shippingInformation = product.shippingInformation
            entity.availabilityStatus = product.availabilityStatus
            entity.returnPolicy = product.returnPolicy
            entity.minimumOrderQuantity = Int64(product.minimumOrderQuantity)
            entity.thumbnail = product.thumbnail
            entity.tags = product.tags as NSArray
            entity.images = product.images as NSArray
            
            let dimensions = DimensionsEntity(context: context)
            dimensions.height = product.dimensions.height
            dimensions.width = product.dimensions.width
            dimensions.depth = product.dimensions.depth
            entity.dimensions = dimensions
            
            let meta = MetaEntity(context: context)
            meta.createdAt = product.meta.createdAt
            meta.updatedAt = product.meta.updatedAt
            meta.barcode = product.meta.barcode
            meta.qrCode = product.meta.qrCode
            entity.meta = meta
            
            for review in product.reviews {
                let reviewEntity = ReviewEntity(context: context)
                reviewEntity.rating = Int64(review.rating)
                reviewEntity.comment = review.comment
                reviewEntity.date = review.date
                reviewEntity.reviewerName = review.reviewerName
                reviewEntity.reviewerEmail = review.reviewerEmail
                entity.addToReview(reviewEntity)
            }
        }
        do {
            try context.save()
            print("Data successfully saved")
        } catch {
            print("Data not saved")
        }
    }
    
    func fetchData() -> [ProductEntity]? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Fetch failed: \(error)")
            return nil
        }
    }
}

