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
    @ObservedObject var viewModel: HomeViewModel
    @State private var showDetail: Bool = false

    
    init(libraryViewModelTest: LibraryViewModelTest, viewModel:HomeViewModel) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        self.libraryViewModelTest = libraryViewModelTest
        self.viewModel = viewModel
    }

    
    
    var body: some View {
        
        NavigationView{
        ZStack {
            GradientBackgroundView()
                .opacity(0.8)
                VStack {
                    if viewModel.savedWords.isEmpty {
                        Text("No words saved yet")
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .font(Font.custom("Montserrat-Bold", size: 28))
                            .foregroundColor(Color("Indigo"))
                    }
                    List {
                        
                        ForEach(Array(viewModel.savedWords), id: \.self) { word in
                            WordDetail(word: word, libraryViewModelTest: libraryViewModelTest, viewModel: viewModel)
                                .listRowBackground(Color.white.opacity(0.4))
                        }

    
                            
                        .onDelete { indexSet in
                            self.testlistwords.remove(atOffsets: indexSet)

                        }
                        .onTapGesture {
                                    showDetail.toggle()
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
                    } .frame(width: UIScreen.main.bounds.width * 0.92)
                                        
                                        
                    )
                    .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
                }
                
            }
            
        }  .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct LibraryNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryNavigationView(libraryViewModelTest: LibraryViewModelTest(), viewModel:HomeViewModel())
    }
}
