//
//  ARWrapperView.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/20/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI

struct ARWrapperView: View {
    var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    @State private var isPlacementEnabled: Bool = true
    
    var body: some View {
        ZStack{
            ARViewContainer(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            
            VStack{
                Spacer()
                PlacementButtonsView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
                
            }
            .padding()
        }
    }
}

struct ARWrapperView_Previews: PreviewProvider {
    static var selectedModel = Model(modelName: "chair_swan")
    static var previews: some View {
        ARWrapperView(selectedModel: selectedModel)
    }
}
