import router from '@ohos.router'
import AppBar from '../widget/AppBar'

// @Entry
@Component
export default struct HomePage {
  list: string[] = ['跳转到文章详情页面', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',]

  build() {
    Column() {
      AppBar({ title: '首页' })
      Button('跳转到文章详情页面')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/NewsPage',
            params: {
              'id': '1234',
              'name': 'zhangsan'
            }
          })
        })
      .padding(10)

      Image("https://www.itying.com/images/flutter/4.png")
        .width(150)
        .height(150)
        .margin({top:100})
        .sharedTransition("image1",{
          duration:1000,
          type:SharedTransitionEffectType.Exchange  //默认
        })

      Button(){
        Text("跳转到ImagePage").fontSize(20).fontColor(Color.White)
      }.onClick((event: ClickEvent) => {
        router.pushUrl({
          url: "pages/AnimationSharedTransitionPage"
        })
      }).width("80%").height(50).margin({top:100})


      List({ space: 10 }) {
        ForEach(
          this.list,
          (item, index) => {
            ListItem() {
              Text(`${item}`)
                .width('100%')
                .height(100)
                .backgroundColor('#eee')
                .textAlign(TextAlign.Center)
                .fontSize(30)
                .borderRadius(10)
            }

          })
      }
      .padding(10)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}