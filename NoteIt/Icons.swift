//
//  Icons.swift
//  NoteIt
//
//  Created by sarthak on 12/06/23.
//

import SwiftUI

struct Icons: View {
    var body: some View {
        Image(systemName:"pencil.tip.crop.circle.badge.arrow.forward")
//            .font(.system(size: 200))
            .resizable()
            .aspectRatio( contentMode: .fill)
            .frame(width: 300,height: 300)
            .foregroundColor(.red)

    }
}

struct Icons_Previews: PreviewProvider {
    static var previews: some View {
        Icons()
    }
}
