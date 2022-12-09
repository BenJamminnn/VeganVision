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
            Spacer()
            welcomeButton
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.white)
        .background(Color(green500))
    }
    
    var title: some View {
        Text("Vegan Vision")
            .font(AppFont.mediumFont(size: 32).font)
    }
    
    var appIcon: some View {
        Image("vegan")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
    }
    
    var welcomeButton: some View {
        Button {
            viewModel.getStartedPressed.send()
        } label: {
            Text("Get Started")
                .font(AppFont.mediumFont(size: 22).font)
                .foregroundColor(.black)
        }
        .frame(maxWidth: 300, maxHeight: 60)
        .background(Color(green300))
        .clipShape(Capsule())
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(viewModel: WelcomeViewModel())
    }
}
