//
//  BackButton.swift
//  Softorium
//
//  Created by AlexKotov on 11.12.23.
//

import SwiftUI

public struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(height: 16, alignment: .center)
            }
        }
    }
}
#Preview {
    BackButton()
}
