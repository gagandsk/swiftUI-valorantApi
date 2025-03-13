//
//  AgentDetailView.swift
//  valorantApiTest
//
//  Created by Gagandeep Dass Kaur on 13/3/25.
//

import SwiftUI

struct AgentDetailView: View {
    let agent: Agent

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: agent.displayIcon)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            } placeholder: {
                ProgressView()
            }
            .padding()

            Text(agent.displayName)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(agent.description)
                .font(.body)
                .padding()

            if let role = agent.role {
                HStack {
                    AsyncImage(url: URL(string: role.displayIcon)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(role.displayName)
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                .padding()
            }

            Spacer()
        }
        .padding()
        .navigationTitle(agent.displayName)
    }
}
