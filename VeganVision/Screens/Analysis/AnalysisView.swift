//
//  AnalysisView.swift
//  VeganVision
//
//  Created by Ben Gabay on 11/19/22.
//

import SwiftUI

struct AnalysisView: View {
    
    let viewModel: AnalysisViewModel
    
    var body: some View {
        VStack {
            title
            mainBody()
            Spacer()
            scanAgainButton
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.white)
        .background(Color(green500))
    }
    
    @ViewBuilder
    func mainBody() -> some View {
        if viewModel.offendingWords.isEmpty {
            unpopulatedView
        } else {
            populatedView
        }
    }
    
    var populatedView: some View {
        ScrollView {
            ForEach(viewModel.offendingWords, id: \.self) { word in
                Text(word)
                    .font(AppFont.mediumFont(size: 20).font)
            }
        }
        .padding()
        .background(Color(green300))
        .clipShape(Capsule())
    }
    
    var unpopulatedView: some View {
        VStack {}
    }
    
    var title: some View {
        Text("Analysis")
            .font(AppFont.semiBoldFont(size: 26).font)
    }
    
    var scanAgainButton: some View {
        Button {
            viewModel.backAction.send()
        } label: {
            Text("Scan Again")
                .font(AppFont.mediumFont(size: 22).font)
                .foregroundColor(.black)
        }
        .frame(maxWidth: 300, maxHeight: 60)
        .background(Color(green300))
        .clipShape(Capsule())
    }


}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView(viewModel: AnalysisViewModel(offendingWords: ["Beef", "Lard", "eggs"]))
    }
}
