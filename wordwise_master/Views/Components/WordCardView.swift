//
//  WordCardView.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/10/23.
//

import SwiftUI


struct WordCardView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var test: CGSize = .zero
    
    
    var body: some View {
        
        if viewModel.showMessage {
            VStack {
                Text("Come back later to see tomorrow's word!")
                    .font(Font.custom("Montserrat-Bold", size: 30))
                    .foregroundColor(.indigo)
                    .multilineTextAlignment(.center)
            }
        } else {
            
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(.white)
                    .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.45)
                    .shadow(color: .gray, radius: 2.5, x: 0, y: 5)
                VStack {
                    Text("\(viewModel.word)")
                        .font(Font.custom("Montserrat-Bold", size: 40))
                        .foregroundColor(Color("Indigo"))
                    
                    Text("\(String(describing:viewModel.wordPartofSpeech))")
                        .font(Font.custom("Hind-Regular", size: 15))
                        .foregroundColor(Color("Indigo"))
                    
                    Text("\(String(describing: viewModel.wordDescription))")
                        .font(Font.custom("Hind-Regular", size: 20))
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Indigo"))
                        .padding([.top, .bottom])
                    
                    
                    Text("“\(String(describing:viewModel.wordExample))”")
                        .font(Font.custom("Hind-Regular", size: 12))
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("Indigo"))
                        .padding(.bottom)
                    
                    
                }
                
                .frame(width: UIScreen.main.bounds.width * 0.80, height: UIScreen.main.bounds.height * 0.40)
            }
            .offset(viewModel.wordPosition)

            .gesture(
                DragGesture()
                    .onChanged { drag in
                        if drag.translation.width < -80 {
                            viewModel.swipeLeft(viewModel.wordStruct)
                        }
                        else if drag.translation.width > 80 {
                            viewModel.swipeRight(viewModel.wordStruct)
                        }
                    }
            )
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                print("WordOfTheDayView: willEnterForegroundNotification")
                viewModel.fetchData()
                
            }
            
            .onAppear {
                print("WordOfTheDayView: onAppear")
                viewModel.fetchData()
            }
        }
    }
    
}

struct WordCardView_Previews: PreviewProvider {

    static var previews: some View {
        ZStack {
            GradientBackgroundView()
            WordCardView(viewModel: HomeViewModel())

        }
    }
}
