import curves from '@ohos.curves'

@Entry
@Component
struct AnimationSpringCurvePage {
  @State translateX: number = 0 //刚开始的位置

  jumpWithSpeed(velocity: number) {
    this.translateX = -10 //点击后的起始位置
    animateTo({
      duration: 1000,
      // 速度(velocity) 弹簧系统的 质量(mass) 刚度(stiffness) 阻尼（ damping）
      curve: curves.springCurve(velocity, 1, 1, 1)
    }, () => {
      this.translateX = 0 //最终的位置
    })
  }

  build() {
    Column() {
      Row() {
        Text("登录框").fontSize(40).width('100%').textAlign(TextAlign.Center)
      }
      .width(200)
      .height(200)
      .backgroundColor(Color.Gray)
      .margin({
        top: 20
      })
      .translate({
        x: this.translateX
      })

      Row() {
        Button("jump 10").fontSize(14)
          .onClick(() => {
            // 以初速度10的弹簧曲线进行平移
            this.jumpWithSpeed(10);
          })
        Button("jump 200").fontSize(14)
          .onClick(() => {
            // 以初速度200的弹簧曲线进行平移
            this.jumpWithSpeed(200);
          })
      }
      .margin({
        top: 40
      }).justifyContent(FlexAlign.SpaceAround)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}