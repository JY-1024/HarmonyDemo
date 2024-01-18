import router from '@ohos.router'
import AppBar from '../pages/widget/AppBar'

@Entry
@Component
struct RegisterTwoPage {
  build() {
    Column() {
      AppBar({ title: '注册第二步22' })

      Button('完成注册 -返回到根')
        .fontColor(Color.White)
        .onClick(() => {
          console.log('testTag', '返回到根导航')
          //返回根
          router.back({
            url: 'pages/tabs/UserPage'
          })
        })
        .padding(10)
        .margin({ top: 100 })

      Button(){
        Text("返回上一页").fontColor(Color.White)
      }.onClick(()=>{
        router.showAlertBeforeBackPage({
          message: '您还没有完成支付，确定要返回吗？' // 设置询问框的内容
        });
        router.back()
      }).padding(10)
      .margin({top:100})

      // 调用router.showAlertBeforeBackPage()方法，设置返回询问框的信息
    }
    .width('100%')
    .height('100%')
  }
}