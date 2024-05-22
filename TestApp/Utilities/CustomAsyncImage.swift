//
//  CustomAsyncImage.swift
//  TestApp
//
//  Created by Apple on 5/22/24.
//

import SwiftUI

struct CustomAsyncImage: View {
    
    let url: URL?
    let placeholder: Image
    let errorImage: Image
    let showSpinner: Bool
    
    var body: some View {
        
        ZStack {
            
            if showSpinner {
                ProgressView()
            }
            
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholder
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    errorImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
    
}

//#Preview {
//    CustomAsyncImage()
//}
