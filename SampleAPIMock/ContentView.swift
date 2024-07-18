//
//  ContentView.swift
//  SampleAPIMock
//
//  Created by Tatsuya Moriguchi on 7/17/24.
//

import SwiftUI

// Define a Protocol for the API Client:
// Create a protocol that defines the methods or properties your API client will use to interact with the API. This allows you to easily switch between a real API client and a mock client.
protocol APIClient {
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void)
}

// Implement a Mock API Client:
// Create a mock implementation of your API client protocol. This mock client will simulate the API responses based on predefined data or scenarios.
class MockAPIClient: APIClient {
    func fetchData(completion: @escaping (Result<Data, any Error>) -> Void) {
        // Simultate successful API reponse with mock data
        let jsonString = """
               {
                   "id": 1,
                   "name": "John Doe",
                   "email": "john.doe@example.com"
               }
               """
        guard let jsonData = jsonString.data(using: .utf8) else {
                   let error = NSError(domain: "MockAPIErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid mock data"])
                   completion(.failure(error))
                   return
               }
        completion(.success(jsonData))
        
        
//        let mockData = Data() // Replace with your mock data
//        completion(.success(mockData))
    }
}

// Use Dependency Injection:
// In your application code, use dependency injection to provide either the real API client or the mock client based on whether you're testing or running in a mock environment.
class ViewModel {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchData() {
        
        apiClient.fetchData { result in
            switch result {
            case .success(let data):
                // Handle the success case
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print("Mock data received: \(json)")
                }
            case .failure(let error):
                // Handle the error case
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}


struct ContentView: View {
    @State private var viewModel = ViewModel(apiClient: MockAPIClient())
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello")
        }
        .padding()
        .onAppear() {
            viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
