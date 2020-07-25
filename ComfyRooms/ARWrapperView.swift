//
//  ARWrapperView.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/20/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI

struct ARWrapperView: View {
    @State var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    @State private var isPlacementEnabled: ProductAddState = .add
    
    var body: some View {
        ZStack{
            ARViewContainer(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
            
            VStack{
                Spacer()
                if isPlacementEnabled == ProductAddState.add {
                    
                    PlacementButtonsView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
                    
                } else if isPlacementEnabled == ProductAddState.selection {
                    
                    ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel)
                    
                } else {
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            self.isPlacementEnabled = ProductAddState.selection
                        }){
                            Image(systemName: "plus")
                                .frame(width: 60, height: 60)
                                .font(.title)
                                .background(Color.white.opacity(0.75))
                                .cornerRadius(30)
                                .padding(20)
                        }
                        .padding()
                    }
                }
                
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
