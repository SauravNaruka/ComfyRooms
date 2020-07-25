//
//  PlacementButtonsView.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/17/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI

struct PlacementButtonsView: View {
    @Binding var isPlacementEnabled: ProductAddState
    var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
    var body: some View {
        HStack{
            Button(action: {
                self.resetPlacementParameters()
                print("Debug: Remove element")
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            Button(action: {
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameters()
                print("Debug: Add element")
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
    
    func resetPlacementParameters(){
        self.isPlacementEnabled = ProductAddState.display
//        self.selectedModel = nil
    }
}

//struct PlacementButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlacementButtonsView()
//    }
//}
