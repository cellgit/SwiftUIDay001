/**
 
 查看布局

 将内容与堆栈进行组织和对齐

 使用堆栈创建适应数据和环境变化的动态对齐。

 当您有来自包括文本和图像在内的可变数据源的信息进行通信时，以能够适应的方式对齐内容很重要。本教程介绍如何使用堆栈对齐行和列中的内容。它还使用堆栈来创建有助于组织信息的图形元素。
 
 */

import SwiftUI

struct EventTile: View {
    
    let event: Event
    let stripeHeight = 15.0
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: event.symbol)
                .font(.title)
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.title)
                Text(event.date,
                     format: Date.FormatStyle()
                         .day(.defaultDigits)
                         .month(.wide))
                    .font(.largeTitle)
                Text(event.location)
            }
        }
        .padding()
        .padding(.top, stripeHeight)
        .background {
            ZStack(alignment: .top) {
                Rectangle().opacity(0.3)
                Rectangle()
                    .frame(maxHeight: stripeHeight)
            }
            .foregroundColor(.teal)
        }
        .clipShape(RoundedRectangle(cornerRadius: stripeHeight, style: .continuous))
        
    }
}

#Preview {
    EventTile(event: Event(title: "Buy Daisies", date: .now, location: "Flower Shop", symbol: "gift"))
}
