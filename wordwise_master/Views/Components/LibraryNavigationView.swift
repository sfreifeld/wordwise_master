//
//  LibraryNavigationView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI

struct LibraryNavigationView: View {
    @State private var isEditing = false
    @State private var testlistwords: [String] = ["gargantuan","kerfluffle", "katzenjammer"]
    @ObservedObject var libraryViewModelTest: LibraryViewModelTest
    
    var body: some View {
        
    NavigationView {
            VStack {
                List {
                    ForEach(libraryViewModelTest.savedWords.sorted(), id: \.self) { word in
                        Text(word)
                            .font(Font.custom("Hind-Regular", size: 18))
                            .foregroundColor(Color("Indigo"))
                            .listRowBackground(Color.white.opacity(0.5))
                    }
                    .onDelete { indexSet in
                        self.testlistwords.remove(atOffsets: indexSet)
                    }
                }
                
                .background(GradientBackgroundView().opacity(0.8))
                .scrollContentBackground(.hidden)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                    HStack {
                        Text("My Library")
                            .font(Font.custom("Montserrat-Bold", size: 28))
                            .foregroundColor(Color("Indigo"))
                        Spacer()
                        NavigationLink(destination:
                        HomeView().navigationBarBackButtonHidden(true),
                        label: {
                            Image(systemName: "house")
                                .font(.system(size: 25, weight: .bold))
                                .foregroundColor(Color("Indigo"))
                                .navigationBarBackButtonHidden(true)
                        })
                        Button(action: {
                            self.isEditing.toggle()
                        }) {
                            if self.isEditing {
                                Text("Done")
                                    .foregroundColor(Color("Indigo"))
                                    .font(Font.custom("Montserrat-Bold", size: 18))
                            } else {
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundColor(Color("Indigo"))

                            }
                        }.padding()
                } .frame(width: 400)

                                    
                )
                .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))

            }
        }
    }
}

struct LibraryNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryNavigationView(libraryViewModelTest: LibraryViewModelTest())
    }
}
