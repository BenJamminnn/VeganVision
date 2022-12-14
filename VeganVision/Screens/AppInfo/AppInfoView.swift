//
//  AppInfoView.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/9/22.
//

import SwiftUI

struct AppInfoView: View {
    
    @ObservedObject var viewModel: AppInfoViewModel
    @State private var presentAlert = false
    @State private var toAdd: String = ""
    @State private var toDelete: String = ""

    var body: some View {
        VStack {
            HStack {
                backButton
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                title
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.vertical, 22)
            description
            if viewModel.error != nil {
                error
            }
            nonVeganItemsList
                .padding()
            buttons
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.black)
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
            ForEach(viewModel.currentNonVeganList, id: \.self) { word in
                Text(word)
                    .font(AppFont.mediumFont(size: 18).font)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.black)
                    .padding(.vertical, 3)
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
        .padding(.vertical, 12)
    }
    
    var error: some View {
        Text(viewModel.error?.description ?? "")
            .padding()
            .cornerRadius(18)
            .font(AppFont.mediumFont(size: 18).font)
            .background(Color(red300))
            .clipShape(Capsule())
    }
    
    var addButton: some View {
        Button {
            presentAlert = !presentAlert
        } label: {
            Text("Add Entry")
                .font(AppFont.mediumFont(size: 22).font)
                .foregroundColor(.white)
        }
        .frame(minWidth: 170, maxHeight: 60)
        .background(Color(green800))
        .clipShape(Capsule())
        .alert("New Entry", isPresented: $presentAlert, actions: {
            // Any view other than Button would be ignored
            TextField("Entry", text: $toAdd)
            Button("Cancel", role: .cancel, action: {
                presentAlert = !presentAlert
            })
            Button("Add", action: {
                viewModel.addEntryAction.send(toAdd)
            })
        }, message: {
            Text("Enter a new entry to be considered when scanning images")
        })
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
