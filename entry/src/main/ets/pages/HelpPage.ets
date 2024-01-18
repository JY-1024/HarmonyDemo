//自定义接口
interface HelpInterface{
  title:string,
  icon:Resource
}

@Entry
@Component
struct HelpPage {
  @State message: string = 'Hello World'
  @State helpList:HelpInterface[] = [
    {
      title:"我的订阅",
      icon:$r('app.media.subscribe')
    },
    {
      title:"常见问题",
      icon:$r("app.media.problem")
    },
    {
      title:"在线客服",
      icon:$r("app.media.customer_service")
    },
    {
      title:"意见反馈",
      icon:$r("app.media.opinion")
    },
    {
      title:"关怀模式",
      icon:$r("app.media.give")
    },
    {
      title:"会员中心",
      icon:$r("app.media.user")
    }
  ]
  build() {
    Column() {
      Flex({wrap:FlexWrap.Wrap}){
        ForEach(
          this.helpList,
          (item:HelpInterface,index)=>{
            Column(){
              Image(item.icon).width(48).height(48)
              Text(item.title).fontSize(16).margin(5)
            }
            .width('25%')
            .margin({bottom:10})
          },
          item=>item
        )
      }
      .padding(10)
      .height(200)
      .margin(10)
      .borderRadius(10)
      .backgroundColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#eee')
  }
}