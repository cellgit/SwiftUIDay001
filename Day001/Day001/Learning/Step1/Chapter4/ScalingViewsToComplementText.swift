/**
 
 查看布局

 缩放视图以补充文本

 构建适应字体样式、动态类型和不同字符串长度的布局。

 在编写包含文本的视图时，重要的是要定义相对于该文本的其他元素，如符号或填充，以便视图适应文本的大小。

 符号和填充物可以随着文本内容的变化进行调整，以适应本地化、动态类型大小或显示不同的短语。
 
 
 第1节

 将内容与文本相关联

 此示例协调一个名称和一个符号，用标签表示单个项目。它还在背景（对齐：内容：）修饰符中定义了胶囊，以保持标签周围的一致边距。
 
 第1步

 为了使KeywordBubble可重复使用，标签的文本和符号名称是视图的属性。当另一个视图使用KeywordBubble时，另一个视图指定要显示的文本和符号。 查看 `KeywordBubbleDefaultPadding` 的代码
 
 
 第2步

 标签是一个内置视图，可以排列文本和符号，这是此视图的主要内容。标签调整符号的大小并对齐两部分内容，因此您不必手动将文本与图像对齐。

 systemImage参数检索要显示的系统图像。要查找可用系统映像的名称，请下载SF Symbols应用程序。
 
 第3步

 标签对文本和图像都应用相同的字体。显示SF符号的图像使用字体信息来确定其大小和位置。

 实验

 尝试其他一些Font.TextStyle值，如Font.TextStyle.largeTitle或Font.TextStyle.caption，看看单词和叶子符号的大小是如何变化的。
 
 
 
 
 */
import SwiftUI

struct ScalingViewsToComplementText: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ScalingViewsToComplementText()
}
