import curves from '@ohos.curves'

@Entry
@Component
struct AnimationMotionPathPage {
  @State flag: boolean = true

  build() {
    Column() {
      Row() {
        Text("路径曲线").fontSize(20).width('100%').textAlign(TextAlign.Center)
      }
      .width(100)
      .height(100)
      .backgroundColor(Color.Gray)
      .margin(10)
      //10,400   100,200  400,600
      //执行动画：从起点移动到(10,400),再到(100,200),再到(400,600)，再到终点
      .motionPath({
        path: 'Mstart.x start.y L10 400 L100 200 L400 600 Lend.x end.y',
        from: 0.0,
        to: 1.0,
        rotatable: false
      })
      .onClick(() => {
        animateTo({
          duration: 4000
        }, () => {
          this.flag = !this.flag
        })
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(this.flag ? HorizontalAlign.Start : HorizontalAlign.End)

  }
}