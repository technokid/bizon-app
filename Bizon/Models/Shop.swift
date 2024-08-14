

import SwiftUI

struct Shop {
    var id: Int
    var typeOfBussines: TypeOfBussines
    var listOfProducts: [Product]
    var newsAndDiscount: [NewsAndDiscount]
    var name: String
    var address: String
    var deliveryTime: Int
    var rating: Double
    var cashBack: Int
    var discount: Int
    var personalBalance: Int
    
    // private var
    var qrCodeName: String
//    var qr: Image {
//        Image(qrCodeName)
//    }
    
    // private var
    var imageName: String = "picolini"
//    var image: Image {
//        Image(imageName)
//    }
}
