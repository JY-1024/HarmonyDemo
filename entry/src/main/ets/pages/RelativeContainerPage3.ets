@Entry
@Component
struct RelativeContainerPage3 {
  @State list: number[] = [1, 2, 3, 4]
  @State flag: boolean = false

  build() {
    Column() {
      Stack({ alignContent: Alignment.BottomEnd }) {
        List({ space: 10 }) {
          ForEach(
            this.list,
            (item, index) => {
              ListItem() {
                Text('1')
                  .fontSize(34)
                  .width('100%')
                  .height(60)
                  .borderRadius(10)
                  .textAlign(TextAlign.Center)
                  .backgroundColor('#eee')
              }
            },
            item => item
          )
        }
        .padding(10)
        .height('100%')

        RelativeContainer() {
          Button() {
            Text('+').fontColor(Color.White).fontSize(36)
          }
          .width(60)
          .height(60)
          .alignRules({
            right: {
              anchor: '__container__',
              align: HorizontalAlign.End
            },
            bottom: {
              anchor: '__container__',
              align: VerticalAlign.Bottom
            }
          })
          .id('bt1')
          .onClick(()=>{
            this.flag = !this.flag
          })

          if (this.flag) {
            Button() {
              Text('A').fontColor(Color.White).fontSize(36)
            }
            .width(60)
            .height(60)
            .backgroundColor(Color.Orange)
            .alignRules({
              right: {
                anchor: 'bt1',
                align: HorizontalAlign.End
              },
              bottom: {
                anchor: 'bt1',
                align: VerticalAlign.Top
              }
            })
            .offset({
              y: -30
            })
            .id('bt2')

            Button() {
              Text('B').fontColor(Color.White).fontSize(36)
            }
            .width(60)
            .height(60)
            .backgroundColor(Color.Gray)
            .alignRules({
              right: {
                anchor: 'bt1',
                align: HorizontalAlign.Start
              },
              bottom: {
                anchor: 'bt1',
                align: VerticalAlign.Top
              }
            })
            .offset({ x: -10, y: -10 })
            .id('bt3')

            Button() {
              Text('C').fontColor(Color.White).fontSize(36)
            }
            .width(60)
            .height(60)
            .backgroundColor(Color.Green)
            .alignRules({
              right: {
                anchor: 'bt1',
                align: HorizontalAlign.Start
              },
              bottom: {
                anchor: 'bt1',
                align: VerticalAlign.Bottom
              }
            })
            .offset({ x: -30 })
            .id('bt4')

          }
        }
        .width(160)
        .height(160)
        .offset({
          x: -10,
          y: -10
        })

      }
    }
    .width('100%')
    .height('100%')
  }
}