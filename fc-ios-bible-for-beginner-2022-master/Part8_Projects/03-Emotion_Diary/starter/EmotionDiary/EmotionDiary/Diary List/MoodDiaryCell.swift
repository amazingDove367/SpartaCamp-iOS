//
//  MoodDiaryCell.swift
//  EmotionDiary
//
//  Created by Hakyung Sohn on 12/26/24.
//

import SwiftUI

struct MoodDiaryCell: View {
    
    var diary: MoodDiary
    
    var body: some View {
        Image(systemName: diary.mood.imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(radius: 10)
    }
}

#Preview {
    MoodDiaryCell(diary: MoodDiary.list.first!)
}
