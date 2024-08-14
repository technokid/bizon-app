

import SwiftUI


struct NewsAndDiscount {
    var id: Int
    var name: String
    var date: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
