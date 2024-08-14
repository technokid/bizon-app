

import SwiftUI

struct Product {
    var id: Int
    var name: String
    var price: Double
    var cashbackAmount: Int
    var discountValidUntil: String
    var discountPrice: Int
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
