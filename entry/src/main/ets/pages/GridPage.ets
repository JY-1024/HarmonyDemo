@Entry
@Component
struct GridPage {
  build() {
    Column() {
      Grid() {
        GridItem() {
          Text('1')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('2')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('3')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('4')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('5')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('6')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('6')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('7')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('8')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }

        GridItem() {
          Text('9')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
        }
      }
      .rowsTemplate('1fr 1fr 1fr') //显示3行
      .columnsTemplate('1fr 2fr 1fr') //显示3列
      .rowsGap(10) //行间距
      .columnsGap(10) //列间距
      .height(400)
    }
    .width('100%')
    .height('100%')
  }
}