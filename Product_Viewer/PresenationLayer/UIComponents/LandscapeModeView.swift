//
//  LandscapeModeView.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import SwiftUI
import Kingfisher
struct LandscapeModeView: View {
    
    var product : Product
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Spacer()
                    Text(product.name ?? "")
                        .lineLimit(1)
                        .font(.system(size: 20))
                        .minimumScaleFactor(0.5)
                        .frame(alignment: .leading)
                    Spacer()
                    KFImage.url(URL(string : product.imageURL?.description ?? "" ))
                        .placeholder{
                            Image("Default_Product_Images")
                                .resizable()
                                .cornerRadius(20)
                                .padding([.horizontal, .top], 7)
                                .frame(width: 100, height: 100)
                        }
                        .cacheMemoryOnly()
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding([.horizontal, .top], 7)
                        .frame(width: 100, height: 150)
                    
                    Spacer()
                }
                product.description?.applyHTMLTags()
                //            Text(product.description ?? "")
                //          
                //                .font(.system(size: 20))
                //                .minimumScaleFactor(0.5)
                
            }
        }
    }
}

struct LandscapeModeView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeModeView(product:  Product(id: "", name: "", description: "", price: "", imageURL: ""))
    }
}
