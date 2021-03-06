//
//  ContentView.swift
//  ListWithTextFieldSample
//
//  Created by Yusuke Hasegawa on 2021/07/09.
//

import SwiftUI

struct ContentView: View {
    
    @State var data: [SampleModel] = [
        SampleModel(text: "abc"),
        SampleModel(text: "def"),
        SampleModel(text: "")
    ]
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach.init(self.data.indices) { index in
                    SampleRow.init(model: self.$data[index]) {
                        debugPrint("onCommit")
                        debugPrint(self.data)
                    }
                }.onDelete(perform: { indexSet in
                    self.data.remove(atOffsets: indexSet)
                }).onMove(perform: { indices, newOffset in
                    self.data.move(fromOffsets: indices, toOffset: newOffset)
                })
            }.navigationBarTitle(Text("editable list"), displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
