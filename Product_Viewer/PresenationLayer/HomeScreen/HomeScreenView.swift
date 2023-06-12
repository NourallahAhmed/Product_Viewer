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

    
    @StateObject var viewModel : HomeViewModel

    let columns = [ GridItem(), GridItem()]
    var body: some View {
        NavigationView{
            
            if viewModel.products.isEmpty == false {
                VStack{
                    if viewModel.isInternetConnectionEnabled  == false {
                        VStack{
                            Text("No Internet Connection").foregroundColor(.red)
                        }.frame(height: 20)
                    }
                    
                    ScrollView {
                        
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(viewModel.products ) { item in
                                NavigationLink(destination: DetailsScreenView(product: item)) {
                                    VStack{
                                        KFImage.url(URL(string : item.imageURL?.description ?? "" ))
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
                                                .font(.system(size: 15))
                                                .minimumScaleFactor(0.5)
                                            Text("\(item.price ?? "" ) L.E" )
                                                .foregroundColor(.black)
                                                .font(.system(size: 12))
                                        }.padding(.bottom , 5)
                                        item.description?
                                            .applyHTMLTags()
                                            .lineLimit(2)
                                            .foregroundColor(.gray.opacity(100))
                                            .font(.system(size: 12))
                                            .multilineTextAlignment(.leading)
                                        
                                        
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
            }
            else{
                //if first time and no data stored in DB
                if viewModel.loading {
                    LottieView(filename: "Loading" , loopMode: .loop)
                    
                }else if viewModel.error == ErrorMessages.genericError {
                    
                    // if any data changed from api and not handeled in the model
                    LottieView(filename: "SomeThingWentWrong" , loopMode: .loop)
                    
                }else if UserDefaults.standard.bool(forKey: "isEnterAppBefore") == true {
                    // user if fisrt time enter the app and not internet connection available
                    LottieView(filename: "noInternetConnection" , loopMode: .loop)
                }
                else{
                    // no data stored in DB
                    LottieView(filename: "noData" , loopMode: .loop)
                }
                
            }
            
        }.onAppear{
            print(UserDefaults.standard.bool(forKey: "isEnterAppBefore"))
            if UserDefaults.standard.bool(forKey: "isEnterAppBefore") == false  {
                UserDefaults.standard.set(true, forKey: "isEnterAppBefore")
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
