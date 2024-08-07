/**
 
 查看布局

 选择隐藏视图的正确方法

 控制视图是否存在，以及它如何影响整体布局。

 如果您的设计有并不总是相关的视图，您可以选择它们的缺失如何影响整体布局。您可以像视图不存在一样布局所有其他内容，然后在视图可见时更新其他内容的位置。或者，您可以为视图保留空间，无论它是否可见，这样当它变得可见时，其他内容都不需要移动来容纳它。
 
 */

import SwiftUI

struct TrainCars: View {
    
    @State private var longerTrain = true
    
    var body: some View {
        
        Spacer()
        
        VStack(alignment: .leading) {
            Toggle("Long Train", isOn: $longerTrain)
            
            Text("Conditional:")
            HStack {
                Image(systemName: "train.side.rear.car")
                if longerTrain {
                    Image(systemName: "train.side.middle.car")
                }
                Image(systemName: "train.side.front.car")
            }
            
            Divider()
            Text("Opticty:")
            
            HStack {
                Image(systemName: "train.side.rear.car")
                Image(systemName: "train.side.middle.car")
                    .opacity(longerTrain ? 1 : 0)
                Image(systemName: "train.side.front.car")
            }
            
            Divider()
            
        }
        .padding()
        
        
        
        Spacer()
        
        
    }
}

#Preview {
    TrainCars()
}
