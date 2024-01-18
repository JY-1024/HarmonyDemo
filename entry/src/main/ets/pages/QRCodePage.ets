@Entry
@Component
struct QRCodePage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      QRCode("https://www.itying.com?uid=12")
        .width(200)
        .height(200)
        .margin({top:20})

      QRCode("https://www.itying.com")
        .color(Color.Red).width(200).height(200)
        .margin({top:20})

      QRCode("124214214325")
        .width(100).height(100).
      backgroundColor(Color.Orange)
        .margin({top:20})
    }
    .width('100%')
    .height('100%')
  }
}