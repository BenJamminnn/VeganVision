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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView(viewModel: AnalysisViewModel(offendingWords: []))
    }
}
