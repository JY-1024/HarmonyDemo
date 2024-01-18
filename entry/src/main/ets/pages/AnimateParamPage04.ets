
@Entry
@Component
struct AnimateParamPage04 {
  @State boxWidth: number = 100
  @State boxHeight: number = 100
  @State flag: boolean = true
  @State boxColor: Color = Color.Red

  build() {
    Stack({ alignContent: Alignment.BottomEnd }) {
      Column() {
        Row() {

        }
        .width(this.boxWidth)
        .height(this.boxHeight)
        .backgroundColor(this.boxColor)
        //显示动画
        .animation({
          duration:2000, //动画执行的时间
          curve:Curve.EaseIn, //动画曲线
          delay:1000, //延时1秒后执行动画
          iterations: 3, //执行次数 -1表示一直执行 默认是1
          playMode:PlayMode.Alternate //执行动画的模式，执行完成后不回到起点，也就是从终点再次开始执行
        })
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
        if (this.flag) {
          this.boxWidth = 240
          this.boxHeight = 240
          this.boxColor = Color.Blue
        } else {
          this.boxWidth = 100
          this.boxHeight = 100
          this.boxColor = Color.Red
        }
        this.flag = !this.flag
      })

    }

  }
}