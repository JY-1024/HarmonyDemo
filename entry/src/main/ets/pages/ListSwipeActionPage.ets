interface SwipeInterface {
  username: string,
  info: string,
  date: string,
  icon: string,
}

@Entry
@Component
struct ListSwipeActionPage {
  @State list: SwipeInterface[] = [
    {
      username: "安安",
      info: "吃饭了吗",
      date: "10-23",
      icon: "https://www.itying.com/images/listimg/icon/user1.png"
    },
    {
      username: "大明",
      info: "聊吗美女",
      date: "10-22",
      icon: "https://www.itying.com/images/listimg/icon/user2.png"
    },
    {
      username: "大地",
      info: "现在出发",
      date: "10-22",
      icon: "https://www.itying.com/images/listimg/icon/user3.png"
    },
    {
      username: "小贾",
      info: "哈哈哈",
      date: "10-21",
      icon: "https://www.itying.com/images/listimg/icon/user4.png"
    },
  ]
  @Builder ActionItem(index:number){
    Button({ type: ButtonType.Circle }) {
      Image("https://www.itying.com/images/listimg/icon/delete.png")
        .width(24)
        .height(24)
    }
    .onClick(() => {
      //日志调试
      console.log(index.toString())
      this.list.splice(index,1)
    }).backgroundColor(Color.Red)
    .width(40)
    .height(40)
    .margin({left:20})
  }
  build() {
    Column() {
      List() {
        ForEach(this.list, (item: SwipeInterface, key) => {
          ListItem() {
            Row() {
              Row() {
                if (key == 1) {
                  Badge({
                    count: 2,
                    position: BadgePosition.RightTop,
                    style: { badgeSize: 16, badgeColor: '#FA2A2D' }
                  }) {
                    Image(item.icon)
                      .width(60)
                      .height(60)
                      .margin({ right: 6 })
                  }
                } else {
                  Image(item.icon)
                    .width(60)
                    .height(60)
                    .margin({ right: 6 })

                }


                Column() {
                  Text(`${item.username}`).fontSize(16).fontWeight(FontWeight.Bold)
                  Text(`${item.info}`).fontColor("#666")
                }.alignItems(HorizontalAlign.Start)
                .height('80%')
                .justifyContent(FlexAlign.SpaceAround)
              }

              Text("12-21")
            }.width('100%')
            .justifyContent(FlexAlign.SpaceBetween)

          }.height(60)
          .margin({ bottom: 10, top: 10 })
          .swipeAction({
            // end:this.ActionItem(key)
            end:this.ActionItem.bind(this,key)
          })
        })
      }
      .padding(10)
      .divider({
        strokeWidth: 1,
        color: "#eee"
      })
    }
    .width('100%')
    .height('100%')
  }
}