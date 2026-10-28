//
//  ContentView.swift
//  CombineDemo
//
//  Created by Rakesh bajeli on 23/10/26.
//

import SwiftUI

struct ContentView: View {
    @State var vm :ToDoListViewModel = ToDoListViewModel(useCase: ToDoUseCaseImpl())
    

    var body: some View {
        switch vm.state {
            case .loading:
                    ProgressView()
        case .loaded(let data):
            List(data) { item in
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.isCompleted ? "Done" : "Not Done")          // use your real property
                                        .font(.subheadline)
                                }
                            }
            

            case .ideal:
            Button {
                vm.handleAction(action: .load)
            } label: {
                Text("Load Data")
            }

            case  .empty:
                    Text("No Data")
            case  .eror(let error):
                    Text("\(error.localizedDescription)")
            default:
                Text("No Data")

            }
    }
}
