//
//  HomeScreenView.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import SwiftUI
import CoreData
import Kingfisher

struct HomeScreenView: View {
//
//    @FetchRequest(
//        sortDescriptors: [],
//        animation: .default)
//    private var items: FetchedResults<LocalProducts>
    
    @StateObject var viewModel : HomeViewModel

    let columns = [
    GridItem(),
    GridItem(),
    ]
    var body: some View {
        NavigationView{
            
            if viewModel.products.isEmpty == false {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.products ) { item in
                            NavigationLink(destination: DetailsScreenView(product: item)) {
                                VStack{
                                    KFImage.url(URL(string : item.imageURL ?? "" ))
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
                                        .frame(width: 100, height: 100)
                                    
                                    HStack{
                                        Text(item.name ?? "")
                                            .foregroundColor(.black)
                                            .bold()
                                            .lineLimit(0)
                                            .font(.system(size: 20))
                                            .minimumScaleFactor(0.5)
                                        Text(item.price ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 10))
                                    }.padding(.bottom , 5)
                                    item.description?
                                        .applyHTMLTags()
                                        .lineLimit(2)
                                        .foregroundColor(.gray.opacity(100))
                                        .font(.system(size: 12))
                                        .multilineTextAlignment(.leading)
                                    //                            Text(item.product.description ?? "")
                                    //                                    .lineLimit(2)
                                    //                                    .foregroundColor(.gray.opacity(100))
                                    //                                    .font(.system(size: 12))
                                    //                                    .multilineTextAlignment(.leading)
                                    //                            Spacer()
                                    
                                }
                                .frame(height: 200)
                                .padding()
                                .background(Color.gray.opacity(0.10))
                                .cornerRadius(20)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
            }
            
            else{
                //if first time and no data stored in DB
                LottieView(filename: "noData" , loopMode: .loop)
            }
        }
        
    }
    
   
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        var remoteDataSource = RemoteDataSource()
        var localDataSource = LocalDataSource()
        var baseRepo = Repository(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
        var useCase = GetProductUseCase(baseRepository: baseRepo)
        var homeViewModel = HomeViewModel(getProductsUseCase: useCase)
        
        
        HomeScreenView(viewModel: homeViewModel)
    }
}
