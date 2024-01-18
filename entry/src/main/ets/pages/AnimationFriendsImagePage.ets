import router from '@ohos.router'

@Entry
@Component
struct AnimationFriendsImagePage {
  @State uniqueId: string = ''
  @State imageUrl: string = ''

  //build方法执行之前触发
  aboutToAppear() {
    //获取上个页面的传值
    let params: object = router.getParams()
    this.uniqueId = params["uniqueId"]
    this.imageUrl = params["imageUrl"]
  }

  //build方法执行完毕后触发
  onPageShow() {

  }

  //页面销毁触发
  onPageHide() {

  }

  build() {
    Column() {
      Image(this.imageUrl).width("100%")
        .sharedTransition(this.uniqueId, {
          duration: 500
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      router.back()
    })
  }

  //去掉页面转场动画
  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}