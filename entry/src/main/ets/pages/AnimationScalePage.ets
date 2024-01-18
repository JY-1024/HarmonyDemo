@Entry
@Component
struct AnimationScalePage {
  @State flag: boolean = true;
  @State xScale: number = 1;
  @State yScale: number = 1;

  build() {
    Stack({
      alignContent: Alignment.BottomEnd
    }) {

      Column() {
        Row() {
          Image("https://www.itying.com/images/flutter/2.png")
            .width(100)
            .height(100)
            .scale({
              x: this.xScale,
              y: this.yScale
            })
            .animation({
              duration: 1000
            })
        }.width(200)
        .height(200)
        .justifyContent(FlexAlign.Center)

      }
      .width('100%')
      .height('100%')
      .padding(20)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)

      Button() {
        Text("动画").fontSize(20).fontColor(Color.White)
      }.onClick((event: ClickEvent) => {

        if (this.flag) {
          this.xScale = 3
          this.yScale = 3
        } else {
          this.xScale = 1
          this.yScale = 1
        }
        this.flag = !this.flag

      })
      .width(80)
      .height(80)
      .margin({
        bottom: 10,
        right: 10
      })
    }
  }
}