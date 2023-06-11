//
//  Persistence.swift
//  Product_Viewer
//
//  Created by NourAllah on 08/06/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Product_Viewer")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    func fetchItems() -> [LocalProducts] {
        let request = NSFetchRequest<LocalProducts>(entityName: "LocalProducts")
        do {
            let items = try PersistenceController.shared.container.viewContext.fetch(request)
            return items
        } catch {
            print("Error fetching items from CoreData: \(error)")
            return []
        }
    }
    
    func saveData(products : [ProductViewer]){
        let viewContext = PersistenceController.preview.container.viewContext
      
        for productViewer in products{
            print("products = \(productViewer.product.id)")
            let newItem = LocalProducts(context: viewContext)
            newItem.id = productViewer.product.id ?? ""
            newItem.name = productViewer.product.name ?? ""
            newItem.image_URL = productViewer.product.imageURL ?? ""
            newItem.discriptions = productViewer.product.description ?? ""
            newItem.price = productViewer.product.price ?? ""
        
            
            do {
                try viewContext.save()
                print("Saved")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            
        }
        
    }
    func clearLocalData(){
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LocalProducts")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try PersistenceController.preview.container.viewContext.execute(deleteRequest)
                try  PersistenceController.preview.container.viewContext.save()
            } catch {
                print("Error deleting data: \(error)")
            }
        
    }
}
