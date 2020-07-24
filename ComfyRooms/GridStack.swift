//
//  GridStack.swift
//  ComfyRooms
//
//  Created by Naruka,Saurav on 7/19/20.
//  Copyright © 2020 Saurav. All rights reserved.
//

import SwiftUI

struct GridStack<T, Content: View>: View {
    let items: Array<T>
    let columns: Int
    let content: (T, Int, Int) -> Content
    
    var rows: Int {
        let numberOfRows: Float = Float(self.items.count) / Float(self.columns)
        return Int(numberOfRows.rounded(.up))
    }
    
    var body: some View {
        VStack{
            ForEach(0..<self.rows, id: \.self){row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.createView(row: row, column: column)
                    }
                }
            }
        }
    }
    
    func createView(row: Int, column: Int) ->some View {
        let rowIndex = row * self.columns
        
        if rowIndex + column < items.count {
            return AnyView(self.content(self.items[rowIndex+column], row, column))
        } else {
            return AnyView(Spacer())
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(items: [1, 2, 3, 4, 5, 6, 7], columns: 2) {item, row, column in
            Text("\(item)")
        }
    }
}
