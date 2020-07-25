//
//  ProductListView.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/18/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI

struct ProductsView: View {
    var products: [Model]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true){
            HStack{
                ForEach(self.products, id: \.modelName){ product in
                    NavigationLink(destination: ARWrapperView(selectedModel: product)){
                            Image(uiImage: product.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .padding(.leading)
                                .background(Color.white)
                                .cornerRadius(12)

                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Spacer()
            }
        }
    }
}

//struct ProductsView_Previews: PreviewProvider {
//    static let products: [Model] = []
//    
//    static var previews: some View {
//        ProductsView(isPlacementEnabled: .constant(false), selectedModel: .constant(nil), products: products)
//    }
//}
