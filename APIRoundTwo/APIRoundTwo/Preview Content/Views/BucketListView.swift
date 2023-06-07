//
//  BucketListView.swift
//  APIRoundTwo
//
//  Created by Lama AL Yousef on 31/05/2023.
//

import SwiftUI

struct BucketListView: View {
    @ObservedObject var bucketListViewModel = BucketListViewModel()

    var body: some View {
        VStack {
            if let bucketListItem = bucketListViewModel.bucketListItem {
                Text(bucketListItem.item)
                    .font(.largeTitle)
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            bucketListViewModel.fetchBucketListItem()
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
    }
}








