//
//  PortraitModeView.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import SwiftUI
import Kingfisher
struct PortraitModeView: View {
    var product : Product
    var body: some View {
        ScrollView {
        VStack{
            Spacer()
            Text(product.name ?? "")
                .lineLimit(1)
                .font(.system(size: 20))
                .minimumScaleFactor(0.5)
            Spacer()
            KFImage.url(URL(string :  product.imageURL ?? "" ))
                .placeholder{
                    KFImage.url(URL(string :  Constants.DefaultImage )).cacheMemoryOnly()
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .padding([.horizontal, .top], 7)
                        .frame(width: 100, height: 150)
                }
                .cacheMemoryOnly()
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding([.horizontal, .top], 7)
                .frame(width: 100, height: 150)
            
            
            product.description?.applyHTMLTags()
            //                Text(product.description ?? "")
            //
            //                    .font(.system(size: 20))
            //                    .minimumScaleFactor(0.5)
            
            
            Spacer()
        }.padding()
    }
            
        }
}

struct PortraitModeView_Previews: PreviewProvider {
    static var previews: some View {
        PortraitModeView(product: Product(id: "", name: "", description: "", price: "", imageURL: ""))
    }
}
