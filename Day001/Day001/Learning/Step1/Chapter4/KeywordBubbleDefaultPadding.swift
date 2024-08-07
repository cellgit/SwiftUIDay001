/**
 
 第3节

 使用ScaledMetric调整尺寸

 尺寸的默认值，如此视图上的填充，或框架的宽度和高度，并不总是适用于您的布局。在许多情况下，您可以设计一小部分值，以在一系列环境中使用。但有一百多种动态类型设置和Font.TextStyle选项的组合，因此为每个选项选择特定值并不实用。当您需要提供适应环境有效字体大小的数值时，请使用ScaledMetric属性包装器。
 
 第1步

 查看AX 5文本大小的KeywordBubbleDefaultPadding预览。使用默认填充物，叶子符号的尖端与胶囊形状的边缘相幔。

 为了使气泡内的内容保持大文本大小，而不为小文本大小添加太多填充，请定义一个与文本大小缩放的自定义填充指标。
 
 第2步

 这个paddingWidth变量为DynamicTypeSize.large动态类型环境中的内容提供14.5的值。使用ScaledMetric属性包装器，根据dynamicTypeSize的当前值，该值按比例更大或更小。

 有关使用ScaledMetric按文本比例缩放尺寸的更多信息，请参阅将自定义字体应用于文本。
 
 第3步

 标签使用Font.TextStyle.title样式来定义文本大小。

 为textStyle参数指定Font.TextStyle.title表示该指标与标题样式缩放或相对于标题样式。
 
 第4步

 Padding(_:)修饰符在所有四个边缘的标签周围以点为单位添加特定空间。由于paddingWidth是ScaledMetric，当标签使用更大的文本大小时，padding(_:)会增加更多空间。
 
 第5步

 使用ScaledMetric变量填充，所有动态类型变体现在都有填充在叶子符号和背景中胶囊形状的边缘之间。
 */

import SwiftUI

struct KeywordBubbleDefaultPadding: View {
    let keyword: String
    let symbol: String
    
    @ScaledMetric(relativeTo: .title) var paddingWidth = 14.5
    var body: some View {
        Label(keyword, systemImage: symbol)
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(.purple.opacity(0.75), in: Capsule())
    }
}

#Preview {
    let keywords = ["chives", "fern-leaf lavender"]
    return VStack {
        ForEach(keywords, id: \.self) { word in
            KeywordBubbleDefaultPadding(keyword: word, symbol: "leaf")
        }
    }
}
