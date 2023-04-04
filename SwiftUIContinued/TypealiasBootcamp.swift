//
//  TypealiasBootcamp.swift
//  SwiftUIContinued
//
//  Created by Санжар Асанов on 21/4/23.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    
  //  @State var item: MovieModel = MovieModel(title: "Title", director: "Sanzhar", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Sanzhar", count: 10)
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct TypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}
