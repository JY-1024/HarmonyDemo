import router from '@ohos.router'
@Entry
@Component
struct SecondPage {
  @State src:string = router.getParams()['title']
  build(){
    Column(){
      Text(this.src)
        .fontSize(16)
        .fontColor(Color.Red)
        .textOverflow({overflow:TextOverflow.Ellipsis})
        .maxLines(1)
        .margin({top:40})

      Button('返回')
        .borderRadius(10)
        .backgroundColor(0x317aff)
        .width(100)
        .height(45)
        .onClick(()=>{
          router.back({
            url:'pages/Index',
            params:'backInfo'
          });
        })
      Button('返回警告')
        .width(100)
        .height(45)
        .margin({top:20})
        .onClick(()=>{
          router.showAlertBeforeBackPage({
            message: '确定要返回吗?'
          })
          router.back()
        })
    }.width('100%')

  }
}