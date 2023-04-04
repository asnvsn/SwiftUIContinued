//
//  ArraysBootcamp.swift
//  SwiftUIContinued
//
//  Created by Санжар Асанов on 16/4/23.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationsViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
    
        // sort
        /*
//        filteredArray = dataArray.sorted { user1, user2 in
//            return user1.points > user2.points
//        }

//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
        */
        
        // filter
        /*
//        filteredArray = dataArray.filter({ user in
//            return user.isVerified
//        })
        
        filteredArray = dataArray.filter({ $0.isVerified })
        */
        
        // map
        /*
//        mappedArray = dataArray.map({ user -> String in
//            return user.name ?? "ERROR"
//        })
        
//        mappedArray = dataArray.map({ $0.name })
        
//        mappedArray = dataArray.compactMap({ user -> String? in
//            return user.name
//        })
        
//        mappedArray = dataArray.compactMap({ $0.name })
         */
                
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap( { $0.name })
    }
    
    
    func getUsers() {
        let user1 = UserModel(name: "Sanzhar", points: 5, isVerified: true)
        let user2 = UserModel(name: "Imran", points: 8, isVerified: false)
        let user3 = UserModel(name: nil, points: 1, isVerified: true)
        let user4 = UserModel(name: "Amal", points: 0, isVerified: false)
        let user5 = UserModel(name: "Aikut", points: 4, isVerified: true)
        let user6 = UserModel(name: "Asan", points: 6, isVerified: false)
        let user7 = UserModel(name: "Baysal", points: 5, isVerified: true)
        let user8 = UserModel(name: nil, points: 7, isVerified: true)
        let user9 = UserModel(name: "Insan", points: 3, isVerified: false)
        let user10 = UserModel(name: "Aslan", points: 5, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
    
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                        HStack {
//                            Text("Point:\(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(Color.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(15))
//                    .padding(.horizontal)
//                }
            }
        }
    }
    
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
