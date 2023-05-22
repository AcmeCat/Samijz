//
//  MenuView.swift
//  Samijz
//
//  Created by Rory Allen on 22/5/2023.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var menu: Menu
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, pinnedViews: .sectionHeaders) {
                    ForEach(menu.sections) { section in
                        Section {
                            ForEach(section.sandwiches) { sandwich in
                                VStack {
                                    Image(sandwich.image)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(10)
                                    Text(sandwich.name)
                                        .font(.system(.body,
                                                      design: .serif))
                                }
                                .padding(.bottom)
                            }
                        } header: {
                            Text(section.name)
                                .font(.system(.title,
                                              design: .serif))
                                .frame(maxWidth: .infinity,
                                       alignment: .leading)
                                .padding([.top, .bottom, .trailing], 5)
                                .background(.background)
                            
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Add Sandwich")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .environmentObject(Menu())
    }
}
