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

    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(),
        GridItem(),
    ]
    var body: some View {
        NavigationView{
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(data, id: \.self) { item in
                    NavigationLink(destination: DetailsScreenView()) {
                        VStack{
                            KFImage.url(URL(string:"http://pics1.ds-static.com/prodimg/193587/300.JPG"))
                                .frame(
                                    width: 50 ,height: 200)
                                .scaledToFit()
                                .padding()
//                                .placeholder(UIImage(named: "placeholder-image"))
                                Spacer()
                                HStack{
                                    Text("product 3\(item)")
                                        .foregroundColor(.black)
                                        .bold()
                                        .lineLimit(1)
                                        .font(.system(size: 20))
                                        .minimumScaleFactor(0.5)
                                    Text("390 LE")
                                        .foregroundColor(.black)
                                        .font(.system(size: 10))
                                }.padding(.bottom , 5)
                                
                                Text("Traps & Locks Dust & Allergens* Swiffer Dusters Refills trap and lock dust and allergens* with thousands of fluffy fibers. That s because each fluffy, flexible fiber features Dust Lock Adhesive that traps and locks dust away for good. The unique fluffy fibers can also change shape to get into nooks and crannies and dust virtually any surface for a great clean. Swiffer Duster Handle sold separately.  <br />\n 1,000s of fluffy fibers <br />\n Easy-to-replace Dusters refill <br />\n Dust Lock Adhesive traps and locks dust <br />\n")
                                    .lineLimit(2)
                                    .foregroundColor(.gray.opacity(100))
                                    .font(.system(size: 12))
                                    .multilineTextAlignment(.leading)
//                            Spacer()
                         
                        }
                        .frame(height: 350)
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
