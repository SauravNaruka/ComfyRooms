//
//  ModelPickerView.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/17/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI

struct ModelPickerView: View {
    @Binding var isPlacementEnabled: ProductAddState
    @Binding var selectedModel: Model?
    @EnvironmentObject var products: Products
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 30) {
                ForEach(0..<self.products.models.count){index in
                    Button(action: {
                        self.isPlacementEnabled = .add
                        self.selectedModel = self.products.models[index]
                        print("Debug: selected \(self.products.models[index].modelName)")
                    }) {
                        Image(uiImage: self.products.models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.5))
    }
}


//struct ModelPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModelPickerView()
//    }
//}

