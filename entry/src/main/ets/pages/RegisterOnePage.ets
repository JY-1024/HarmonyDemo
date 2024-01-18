import router from '@ohos.router'
import AppBar from '../pages/widget/AppBar'

@Entry
@Component
struct RegisterOnePage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      AppBar({ title: '注册第一步' })
      Button('跳转到注册第二步')
        .onClick(() => {
          // router.replaceUrl({
          //   url:'pages/RegisterTwoPage',
          // })
          router.pushUrl({
            url:'pages/RegisterTwoPage',
          })
        })
    }
    .width('100%')
    .height('100%')
  }
}