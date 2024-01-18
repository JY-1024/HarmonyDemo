@Entry
@Component
struct RelativeContainerPage {
  build() {
    Column() {
      //RelativeContainer必须包含子元素
      //RelativeContainer 里面的子元素必须配置id属性
      //RelativeContainer 固定的id就是__container__
      RelativeContainer() {
        Text('1')
          .width(100)
          .height(100)
          .fontSize(30)
          .backgroundColor(Color.Blue)
          .alignRules({
            //当前容器的属性
            middle: {
              anchor: "__container__", //锚点  传入的就是容器的id
              align: HorizontalAlign.Center //相对于锚点的位置
            }
          })
          .id('text1')
        Text('2')
          .width(100)
          .height(100)
          .fontSize(30)
          .alignRules({
            right: { //right 当前容器的属性
              anchor: "__container__",
              align: HorizontalAlign.End
            },
            bottom: { //bottom 当前容器的属性
              anchor: "__container__",
              align: VerticalAlign.Bottom
            }
          })
          .backgroundColor(Color.Orange)
          .id('text2')
        Text('3')
          .width(100)
          .height(100)
          .fontSize(30)
          .backgroundColor(Color.Red)
          .id('text3')
          .alignRules({
            left:{
              anchor:'__container__',
              align:HorizontalAlign.Start
            },
            center:{
              anchor:'__container__',
              align:VerticalAlign.Center
            }
          })
        Text('4')
          .width(100)
          .height(100)
          .fontSize(30)
          .backgroundColor(Color.Pink)
          .id('text4')
          .alignRules({
            bottom:{
              anchor:"text1",
              align: VerticalAlign.Top
            },
            middle:{
              anchor:'text1',
              align:HorizontalAlign.Center
            }
          })
          .offset({
            x:10,
            y:-10
          })
      }
      .height(300)
      .width(300)
      .border({
        width: 1,
        color: Color.Red
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}