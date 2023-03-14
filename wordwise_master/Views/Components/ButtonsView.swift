//
//  ButtonsView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI

struct ButtonsView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @ObservedObject var libraryViewModelTest: LibraryViewModelTest
    
    var body: some View {
            HStack {
                Spacer()
                Button {
                   viewModel.swipeLeft(viewModel.wordStruct)
                    } label: {
                        Image(systemName: "arrow.left")
                            .padding(.trailing, 50)
                        Text("Lose it")
                            .font(Font.custom("Hind-Regular", size: 20))
                    }
                    .buttonStyle(SquishButtonStyle(fadeOnPress: false))
                    .foregroundColor(.white)
                    Spacer()
                    Button {
                        print(viewModel.wordStruct)
                        withAnimation {
                            self.viewModel.showMessage = false
                            self.viewModel.wordPosition = .zero
                        }
                    }
                label: {
                    Image(systemName: "arrow.counterclockwise")
                        .resizable()
                        .frame(width: 32.0, height: 38)
                        .padding()
                }
                .buttonStyle(SquishButtonStyle(fadeOnPress: false))
                .foregroundColor(.white)
                    Spacer()
                    Button {
                        viewModel.swipeRight(viewModel.wordStruct)
                    } label: {
                        Image(systemName: "arrow.right")
                        Text("Learn it")
                            .font(Font.custom("Hind-Regular", size: 20))
                    }
                    .buttonStyle(SquishButtonStyle(fadeOnPress: false))
                    .foregroundColor(.white)
                    Spacer()
                }
                
            }
        }
    
    struct ButtonsView_Previews: PreviewProvider {
        static var previews: some View {
            ZStack {
                GradientBackgroundView()
                VStack {
                    
                    WordCardView(viewModel: HomeViewModel())
                    ButtonsView(viewModel: HomeViewModel(), libraryViewModelTest: LibraryViewModelTest())
                }
            }
        }
    }
