//
//  HomeScreenView.swift
//  Product_Viewer
//
//  Created by NourAllah on 09/06/2023.
//

import SwiftUI
import CoreData

struct HomeScreenView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
 
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        NavigationView{
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(data, id: \.self) { item in
                    NavigationLink(destination: DetailsScreenView()) {
                        VStack{
                            Image(systemName: "house")
                                .foregroundColor(.blue)
                                .frame(height: 200)
                            HStack{
                                Text("product \(item)")
                                    .lineLimit(1)
                                    .font(.system(size: 20))
                                    .minimumScaleFactor(0.5)
                                Text("390 LE")
                                    .font(.system(size: 10))
                            }.padding(.bottom)
                            Text("Traps & Locks Dust & Allergens* Swiffer Dusters Refills trap and lock dust and allergens* with thousands of fluffy fibers. That s because each fluffy, flexible fiber features Dust Lock Adhesive that traps and locks dust away for good. The unique fluffy fibers can also change shape to get into nooks and crannies and dust virtually any surface for a great clean. Swiffer Duster Handle sold separately.  <br />\n 1,000s of fluffy fibers <br />\n Easy-to-replace Dusters refill <br />\n Dust Lock Adhesive traps and locks dust <br />\n")
                                .lineLimit(2)
                                .font(.system(size: 10))
                        }
                        .frame(height: 300)
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
        HomeScreenView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
