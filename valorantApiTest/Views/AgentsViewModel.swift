//
//  AgentsViewModel.swift
//  valorantApiTest
//
//  Created by Gagandeep Dass Kaur on 13/3/25.
//

import Foundation

class AgentsViewModel: ObservableObject {
    @Published var agents: [Agent] = []
    var apiURL = "https://valorant-api.com/v1/agents"
    
    func fetchAgent(){
        performRequest(with: apiURL)
    }
    
    func performRequest(with urlString: String){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error al obtener os datos de la api: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decodedResponse = try JSONDecoder().decode(AgentResponse.self, from: data)
                DispatchQueue.main.async {
                    self.agents = decodedResponse.data.filter{ $0.isPlayableCharacter}
                }
            } catch{
                print("Error al decodificar: \(error)")
            }
        }.resume()
    }

}

struct AgentResponse: Codable {
    let data: [Agent]
}
