//
//  frame.swift
//  NoteIt
//
//  Created by sarthak on 12/06/23.
//

import SwiftUI

struct frame: View {
    var body: some View {
        Text("Hello This is Frame")
            .bold()
            .foregroundColor(Color.white)
            .frame(maxWidth:.infinity,maxHeight: .infinity ,alignment:.top)
            .background( LinearGradient(
                                    gradient:Gradient(colors:[Color.red,Color.white]),
                                    startPoint: .topLeading,
                                    endPoint: .trailing))
    }
}

struct frame_Previews: PreviewProvider {
    static var previews: some View {
        frame()
    }
}
