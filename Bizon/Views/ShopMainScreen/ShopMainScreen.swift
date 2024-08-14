import SwiftUI

struct ShopMainScreen: View {
    var shop: Shop
    
    @State private var rating: Double
    
    var maximumRating = 5
    var offImageStar: Image?
    var onImageStar = Image(systemName: "star.fill")
    // Колір не зафарбованої зірочки
    var offColorStar = Color.gray
    // Колір зафарбованої зірочки
    var onColorStar = Color.yellow
    
    init(shop: Shop) {
        self.shop = shop
        self._rating = State(initialValue: shop.rating)
    }
    
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
                    
                    HStack {
                        // Зірки (рейтинг)
                        ForEach(1..<maximumRating + 1, id: \.self) { number in
                            self.image(for: number)
                                .foregroundColor(number > Int(self.rating.rounded()) ? self.offColorStar : self.onColorStar)
                                .onTapGesture {
                                    // Оновлює рейтинг при натисканні
                                    self.rating = Double(number)
                                }
                                .padding(1)
                        }
                        // Числовий рейтинг
                        Text(String(format: "%.1f", rating))
                            .foregroundColor(.gray)
                            .font(.system(size: 17))
                            .padding(.leading, 1)
                        
                        // Кнопка - залишити відгук
                        Button (action: {
                            print("Action - Открывается меню Оставить отзыв")
                        })  {
                            Text("Оставить отзыв")
                                .foregroundColor(.green)
                                .overlay(
                                    DashedUnderline()
                                        .foregroundColor(.green)
                                )
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
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
    
    func image(for number: Int) -> Image {
        if number > Int(rating.rounded()) {
            // Якщо не зафарбована зірочка не задана, використовує зафарбовану
            return offImageStar ?? onImageStar
        } else {
            return onImageStar
        }
    }
}

struct ShopMainScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShopMainScreen(shop: Shop(id: 01, typeOfBussines: .cafe, listOfProducts: [], newsAndDiscount: [], name: "Picolini", address: "Леси Украинки, 34, Киев", deliveryTime: 40, rating: 3.7, cashBack: 5, discount: 10, personalBalance: 345, qrCodeName: "qr", imageName: "picolini"))
    }
}
