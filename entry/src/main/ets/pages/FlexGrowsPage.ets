@Entry
@Component
struct FlexGrowsPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Flex() {
        Row() {
        }.width('33%').height(80).backgroundColor(Color.Red)

        Row() {
        }.width('33%').height(80).backgroundColor(Color.Blue)

        Row() {
        }.width(60).height(80).backgroundColor(Color.Orange)
      }

      //flexGrow: 设置父容器的剩余空间分配给此属性所在组件的比例。用于“瓜分”父组件的剩余空间。
      //与 layoutWeight实现弹性布局一样
      Flex() {
        Row() {
        }.width('33%').height(80).backgroundColor(Color.Pink).flexGrow(2)

        Row() {
        }.width('33%').height(80).backgroundColor(Color.Blue).flexGrow(1)

      }.margin({top:20})

      Flex({direction:FlexDirection.Column}) {
        Row() {
        }.width(100).height(80).backgroundColor(Color.Black).flexGrow(2)

        Row() {
        }.width(100).height(80).backgroundColor(Color.Pink).flexGrow(1)

      }.margin({ top: 20 }).width(100).height(300)

    }
    .width('100%')
    .height('100%')
  }
}