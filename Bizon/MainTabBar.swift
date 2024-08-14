

import SwiftUI

struct MainTabBar: View {
    var body: some View {
        TabView {
            ShopMainScreen(shop: Shop(id: 01, typeOfBussines: .cafe, listOfProducts: [], newsAndDiscount: [], name: "Picolini", address: "Леси Украинки, 34, Киев", deliveryTime: 40, rating: 4.7, cashBack: 5, discount: 10, personalBalance: 345, qrCodeName: "qr", imageName: "picolini"))
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Shop")
                    }
                }
                
            //TODO: add screen
            Text("Мой счет")
                .tabItem {
                    VStack {
                        Image(systemName: "wallet.pass.fill")
                        Text("My balance")
                    }
                }
            
            //TODO: add screen
            Text("Каталог товаров")
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("Catalog")
                    }
                }
            
            //TODO: add screen
            Text("Доп меню")
                .tabItem {
                    VStack {
                        Image(systemName: "ellipsis")
                        Text("OtherMenu")
                    }
                }
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
