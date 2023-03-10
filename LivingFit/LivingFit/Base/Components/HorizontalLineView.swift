//
//  HorizontalLineView.swift
//  LivingFit
//
//  Created by ALEXANDER CLEONI on 3/10/23.
//

import SwiftUI

struct HorizontalLineView: View {
    var body: some View {
        Rectangle()
            .fill(Color(red: 0.8470588235294118, green: 0.8549019607843137, blue: 0.8627450980392157))
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 0.5, maxHeight: 0.5, alignment: .center)
    }
}

struct HorizontalLineView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalLineView()
            .preview(with: "Horizontal Line View")
    }
}
