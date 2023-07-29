//
//  LoadingView.swift
//  FPT
//
//  Created by Kush Mirchandani on 8/4/23.
//

import SwiftUI

struct LoadinggView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.black
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(2.0) // Adjust the scale of the loading animation as needed
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    struct LoadingView_Previews: PreviewProvider {
        static var previews: some View {
            LoadingView()
        }
    }
}
