//
//  gradients.swift
//  NoteIt
//
//  Created by sarthak on 11/06/23.
//

import SwiftUI

struct gradients: View {
    var body: some View {
       RoundedRectangle(cornerRadius:25)
            .fill(
//                LinearGradient(
//                    gradient:Gradient(colors:[Color.red,Color.white]),
//                    startPoint: .topLeading,
//                    endPoint: .trailing)
//                RadialGradient(
//                    gradient:Gradient(colors:[Color.red,Color.white]),
//                    center: .topLeading,
//                    startRadius:5,
//                    endRadius:400)
//                AngularGradient(gradient:Gradient(colors:[Color.red,Color.white]) , center: .center ,
//                                angle:.degrees(45))
            )
            .frame(width:300,height:200)
            
    }
    
}

struct gradients_Previews: PreviewProvider {
    static var previews: some View {
        gradients()
    }
}
