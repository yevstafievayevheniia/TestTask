//
//  ContentView.swift
//  TestTask
//
//  Created by Yevstafieva Yevheniia on 23.09.2022.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 10)
                        .background(LinearGradient(
                            colors: [.green.opacity(0.3), .blue.opacity(0.5)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(viewModel.people, id: \.self) { person in
                                NavigationLink {
                                    DetailsView(personId: person)
                                } label: {
                                    Label(person, systemImage: "folder")
                                        .padding()
                                }
                            }
                        }
                    }
                }
                .navigationTitle("People List")
                .font(.title2)
                .foregroundColor(.black)
                .background(.clear)
            }
        }
        .accentColor(.black)
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
            .previewDisplayName("iPhone 13 Pro")
        
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
#endif