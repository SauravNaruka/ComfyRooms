//
//  ContentView.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/17/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI

enum Tabs{
    case beds, desk
}

struct ContentView : View {
    private var models: [Model] = {
        let fileManager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let file = try? fileManager.contentsOfDirectory(atPath: path) else{
            return []
        }
        
        var avilableModels: [Model] = []
        for filename in file where filename.hasSuffix("usdz") && !filename.hasPrefix("chair") {
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            avilableModels.append(model)
        }
        
        return avilableModels
    }()
    
    private var chairModels: [Model] = {
        let fileManager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let file = try? fileManager.contentsOfDirectory(atPath: path) else{
            return []
        }
        
        var avilableModels: [Model] = []
        for filename in file where filename.hasSuffix("usdz") && filename.hasPrefix("chair"){
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            avilableModels.append(model)
        }
        
        return avilableModels
    }()
    
    var body: some View {
        NavigationView{
            VStack{
                VStack(alignment: .leading){
                    Text("Beds")
                        .font(.title)
                        .padding()
                    
                    ProductsView(products: self.models)
                }
                .padding(.bottom)
                
                VStack(alignment: .leading){
                    Text("Sofa")
                        .font(.title)
                        .padding()
                    
                    ProductsView(products: self.chairModels)
                }
                .padding(.bottom)
                
                Spacer()
            }
            
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
