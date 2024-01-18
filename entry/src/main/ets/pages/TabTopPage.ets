
@Entry
@Component
struct TabTopPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Tabs({
        barPosition:BarPosition.Start  //默认
        // barPosition:BarPosition.End  //底部导航
      }){
        TabContent(){
          Column(){
            Text("首页").fontSize(30)
            List(){
              ListItem(){
                Text("首页1").fontSize(30)
              }
              ListItem(){
                Text("首页1").fontSize(30)
              }
              ListItem(){
                Text("首页1").fontSize(30)
              }
              ListItem(){
                Text("首页1").fontSize(30)
              }
              ListItem(){
                Text("首页1").fontSize(30)
              }
            }
          }
          .height('100%')

        }.tabBar("首页")
        TabContent(){
          Text("分类").fontSize(30)
        }.tabBar("分类")
        TabContent(){
          Text("购物车").fontSize(30)
        }.tabBar("购物车")
        TabContent(){
          Text("用户").fontSize(30)
        }.tabBar("用户")
      }
    }
    .width('100%')
    .height('100%')
  }
}