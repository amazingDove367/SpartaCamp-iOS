//
//  FrameworkCell.swift
//  AppleFramework-SwiftUI
//
//  Created by Hakyung Sohn on 11/5/24.
//

import SwiftUI

struct FrameworkCell: View {
    
    var framework: AppleFramework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            Text(framework.name)
                .font(.system(size: 16, weight: .bold))
            
            Spacer()
        }
    }
}

#Preview {
    FrameworkCell(framework: AppleFramework.list[0])
}
