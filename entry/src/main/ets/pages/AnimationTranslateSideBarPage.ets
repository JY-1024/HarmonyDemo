@Entry
@Component
struct AnimationTranslateSideBarPage {
  @State flag: boolean = true
  @State xPosition: number = -122

  build() {
    Stack({
      alignContent: Alignment.Start
    }) {
      Column() {
        Text("this is Body").fontSize(60)
        Button() {
          Text("打开侧边栏").fontSize(20).fontColor(Color.White)
        }.width(200)
        .height(60)
        .margin({
          bottom: 10,
          right: 10
        }).onClick(() => {
          if (this.flag) {
            this.xPosition = 0
          } else {
            this.xPosition = -122
          }
          this.flag = !this.flag
        })

      }.width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)

      Column() {
        Text("SideBar").fontSize(20)
      }
      .width(120)
      .height('100%')
      .backgroundColor(Color.Yellow)
      .translate({
        x: this.xPosition
      })
      .animation({
        duration: 1000
      })
    }
  }
}