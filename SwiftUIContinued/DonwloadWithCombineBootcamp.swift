//
//  DonwloadWithCombineBootcamp.swift
//  SwiftUIContinued
//
//  Created by Санжар Асанов on 25/4/23.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
     getPosts()
    }
    
    func getPosts() {
       guard let url = URL(string: "https://jsonplaceholder.typicode.com") else { return }
        
        // Combine discussion:
        /*
        // 1. sign up for monthle subscription for package to be delivered
        // 2. the company would make the package behind the scene
        // 3. recieve the package at your front door
        // 4. make sure the box isn't damage
        // 5. open and make sure the item is correct
        // 6. use the item
        // 7. cancellable at any time
        
        // 1. create publisher
        // 2. subscribe publisher on background thread
        // 3. recieve on main thread
        // 4. tryMap (check that the data is good)
        // 5. decode (decode data into PostModels)
        // 6. sink (put the item into our app)
        // 7. store (cancel subscription if needed)
         */
        
        URLSession.shared.dataTaskPublisher(for: url)
          //  .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] returnedPost in
                self?.posts = returnedPost
            })
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct DonwloadWithCombineBootcamp: View {
    
    @StateObject var vm = DownloadWithescapingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct DonwloadWithCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DonwloadWithCombineBootcamp()
    }
}
