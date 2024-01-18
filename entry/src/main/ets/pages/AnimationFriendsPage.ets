import router from '@ohos.router'

interface ImageListData {
  uniqueId: string,
  author: string,
  imageUrl: string
}

@Entry
@Component
struct AnimationFriendsPage {
  @State message: string = 'Hello World'
  listData: ImageListData[] = [
    {
      "uniqueId": 'Candy-Shop',
      "author": 'Mohamed Chahin',
      "imageUrl": 'https://www.itying.com/images/flutter/1.png',
    },
    {
      "uniqueId": 'Childhood',
      "author": 'Google',
      "imageUrl": 'https://www.itying.com/images/flutter/2.png',
    },
    {
      "uniqueId": 'Alibaba-Shop',
      "author": 'Alibaba',
      "imageUrl": 'https://www.itying.com/images/flutter/3.png',
    },
    {
      "uniqueId": 'Candy',
      "author": 'Mohamed Chahin',
      "imageUrl": 'https://www.itying.com/images/flutter/4.png',
    },
    {
      "uniqueId": 'Tornado',
      "author": 'Mohamed Chahin',
      "imageUrl": 'https://www.itying.com/images/flutter/5.png',
    },
    {
      "uniqueId": 'white-dragon',
      "author": 'Mohamed Chahin',
      "imageUrl": 'https://www.itying.com/images/flutter/7.png',
    }
  ]

  build() {
    Column() {
      Grid() {
        ForEach(this.listData, (item: ImageListData) => {
          GridItem() {
            Image(item.imageUrl).objectFit(ImageFit.Auto)
              .sharedTransition(item.uniqueId, {
                duration: 500
              })
          }.onClick(() => {
            router.pushUrl({
              url: "pages/AnimationFriendsImagePage",
              params: {
                uniqueId: item.uniqueId,
                imageUrl: item.imageUrl
              }
            })
          })
        })

      }
      .columnsTemplate(`1fr 1fr`)
      .columnsGap(10)
      .rowsGap(10)
    }
    .padding(10)
    .width('100%')
    .height('100%')
  }

  //去掉页面转场动画
  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}