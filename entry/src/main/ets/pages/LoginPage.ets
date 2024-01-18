import router from '@ohos.router'
import AppBar from '../pages/widget/AppBar'

@Entry
@Component
struct LoginPage {
  @State message: string = 'Hello World'

  build() {
    Column() {
      AppBar({ title: "登录" })

      Text("如果您没有账户请注册？").fontSize(20)

      Button() {
        Text("跳转到注册").fontColor(Color.White)
      }.onClick(() => {
        router.pushUrl({
          url: 'pages/RegisterOnePage'
        })
      }).padding(10)
      .margin({ top: 100 })

      Button(){
        Text("关闭").fontColor(Color.White)

      }.onClick(()=>{
        router.back()
      }).padding(10)
      .width(100)
      .height(40)

    }
    .width('100%')
    .height('100%')
  }

  //自定义动画
  pageTransition(){
    PageTransitionEnter({
      duration:300,
      type:RouteType.None
    }).onEnter((type: RouteType, progress: number) => {

    }).slide(SlideEffect.Bottom)

    PageTransitionExit({
      duration:300,
      type:RouteType.None
    }).onExit((type: RouteType, progress: number) => {

    }).slide(SlideEffect.Bottom)
  }

}