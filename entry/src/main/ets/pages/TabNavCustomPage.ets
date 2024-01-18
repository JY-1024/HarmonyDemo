
import HomePage from '../pages/tabs/HomePage'
import CatePage from '../pages/tabs/CatePage'
import CartPage from '../pages/tabs/CartPage'
import UserPage from '../pages/tabs/UserPage'
@Entry
@Component
struct TabNavCustomPage {
  @State currentIndex:number = 0
  private tabsController: TabsController = new TabsController()
  //自定义组件
  @Builder
  TabBuilder(title:string,targetIndex:number,normalImg:Resource,selectedImg:Resource){
    Column(){
      Image(this.currentIndex == targetIndex?selectedImg:normalImg )
        .width(28)
        .height(28)
      Text(title)
        .padding({top:2})
        .fontSize(20)
        .fontColor(this.currentIndex == targetIndex?'#d81e06':'#8a8a8a')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(this.currentIndex)
    })

  }

  build() {
    Column() {
      Tabs({
        // barPosition:BarPosition.Start  //默认
        barPosition: BarPosition.End, //底部导航
        controller:this.tabsController,
        index:0 //默认加载哪个选项卡
      }) {
        TabContent() {
          HomePage()
        }.tabBar(this.TabBuilder("首页",0,$r('app.media.home'),$r('app.media.home_selected')))

        TabContent() {
          CatePage()
        }.tabBar(this.TabBuilder("分类",1,$r('app.media.cate'),$r('app.media.cate_selected')))

        TabContent() {
          CartPage()
        }.tabBar(this.TabBuilder("购物车",2,$r('app.media.cart'),$r('app.media.cart_selected')))

        TabContent() {
          UserPage()
        }.tabBar(this.TabBuilder("用户",3,$r('app.media.user'),$r('app.media.user_selected')))
      }
      .scrollable(false) //禁止滑动切换
      .animationDuration(0) //去掉切换页面的动画
    }
    .width('100%')
    .height('100%')
  }

  pageTransition(){
    PageTransitionEnter({
      duration:300,
      type:RouteType.None
    }).onEnter((type: RouteType, progress: number) => {
      console.log("onEnter"+progress)
    }).opacity(1)

    PageTransitionExit({
      duration:300,
      type:RouteType.None
    }).onExit((type: RouteType, progress: number) => {
      console.log("onExit"+progress)
    }).opacity(1)
  }
}