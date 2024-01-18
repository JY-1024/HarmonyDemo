@Entry
@Component
struct FlexGrowPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Flex() {

        Row() {
        }.width('33%').height(80).backgroundColor(Color.Red).flexGrow(1)

        Row() {
        }.width('33%').height(80).backgroundColor(Color.Blue).flexGrow(1)

        Row() {
        }.width(60).height(80).backgroundColor(Color.Orange)

      }

      Flex() {
        Row() {
        }.height(80).backgroundColor(Color.Pink).flexGrow(2)

        Row() {
        }.height(80).backgroundColor(Color.Blue).flexGrow(1)
      }.margin({top:20})


      Flex({direction:FlexDirection.Column}) {
        Row() {
        }.width(100).backgroundColor(Color.Black).flexGrow(1)

        Row() {
        }.width(100).backgroundColor(Color.Pink).flexGrow(2)
      }.margin({top:20}).width(100).height(300)
    }
    .width('100%')
    .height('100%')
  }
}