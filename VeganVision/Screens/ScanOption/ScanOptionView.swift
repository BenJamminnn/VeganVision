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
                HStack {
                    Text("")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    title
                        .frame(minWidth: 200, maxHeight: 20, alignment: .center)
                    appInfoButton
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                    .padding(.vertical, 22)
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
        .accentColor(.black)
        .background(Color(green500))
    }
    
    var title: some View {
        Text("Upload an Image")
            .font(AppFont.semiBoldFont(size: 22).font)
            .foregroundColor(.black)
    }
    
    var subtitle: some View {
        Text("Utilize an image to be scanned against a database of non-vegan items.")
            .font(AppFont.mediumFont(size: 12).font)
            .foregroundColor(.black)
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

    var appInfoButton: some View {
        Button {
            viewModel.appInfoAction.send()
        } label: {
            Image("info.square")
        }
        .padding(.horizontal, 16)
    }
}

struct ScanOption_Previews: PreviewProvider {
    static var previews: some View {
        ScanOptionView(viewModel: ScanOptionViewModel())
    }
}
