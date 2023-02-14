//
//  KeyBoard.swift
//  customKeyboard
//
//  Created by MCNMACBOOK01 on 14/02/23.
//

import SwiftUI

protocol CustomKeyboardDelegate: AnyObject {
    func customKeyboardDidTapButton(_ string: String)
}


struct KeyBoard: View {
    var body: some View {
        NumPad()
    }
}

struct KeyBoard_Previews: PreviewProvider {
    static var previews: some View {
        KeyBoard()
    }
}

struct NumPad : View{
    
    weak var delegate: CustomKeyboardDelegate?
    
    var body: some View{
        
        VStack(alignment: .trailing , spacing : 20){
            ForEach(datas){i in
                HStack(spacing : UIScreen.main.bounds.width/3){
                    ForEach(i.row){j in
                        Button(action: {
                            let str = j.value

                            if j.value == "delete.left"{
                                self.delegate?.customKeyboardDidTapButton(str)
                            }else{
                                self.delegate?.customKeyboardDidTapButton(str)
                            }
                            
                        }){
                            if j.value == "delete.left"{
                                Image(systemName: j.value).fontWeight(.semibold).padding(.vertical)
                            }else{
                                Text(j.value).fontWeight(.semibold).padding(.vertical)
                            }
                        }
                       
                        
                    }
                }
            }
        }
        
    }
}

struct type : Identifiable{
    var id : Int
    var row : [row]
}
struct row : Identifiable{
    var id : Int
    var value : String
}
var datas = [
    type(id: 0, row: [row(id: 0, value: "1"), row(id: 1, value: "2"), row(id: 2, value: "3")]),
    type(id: 1, row: [row(id: 0, value: "4"), row(id: 1, value: "5"), row(id: 2, value: "6")]),
    type(id: 2, row: [row(id: 0, value: "7"), row(id: 1, value: "8"), row(id: 2, value: "9")]),
    type(id: 3, row: [row(id: 0, value: "0"), row(id: 1, value: "delete.left")]),
]
