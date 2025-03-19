import Foundation

struct RepositoryRespone: Codable {
    var products: [Product]
}

struct Product: Codable {
    var id: Int
    var title: String
    var description: String
    var category: String
    var price: Double
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var tags: [String]
    var brand: String?
    var sku: String
    var weight: Int
    var dimensions: Dimensions
    var warrantyInformation: String
    var shippingInformation: String
    var availabilityStatus: String
    var reviews: [Review]
    var returnPolicy: String
    var minimumOrderQuantity: Int
    var meta: Meta
    var images: [String]
    var thumbnail: String
}

struct Dimensions: Codable {
    var height: Double
    var width: Double
    var depth: Double
}

struct Review: Codable {
    var rating: Int
    var comment: String
    var date: String
    var reviewerName: String
    var reviewerEmail: String
}

struct Meta: Codable {
    var createdAt: String
    var updatedAt: String
    var barcode: String
    var qrCode: String
}
