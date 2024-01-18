@Entry
@Component
struct AnimationTransitionPage {
  @State flag: boolean = false;

  build() {
    Stack({
      alignContent: Alignment.BottomEnd
    }) {

      Column() {
        if (this.flag) {
          Row() {
            Image("https://www.itying.com/images/flutter/2.png")
              .width(200)
              .height(200)
          }
          .width(200)
          .height(200)
          .justifyContent(FlexAlign.Center)
          .transition(
            {
              type: TransitionType.Insert,
              translate: {
                x: 300,
                y: 300
              }
            }
          )
          .transition(
            {
              type: TransitionType.Delete,
              opacity: 0,
              scale: {
                x: 0,
                y: 0
              }
            }
          )
        }
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)

      Button() {
        Text("动画").fontSize(20).fontColor(Color.White)
      }.onClick((event: ClickEvent) => {
        animateTo({
          duration: 1000
        }, () => {
          this.flag = !this.flag
        })
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