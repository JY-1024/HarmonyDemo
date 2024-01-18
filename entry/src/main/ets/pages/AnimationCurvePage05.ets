@Entry
@Component
struct AnimationCurvePage05 {
  @State boxMargin: number = 10
  @State flag: boolean = true

  build() {
    Stack({
      alignContent: Alignment.BottomEnd
    }) {
      Column() {
        Row() {

        }
        .width(100)
        .height(100)
        .backgroundColor(Color.Red)
        .margin({
          top: this.boxMargin
        })
        .animation({
          duration: 1000, //动画执行的时间
          curve: Curve.LinearOutSlowIn, //动画曲线
          iterations: 1, //执行的次数    -1表示一直执行  默认是1
          playMode: PlayMode.Alternate  //执行动画的模式，执行完成后不回到起点，从终端再次开始执行
        })

      }.width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)

      Button() {
        Text("动画").fontSize(20).fontColor(Color.White)
      }.width(60)
      .height(60)
      .margin({
        bottom: 10,
        right: 10
      }).onClick(() => {
        if (this.flag) {
          this.boxMargin = 600
        } else {
          this.boxMargin = 10
        }
        this.flag = !this.flag
      })

    }
  }
}