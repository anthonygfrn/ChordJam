//
//  BadgeNotif.swift
//  ChordJam
//
//  Created by Christian Aldrich Darrien on 26/06/24.
//

import SwiftUI

struct BadgeNotif: View {
    
    @State private var imageText : String = ""
    @State private var badgeText : String = ""
    
    @StateObject private var manager = chordModel()
//    @Binding var unlockedLevel: Int

    
    
    var body: some View {
        ZStack(alignment: .leading){
//            Text("Adf")
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 275, height: 50)
                .foregroundStyle(Color(CGColor(srgbRed: 255/255.0, green: 193/255.0, blue: 7/255.0, alpha: 1)))
            
            HStack{
                Image(getImageText(level: UserDefaults.standard.integer(forKey: "LevelSekarang")))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 31, height: 31)
                
                VStack(alignment: .leading){
                    Text("Badge earned")
                        .fontWeight(.light)
                    Text(getBadgeText(level: UserDefaults.standard.integer(forKey: "LevelSekarang")))
                        .fontWeight(.bold)
                }
                .font(.callout)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color.white)
                
            }
            .padding()
            
        }
        .transition(.move(edge: .top))
        .animation(.easeInOut(duration:5))
        
    }
    
    func getBadgeText(level: Int) -> String{
        if level == 1 {
            return "Learning C Major"
        }
        else if level == 2 {
            return "Learning Am Major"
        }
        else if level == 3 {
            return "Learning G Major"
        }
        else if level == 4 {
            return "Learning Dm Major"
        }
        return "NULL"
    }
    
    func getImageText(level: Int) -> String{
        if level == 1 {
            return "BadgeC"
        }
        else if level == 2 {
            return "BadgeAm"
        }
        else if level == 3 {
            return "BadgeG"
        }
        else if level == 4 {
            return "BadgeDm"
        }
        return "NULL"
    }
    
}



#Preview {
    BadgeNotif()
}
