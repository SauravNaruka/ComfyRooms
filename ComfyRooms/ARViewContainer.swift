//
//  ARViewContainer.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/18/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: Model?
    
    func makeUIView(context: Context) -> ARView {
        FocusARView(frame: .zero)
//        let arView = ARView(frame: .zero)
        
//        let config = ARWorldTrackingConfiguration()
//        config.planeDetection = [.horizontal]
//        config.environmentTexturing = .automatic
        
//        if #available(iOS 13.4, *) {
//            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
//                config.sceneReconstruction = .mesh
//            }
//        } else {
//            print("Debug: sceneReconstruction not aviable")
//        }
        
//        arView.session.run(config)
        
//        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let model = self.modelConfirmedForPlacement {
            
            
            if let modelEntity = model.modelEntity {
                print("Debug: Adding model to scene \(model.modelName)")
                
                let anchorEntity = AnchorEntity(plane: .horizontal)
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                uiView.scene.addAnchor(anchorEntity)
                
            } else {
                print("Debug: Unable to load model entity for \(model.modelName)")
            }
            
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
            
        }
    }
    
}

