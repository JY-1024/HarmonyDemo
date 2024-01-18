import router from '@ohos.router'

@Component
export default struct AppBar {
  title: string = '首页'

  //在build方法执行之前执行
  aboutToAppear() {
    console.log('路由长度=' + router.getLength())
  }
  //build方法执行完毕后才执行
  onPageShow() {

  }

  build() {
    Row() {
      //左
      if (parseInt(router.getLength()) > 1) {

        Row() {
          Image($r('app.media.back'))
            .padding({ left: 6 })
            .height(22)
        }
        .width(60)
        .height('100%')
        .onClick(() => {
          router.back()
        })
      }
      //中
      Row() {
        Text(this.title)
          .size({ width: '100%', height: '50vp' })
          .fontColor('#ffffff')
          .textAlign(TextAlign.Center)
          .fontSize('18fp')
          .fontWeight(FontWeight.Bold)
      }
      .layoutWeight(1)
      //右
      if (parseInt(router.getLength()) > 1) {
        Row() {
        }
        .width(60)
        .height('100%')
      }
    }
    .width('100%')
    .height(50)
    .backgroundColor('#d81e06')
  }
}