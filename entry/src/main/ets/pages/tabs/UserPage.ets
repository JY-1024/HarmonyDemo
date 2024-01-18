import router from '@ohos.router'
import AppBar from '../widget/AppBar'

// @Entry
@Component
export default struct UserPage {
  build() {
    Column() {
      AppBar({ title: '用户' })
      Button() {
        Text("执行登录").fontColor(Color.White)
      }.onClick(() => {
        router.pushUrl({
          url: 'pages/LoginPage'
        })
      }).margin({
        top: 100
      })
      .padding(10)

      Button('执行注册')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/RegisterOnePage',
          })
        })
        .margin({ top: 100 })


      Button() {
        Text(`获取PersistentStorage数据`).fontSize(18).fontColor(Color.White)
      }.width('90%')
      .height(40)
      .onClick(() => {
        // AppStorage.Set<number>("count",AppStorage.Get<number>("count")+1)
        let count = AppStorage.Get<number>('count')
        console.log(`PersistentStorage 获得值：${count}`)
      }).margin({
        top: 20
      })

    }
    .width('100%')
    .height('100%')
  }
}