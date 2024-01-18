@Entry
@Component
struct TabSidePage {
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start }) {
        TabContent() {
          Column() {
            Text('首页').fontWeight(30)
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

        }.tabBar('首页')

        TabContent() {
          Text('分类').fontWeight(30)
        }.tabBar('分类')

        TabContent() {
          Text('购物车').fontWeight(30)
        }.tabBar('购物车')

        TabContent() {
          Text('用户').fontWeight(30)
        }.tabBar('用户')
      }
      .vertical(true)
      .barWidth(100)
      .barHeight(200)
    }
    .width('100%')
    .height('100%')
  }
}