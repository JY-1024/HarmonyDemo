@Entry
@Component
struct RelativeContainerPage2 {

  build() {
    Column() {
      RelativeContainer(){
        Text('1')
          .width(100)
          .height(100)
          .lineHeight('200%') //配置上下居中
          .fontSize(40)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Red)
          .alignRules({
            middle:{
              anchor:'__container__',
              align:HorizontalAlign.Center
            }
          })
          .id('text1')
        Text('2')
          .width(100)
          .height(100)
          .lineHeight('200%') //配置上下居中
          .fontSize(40)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Orange)
          .alignRules({
            top:{
              anchor:'text1',
              align:VerticalAlign.Bottom
            },
            left:{
              anchor:'text1',
              align:HorizontalAlign.Start
            }
          })
          .id('text2')
        Text('3')
          .width(100)
          .height(100)
          .lineHeight('200%') //配置上下居中
          .fontSize(40)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Blue)
          .alignRules({
            right:{
              anchor:'text2',
              align:HorizontalAlign.Start
            },
            top:{
              anchor:'text2',
              align:VerticalAlign.Top
            },
          })
          .id('text3')
        Text('4')
          .width(100)
          .height(100)
          .lineHeight('200%') //配置上下居中
          .fontSize(40)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Red)
          .alignRules({
            top:{
              anchor:'text2',
              align:VerticalAlign.Bottom
            },
            left:{
              anchor:'text2',
              align:HorizontalAlign.Start
            }
          })
          .id('text4')
        Text('5')
          .width(100)
          .height(100)
          .lineHeight('200%') //配置上下居中
          .fontSize(40)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.Yellow)
          .alignRules({
            top:{
              anchor:'text2',
              align:VerticalAlign.Top
            },
            left:{
              anchor:'text2',
              align:HorizontalAlign.End
            }
          })
          .id('text5')
      }
      .width(300)
      .height(300)
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