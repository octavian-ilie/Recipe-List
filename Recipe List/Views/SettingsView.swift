//
//  SettingsView.swift
//  Recipe List
//
//  Created by Octavian Mihuț Ilie on 15/03/2021.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var featuredFirst = false
    @State private var metricUnits = true
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
        
                VStack {
                    Toggle("Metric units", isOn: $metricUnits)
                    Toggle("Open with Featured", isOn: $featuredFirst)
                }
                .padding([.horizontal], 20)
                .padding(.top, 20)
                .toggleStyle(SwitchToggleStyle(tint: .red))
                
                Text("See Featured recipes first when launching the app.")
                    .padding([.horizontal],20)
                    .font(.system(size: 12, weight: .light, design: .default))
                
                Spacer()
                
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
