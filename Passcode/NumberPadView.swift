//
//  NumberPadView.swift
//  Passcode
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/20.
//

import SwiftUI

struct NumberPadView: View {
    
    @Binding var passcode:String
    
   private let columns: [GridItem] = [
        .init(),
        .init(),
        .init()
    ]
    
    
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(1...9, id: \.self){index in
                Button(action: {
                    addValue(index)
                }, label: {
                    Text(String(index))
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 16)
                        .contentShape(.rect)
                })
            }
            
            Button(action: {
                removeValue()
            }, label: {
                Image(systemName: "delete.backward")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 16)
                    .contentShape(.rect)
            })
            
            Button(action: {
                addValue(0)
            }, label: {
                Text("0")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(.vertical, 16)
                    .contentShape(.rect)
            })
        }.foregroundStyle(.primary)
    }
    
    private func addValue(_ Value: Int) {
        if passcode.count < 4 {
            passcode += String(Value)
        }
    }
    
    private func removeValue(){
        if !passcode.isEmpty{
            passcode.removeLast()
        }
    }
}

#Preview {
    NumberPadView(passcode: Binding.constant(""))
}
