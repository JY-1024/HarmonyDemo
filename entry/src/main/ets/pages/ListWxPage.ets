interface WxListInterface {
  title: string,
  img: string
}

@Entry
@Component
struct ListWxPage {
  @State message: string = 'Hello World'
  @State wxList: WxListInterface[] = [
    {
      title: "服务",
      img: "https://www.itying.com/images/listimg/icon/01.jpg"
    },
    {
      title: "收藏",
      img: "https://www.itying.com/images/listimg/icon/02.jpg"
    },
    {
      title: "朋友圈",
      img: "https://www.itying.com/images/listimg/icon/03.jpg"
    },
    {
      title: "视频号",
      img: "https://www.itying.com/images/listimg/icon/04.jpg"
    },
    {
      title: "卡包",
      img: "https://www.itying.com/images/listimg/icon/05.jpg"
    },
    {
      title: "表情",
      img: "https://www.itying.com/images/listimg/icon/06.jpg"
    },
    {
      title: "设置",
      img: "https://www.itying.com/images/listimg/icon/07.jpg"
    }
  ]

  build() {
    Column() {
      List({ space: 10 }) {
        ListItem() {
          Text('1')
        }
        .backgroundColor(Color.Orange)
        .height(150)
        .width('100%')

        ListItem() {
          Row() {
            Row() {
              Image(`${this.wxList[0].img}`)
                .width(28)
                .height(28)
                .objectFit(ImageFit.Cover)
              Text(`${this.wxList[0].title}`).fontSize(16).margin({ left: 10 })
            }

            Image('https://www.itying.com/images/listimg/icon/arrow_forward.jpg')
              .width(28)
              .height(28)
          }
          .width('100%')
          .backgroundColor(Color.White)
          .padding(12)
          .justifyContent(FlexAlign.SpaceBetween)
        }

        ListItem() {
          Column() {
            ForEach(
              this.wxList,
              (item: WxListInterface, index) => {
                if (index != 0 && index != this.wxList.length - 1) {
                  Row() {
                    Row() {
                      Image(`${this.wxList[index].img}`)
                        .width(28)
                        .height(28)
                        .objectFit(ImageFit.Cover)
                      Text(`${this.wxList[index].title}`).fontSize(16).margin({ left: 10 })
                    }

                    Image('https://www.itying.com/images/listimg/icon/arrow_forward.jpg')
                      .width(28)
                      .height(28)
                  }
                  .width('100%')
                  .padding(12)
                  .justifyContent(FlexAlign.SpaceBetween)

                  Divider()
                    .strokeWidth(1)
                    .color('#eee')
                    .padding({ left: 15 })
                }
              },
              item => item)
          }
          .backgroundColor(Color.White)
        }

        ListItem() {
          Row() {
            Row() {
              Image(`${this.wxList[6].img}`)
                .width(28)
                .height(28)
                .objectFit(ImageFit.Cover)
              Text(`${this.wxList[6].title}`).fontSize(16).margin({ left: 10 })
            }

            Image('https://www.itying.com/images/listimg/icon/arrow_forward.jpg')
              .width(28)
              .height(28)
          }
          .width('100%')
          .backgroundColor(Color.White)
          .padding(12)
          .justifyContent(FlexAlign.SpaceBetween)
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#eee')
  }
}