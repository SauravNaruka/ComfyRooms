//
//  Model.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/17/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    var price: Int
    var displayName: String
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String){
        self.modelName = modelName
        self.image = UIImage(named: modelName)!
        if let productInfo = productInfoMap[modelName] {
            self.price = productInfo.0
            self.displayName = productInfo.1
        } else {
            self.price = 0
            self.displayName = "Unknown"
        }
        
        let fileName = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: fileName)
            .sink(receiveCompletion: {loadComplition in
                print("Debug: Unable to load model for modelName for \(self.modelName)")
            }, receiveValue: {modelEntity in
                self.modelEntity = modelEntity
                print("Debug: sucessfully load model entity for model name \(self.modelName)")
            })
    }
}
