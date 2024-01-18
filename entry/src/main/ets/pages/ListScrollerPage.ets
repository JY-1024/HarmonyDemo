@Entry
@Component
struct ListScrollerPage {
  @State list: number[] = []
  listScroller: Scroller = new Scroller();
  //监听页面加载的生命周期函数
  onPageShow() {
    for (let index = 0; index < 20; index++) {
      this.list.push(index)
    }
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Column() {
          List({ space: 20,scroller:this.listScroller }) {
            ForEach(
              this.list,
              (item, index) => {
                ListItem() {
                  Text(`${item}`)
                    .fontSize(28)
                    .width('100%')
                    .backgroundColor("#fff")
                    .height(160)
                    .textAlign(TextAlign.Center)
                    .borderRadius(20)
                }
              },
              item => item
            )
          }
          .height('100%')
        }
        // .backgroundColor(Color.Red)
        .height('100%')

        Button() {
          Image('https://www.itying.com/images/listimg/icon/arrow_top.png')
            .width(30)
            .height(30)
            .objectFit(ImageFit.Cover)
        }
        .width(80)
        .height(80)
        .margin({ bottom: 10 })
        .backgroundColor('#ccc')
        .onClick(() => {
          //控制器控制list回到顶部
          this.listScroller.scrollToIndex(0)
        })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#eee')
    .padding(12)
  }
}