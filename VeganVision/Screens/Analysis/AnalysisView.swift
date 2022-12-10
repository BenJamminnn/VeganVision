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
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 22)
            mainBody()
            Spacer()
            scanAgainButton
                .padding(.vertical, 22)
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
                .padding()
        }
    }
    
    var populatedView: some View {
        VStack {
            Text("\(viewModel.offendingWords.count) non vegan ingredients found!")
                .font(AppFont.mediumFont(size: 18).font)
                .padding()

            ScrollView {
                ForEach(viewModel.offendingWords, id: \.self) { word in
                    Text(word)
                        .font(AppFont.mediumFont(size: 20).font)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(green300))
        .cornerRadius(20)
    }

    var unpopulatedView: some View {
        Text("No non vegan ingredients found!")
            .padding()
            .font(AppFont.semiBoldFont(size: 26).font)
            .background(Color(green300))
            .cornerRadius(20)
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
                .foregroundColor(.white)
        }
        .frame(maxWidth: 300, maxHeight: 60)
        .background(Color(green900))
        .clipShape(Capsule())
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView(viewModel: AnalysisViewModel(offendingWords: ["Beef", "Lard", "eggs"]))
    }
}
