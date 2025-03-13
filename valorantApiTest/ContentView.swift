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
                NavigationLink(destination: AgentDetailView(agent: agent)) {
                    HStack{
                        AsyncImage(url: URL(string: agent.displayIcon)) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                        } placeholder: {
                            //es un indicador de carga
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading) {
                            Text(agent.displayName)
                                .font(.headline)
                            Text(agent.description)
                                .font(.subheadline)
                                .lineLimit(2)
                            
                            if let role = agent.role {
                                Text("Rol: \(role.displayName)")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Agentes de Valorant")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                viewModel.fetchAgent()
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
