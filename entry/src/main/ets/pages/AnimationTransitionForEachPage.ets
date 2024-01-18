@Entry
@Component
struct AnimationTransitionForEachPage {
  @State numberList: number[] = [1, 2, 3, 4];

  build() {
    Stack({
      alignContent: Alignment.BottomEnd
    }) {

      Column() {
        List({ space: 10 }) {
          ForEach(this.numberList, (item) => {
            ListItem() {
              Text("" + item)
                .fontSize(30)
                .fontWeight(FontWeight.Bold)
                .width("100%")
                .height(60)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.Yellow)
            }.transition({
              type: TransitionType.All,
              translate: {
                x: 300
              },
              scale: {
                x: 0,
                y: 0
              }
            })
            .onClick(() => {
              animateTo({
                duration: 1000
              }, () => {
                let delKey = this.numberList.indexOf(item)
                this.numberList.splice(delKey, 1)
              })
            })
          }, item => item)

        }
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)


      Button() {
        Text("+").fontSize(50).fontColor(Color.White)
      }.onClick((event: ClickEvent) => {
        animateTo({
          duration: 1000
        }, () => {
          this.numberList.push(this.numberList[this.numberList.length-1] + 1)
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