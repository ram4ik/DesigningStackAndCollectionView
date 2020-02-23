//
//  ContentView.swift
//  DesigningStackAndCollectionView
//
//  Created by Ramill Ibragimov on 23.02.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State private var selected = "gear"
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        self.selected = ""
                    }) {
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.black.opacity(0.2))
                    }.offset(y: -15)
                    
                    Spacer()
                    
                    Button(action: {
                        self.selected = "magnifyingglass"
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.black.opacity(0.2))
                    }.offset(y: -15)
                }
                HStack(spacing: 15) {
                    Button(action: {
                        self.selected = "square.split.1x2"
                    }) {
                        VStack {
                            Image(systemName: "square.split.1x2")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(self.selected == "square.split.1x2" ? Color.pink : Color.black.opacity(0.2))
                            
                            Circle()
                                .fill(self.selected == "square.split.1x2" ? Color.pink : Color.clear)
                                .frame(width: 5, height: 5)
                                .padding(.vertical, 4)
                        }
                    }
                    
                    Button(action: {
                        self.selected = "square.grid.2x2"
                    }) {
                        VStack {
                            Image(systemName: "square.grid.2x2")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(self.selected == "square.grid.2x2" ? Color.pink : Color.black.opacity(0.2))
                            
                            Circle()
                            .fill(self.selected == "square.grid.2x2" ? Color.pink : Color.clear)
                            .frame(width: 5, height: 5)
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .padding([.top, .horizontal])
            .background(Color.white)
            
            ScrollView(.vertical, showsIndicators: false) {
                if self.selected == "square.split.1x2" {
                    RowView()
                } else {
                    GridView()
                }
            }
        }
        .background(Color("Color"))
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .padding(.bottom, 10)
    }
}

struct RowView: View {
    var body: some View {
        VStack(spacing: 18) {
            ForEach(rowData) { i in
                VStack {
                    Image(i.pic)
                        .resizable()
                        .frame(height: 200)
                        .scaledToFit()
                    HStack {
                        Text(i.name)
                            .font(.title)
                        Spacer(minLength: 0)
                        Text(i.likes)
                        Button(action: {
                            
                        }) {
                            Image(systemName: "heart")
                        }
                    }.padding()
                }.background(Color.white)
                .cornerRadius(10)
            }
        }.padding()
    }
}

struct GridView: View {
    var body: some View {
        VStack(spacing: 18) {
            ForEach(gridData) { i in
                HStack(spacing: 15) {
                    ForEach(i.rows) { j in
                        VStack(spacing: 20) {
                            Image(j.pic)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                
                            HStack {
                                Text(j.name)
                                    .font(.title)
                                Spacer(minLength: 0)
                            }.padding(.horizontal)
                            HStack {
                                Spacer()
                                Text(j.likes)
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "heart")
                                }
                            }.padding([.horizontal, .bottom])
                        }.background(Color.white)
                        .cornerRadius(10)
                    }
                }
            }
        }.padding()
    }
}

struct DataType: Identifiable {
    var id: Int
    var rows: [row]
}

struct row: Identifiable {
    var id: Int
    var name: String
    var pic: String
    var likes: String
}

var gridData = [
    DataType(id: 0, rows: [row(id: 0, name: "Cake", pic: "r1", likes: "92"), row(id: 1, name: "Cupcakes", pic: "r2", likes: "43")]),
    DataType(id: 1, rows: [row(id: 0, name: "Eclair", pic: "r3", likes: "192"), row(id: 1, name: "Ice", pic: "r4", likes: "23")]),
    DataType(id: 2, rows: [row(id: 0, name: "Ice Cream", pic: "r5", likes: "12"), row(id: 1, name: "Pancakes", pic: "r6", likes: "3")])
]

var rowData = [
    row(id: 0, name: "Cake", pic: "r1", likes: "92"),
    row(id: 1, name: "Cupkaces", pic: "r2", likes: "43"),
    row(id: 2, name: "Eclair", pic: "r3", likes: "192"),
    row(id: 3, name: "Ice", pic: "r4", likes: "23"),
    row(id: 4, name: "Ice Cream", pic: "r5", likes: "12"),
    row(id: 5, name: "Pancakes", pic: "r6", likes: "3")
]
