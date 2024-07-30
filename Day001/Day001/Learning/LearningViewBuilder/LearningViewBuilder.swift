
/** ViewBuilder是什么
 ViewBuilder 是 SwiftUI 中的一个属性包装器，它用于构建和组合视图。它允许在闭包中声明和返回多个视图，这些视图会被自动组合成一个单一的视图结构。这对于构建复杂的、可复用的视图组件非常有用。
 
 
 */


import SwiftUI

struct CustomStack<Content>: View where Content : View  {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        
        content
        
    }
}


#Preview {
    CustomStack {
        Text("77777")
        Text("77777")
    }
}
