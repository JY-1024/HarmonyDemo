@Entry
@Component
struct AnimationExplicitPage {
  @State boxWidth: number = 100
  @State boxHeight: number = 100
  @State flag: boolean = true

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        Row() {

        }
        .width(this.boxWidth)
        .height(this.boxHeight)
        .backgroundColor(Color.Red)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)

      Button() {
        Text('动画').fontSize(20).fontColor(Color.White)
      }
      .width(60)
      .height(60)
      .margin({
        right: 10,
        bottom: 10
      })
      .onClick(() => {
        animateTo({
          duration: 1000 //动画时间
        },()=>{
          if (this.flag) {
            this.boxWidth = 240
            this.boxHeight = 240
          } else {
            this.boxWidth = 100
            this.boxHeight = 100
          }
          this.flag = !this.flag
        })
      })

    }

  }
}