//
//  SampleRow.swift
//  ListWithTextFieldSample
//
//  Created by Yusuke Hasegawa on 2021/07/09.
//

import SwiftUI

struct SampleRow: View {
    
    @Binding var model: SampleModel
    var onCommit: () -> Void
    
    var body: some View {
        
        TextField.init("tap to edit text", text: self.$model.text, onEditingChanged: { _ in
            //nop
        }, onCommit: {
            self.onCommit()
        })
    }
}

struct SampleRow_Previews: PreviewProvider {
    static var previews: some View {
        SampleRow(model: .constant(.init(text: "sample text")), onCommit: { })
    }
}
