//
//  ContentView.swift
//  valorantApiTest
//
//  Created by Gagandeep Dass Kaur on 13/3/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AgentsViewModel()
    
    var body: some View {
        NavigationView{
            List (viewModel.agents) { agent in
                HStack{
                    AsyncImage(url: URL(string: agent.displayIcon)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        Text(agent.displayName)
                            .font(.headline)
                        Text(agent.description)
                            .font(.subheadline)
                            .lineLimit(2)
                    }
                }
            }
            .navigationTitle("Agentes de Valorant")
            .onAppear{
                viewModel.fetchAgent()
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
