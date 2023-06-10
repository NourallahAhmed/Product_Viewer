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
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    
    
    @StateObject var viewModel : HomeViewModel

    
    let columns = [
        GridItem(),
        GridItem(),
    ]
    var body: some View {
        NavigationView{
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.products ) { item in
                    NavigationLink(destination: DetailsScreenView(product: item.product)) {
                        VStack{
                            KFImage.url(URL(string : item.product.imageURL ?? "" ))
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
                                

//                                Spacer()
                                HStack{
                                    Text(item.product.name ?? "")
                                        .foregroundColor(.black)
                                        .bold()
                                        .lineLimit(0)
                                        .font(.system(size: 20))
                                        .minimumScaleFactor(0.5)
                                    Text(item.product.price ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 10))
                                }.padding(.bottom , 5)
                            item.product.description?
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
                        .frame(height: 250)
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
    
   
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        var remoteDataSource = RemoteDataSource()
        var localDataSource = LocalDataSource()
        var baseRepo = Repository(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
        var homeViewModel = HomeViewModel(baseRepository: baseRepo)
        
        
        HomeScreenView(viewModel: homeViewModel).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
