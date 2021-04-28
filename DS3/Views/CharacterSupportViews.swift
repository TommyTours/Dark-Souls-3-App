//
//  CharacterSupportViews.swift
//  DS3
//
//  Created by Tom Clifford on 18/04/2021.
//

import SwiftUI

struct AttributesView: View {
    @Binding var vgr: Int
    @Binding var att: Int
    @Binding var end: Int
    @Binding var vit: Int
    @Binding var str: Int
    @Binding var dex: Int
    @Binding var intel: Int
    @Binding var fth: Int
    @Binding var luck: Int
    @Binding var level: Int
    let baseAttributes: Dictionary<String, Int>
    
    var body: some View {
            HStack
            {
                Text("Level")
                Spacer()
                Text("\(level)")
            }
            StepperView(value: $vgr, level: $level, label: "Vigor", min: baseAttributes["Vgr"]!)
            StepperView(value: $att, level: $level, label: "Attunement", min: baseAttributes["Att"]!)
            StepperView(value: $end, level: $level, label: "Endurance", min: baseAttributes["End"]!)
            StepperView(value: $vit, level: $level, label: "Vitality", min: baseAttributes["Vit"]!)
            StepperView(value: $str, level: $level, label: "Strength", min: baseAttributes["Str"]!)
            StepperView(value: $dex, level: $level, label: "Dexterity", min: baseAttributes["Dex"]!)
            StepperView(value: $intel, level: $level, label: "Intelligence", min: baseAttributes["Int"]!)
            StepperView(value: $fth, level: $level, label: "Faith", min: baseAttributes["Fth"]!)
            StepperView(value: $luck, level: $level, label: "Luck", min: baseAttributes["Luck"]!)
    }
}

//struct CharacterSupportViews_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
