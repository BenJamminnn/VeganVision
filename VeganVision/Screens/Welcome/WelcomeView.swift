//
//  WelcomeView.swift
//  VeganVision
//
//  Created by Ben Gabay on 11/19/22.
//

import SwiftUI

struct WelcomeView: View {
    let viewModel: WelcomeViewModel
    
    var body: some View {
        VStack {
            title
            appIcon
            Text("Welcome")
                .font(AppFont.mediumFont)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.white)
        .background(Color(green500))
    }
    
    var title: some View {
        Text("Vegan Vision")
            .font(AppFont.mediumFont)
    }
    
    var appIcon: some View {
        Image("vegan")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(viewModel: WelcomeViewModel())
    }
}
