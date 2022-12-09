//
//  ScanOption.swift
//  VeganVision
//
//  Created by Ben Gabay on 12/8/22.
//

import SwiftUI

struct ScanOptionView: View {

    let viewModel: ScanOptionViewModel
    
    var body: some View {
        VStack {
            VStack {
                title
                subtitle
            }
            .padding(.vertical, 22)
            Spacer()
            HStack {
                importButton
                    .padding(.horizontal, 20)
                scanButton
                    .padding(.horizontal, 20)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .accentColor(Color.white)
        .background(Color(green500))
    }
    
    var title: some View {
        Text("Upload an Image")
            .font(AppFont.semiBoldFont(size: 26).font)
    }
    
    var subtitle: some View {
        Text("Utilize an image to be scanned against a database of non-vegan items.")
            .font(AppFont.mediumFont(size: 12).font)
    }
    
    var importButton: some View {
        Button {
            viewModel.importAction.send()
        } label: {
            VStack {
                Text("Import")
                    .font(AppFont.mediumFont(size: 22).font)
                    .foregroundColor(.black)
                Image("photoAlbum")
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding()
    }
    
    var scanButton: some View {
        Button {
            viewModel.scanAction.send()
        } label: {
            VStack {
                Text("Scan")
                    .font(AppFont.mediumFont(size: 22).font)
                    .foregroundColor(.black)
                Image("camera")
            }
        }
        .padding()
    }
}

struct ScanOption_Previews: PreviewProvider {
    static var previews: some View {
        ScanOptionView(viewModel: ScanOptionViewModel())
    }
}
