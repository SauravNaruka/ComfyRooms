//
//  ContentView.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/17/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI

func loadModels(by name: String) -> [Model]{
    let fileManager = FileManager.default
    
    guard let path = Bundle.main.resourcePath, let file = try? fileManager.contentsOfDirectory(atPath: path) else{
        return []
    }
    
    var avilableModels: [Model] = []
    for filename in file where filename.hasPrefix(name)  && filename.hasSuffix("usdz")  {
        let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
        let model = Model(modelName: modelName)
        avilableModels.append(model)
    }
    
    return avilableModels
}

struct ContentView : View {
    private var models: [Model] = loadModels(by: "type1")
    private var type2models: [Model] = loadModels(by: "type2")
    private var type3models: [Model] = loadModels(by: "type3")
    
    var body: some View {
        let products = Products(models: models + type2models + type3models)
        
        return NavigationView{
            VStack(alignment: .leading){
                Text("Comfy Homes")
                    .font(.title)
                    .padding(.leading)
                
                ProductsView(products: self.models)
                
                ProductsView(products: self.type2models)
                
                ProductsView(products: self.type3models)
                
                Spacer()
            }
            .environmentObject(products)
            
        }
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
