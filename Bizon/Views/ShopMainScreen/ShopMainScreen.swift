import SwiftUI

struct ShopMainScreen: View {
    var shop: Shop
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "clock")
                        Text("Доставка в течении:")
                            .foregroundColor(.gray)
                        Text("\(shop.deliveryTime) мин.")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.top, 40)
                    
                    Divider()
                    
                    HStack {
                        Text("\(shop.name)")
                            .font(.system(size: 36))
                        HStack {
                            Spacer()
                            Button(action: {
                                print("trashButton")
                            }) {
                                Image(systemName: "cart.fill")
                                    .foregroundColor(.gray)
                                    .font(.body)
                            }
                            
                            Button(action: {
                                print("likeButton")
                            }) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(.gray)
                                    .font(.body)
                            }
                            
                            Button(action: {
                                print("commentButton")
                            }) {
                                Image(systemName: "message.fill")
                                    .foregroundColor(.gray)
                                    .font(.body)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 16)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                    .padding(.top, 20)
                    
                    Text("\(shop.address)")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 16)
                    
                    Image(shop.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(16)

                }
            }
            .background(Color("bgColor"))
            .navigationBarItems(
                leading:
                    HStack {
                        Image("logo")
                            .resizable()
                            .frame(width: 65, height: 35)
                    },
                trailing: HStack {
                    Button(action: {
                        print("SearchButton")
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        print("showOtherMenu")
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.black)
                    }
                }
            )
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct ShopMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShopMainScreen(shop: Shop(id: 01, typeOfBussines: .cafe, listOfProducts: [], newsAndDiscount: [], name: "Picolini", address: "Леси Украинки, 34, Киев", deliveryTime: 40, rating: 4.7, cashBack: 5, discount: 10, personalBalance: 345, qrCodeName: "qr", imageName: "picolini"))
    }
}
