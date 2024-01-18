@Entry
@Component
struct TabCustomPage {
  @State currentIndex:number = 0
  private tabsController: TabsController = new TabsController()
  //自定义组件
  @Builder
  TabBuilder(title:string,targetIndex:number){
    Text(title)
      .fontSize(20)
      .fontColor(this.currentIndex == targetIndex?'red':'#6B6B6B')
      .onClick(()=>{
        this.currentIndex = targetIndex
        this.tabsController.changeIndex(this.currentIndex)
      })
  }
  build() {
    Column() {
      Tabs({
        // barPosition:BarPosition.Start  //默认
        barPosition: BarPosition.End, //底部导航
        controller:this.tabsController
      }) {
        TabContent() {
          Column() {
            Text("首页").fontSize(30)
            List() {
              ListItem() {
                Text("首页1").fontSize(30)
              }

              ListItem() {
                Text("首页1").fontSize(30)
              }

              ListItem() {
                Text("首页1").fontSize(30)
              }

              ListItem() {
                Text("首页1").fontSize(30)
              }

              ListItem() {
                Text("首页1").fontSize(30)
              }
            }
          }
          .height('100%')

        }.tabBar(this.TabBuilder("首页",0))

        TabContent() {
          Text("分类").fontSize(30)
        }.tabBar(this.TabBuilder("分类",1))

        TabContent() {
          Text("购物车").fontSize(30)
        }.tabBar(this.TabBuilder("购物车",2))

        TabContent() {
          Text("用户").fontSize(30)
        }.tabBar(this.TabBuilder("用户",3))
      }
      .scrollable(false) //禁止滑动切换
    }
    .width('100%')
    .height('100%')
  }
}