import {Container} from './widget/Container'
@Entry
@Component
struct FlexRowPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Flex({
        direction:FlexDirection.Row,
        justifyContent:FlexAlign.Start,   //配置主轴
        wrap:FlexWrap.Wrap,
        alignContent:FlexAlign.Center,   //配置纵轴 注意wrap参数的值必须是wrap为Wrap WrapReverse
        alignItems:ItemAlign.Center // 配置子组件在Flex容器交叉轴上的对齐格式。
      }){
        Container()
        Container({text:2,color:Color.Black,w:90})
        Container({text:3,color:Color.Orange,w:60,h:150})
        Container({text:4,color:Color.Pink,h:200})
        Container({text:5,color:Color.Yellow})
        Container({text:6,color:Color.Blue})
      }.height(500)
      .border({
        color:Color.Red,
        width:4
      })
    }
    .width('100%')
    .height('100%')
  }
}