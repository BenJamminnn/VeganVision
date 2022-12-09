//
//  AppInfoView.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/9/22.
//

import SwiftUI

struct AppInfoView: View {
    
    let viewModel: AppInfoViewModel

    var body: some View {
        VStack {
            HStack {
                backButton
                title
            }
            description
            nonVeganItemsList
                .padding()
            buttons
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.white)
        .background(Color(green500))
    }
    
    var title: some View {
        Text("App Info")
            .font(AppFont.mediumFont(size: 28).font)
    }
    
    var description: some View {
        Text("Vegan Vision uses Apple's built in Optical Character Recognition software to spot non vegan ingredients. The list of non vegan items is from PETA. You may add or remove any entry as desired.")
            .font(AppFont.mediumFont(size: 14).font)
            .padding()
    }
    
    var nonVeganItemsList: some View {
        ScrollView {
            ForEach(nonVeganIngredients, id: \.self) { word in
                Text(word)
                    .font(AppFont.mediumFont(size: 18).font)
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(green300))
        .cornerRadius(20)
    }
    
    var backButton: some View {
        Button {
            viewModel.backAction.send()
        } label: {
            Image("arrow.backward")
        }
    }
    
    var buttons: some View {
        HStack {
            addButton
            resetButton
        }
    }
    
    var addButton: some View {
        Button {
            viewModel.addEntryAction.send("Hello")
        } label: {
            Text("Add Entry")
                .font(AppFont.mediumFont(size: 22).font)
                .foregroundColor(.white)
        }
        .frame(minWidth: 170, maxHeight: 60)
        .background(Color(green800))
        .clipShape(Capsule())
    }
    
    var resetButton: some View {
        Button {
            viewModel.resetEntriesAction.send()
        } label: {
            Text("Reset")
                .font(AppFont.mediumFont(size: 22).font)
                .foregroundColor(.white)
        }
        .frame(minWidth: 170, maxHeight: 60)
        .background(.gray)
        .clipShape(Capsule())
    }
    
    func delete(at offsets: IndexSet) {
        viewModel.deleteEntryAction.send("Hello")
    }
}

struct AppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoView(viewModel: AppInfoViewModel())
    }
}
