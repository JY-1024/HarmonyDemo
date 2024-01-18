import {Container} from './widget/Container'

@Entry
@Component
struct FlexColumPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Flex({
        direction:FlexDirection.Column,
        justifyContent:FlexAlign.Start,  //主轴    Column主轴是垂直方向 Row主轴是水平方向
        wrap:FlexWrap.Wrap,
        alignContent:FlexAlign.Start,    //配置纵轴 注意wrap参数的值必须是wrap为Wrap WrapReverse
        alignItems:ItemAlign.End //配置子组件在Flex容器交叉轴上的对齐格式。
      }){
        Container()
        Container({text:2,color:Color.Black,w:120})
        Container({text:3,color:Color.Orange})
        Container({text:4,color:Color.Pink,w:120})
        Container({text:5,color:Color.Yellow})
        Container({text:6,color:Color.Blue})
        Container()
        Container({text:2,color:Color.Black,w:120})
        Container({text:3,color:Color.Orange})
        Container({text:4,color:Color.Pink,w:120})
        Container({text:5,color:Color.Yellow})
        Container({text:6,color:Color.Blue})
      }
      .width('100%')
      .border({
        color:Color.Red,
        width:4
      })


    }
    .width('100%')
    .height('100%')
  }
}