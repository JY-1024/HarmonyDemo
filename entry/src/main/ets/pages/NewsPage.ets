import router from '@ohos.router'
import AppBar from '../pages/widget/AppBar'

@Entry
@Component
struct NewsPage {
  @State message: string = 'News'
  private cid: string = ''
  private name: string = ''

  aboutToAppear() {
    let params = router.getParams()
    console.log(params['id'])
    console.log(params['name'])
    this.cid = params['id']
    this.name = params['name']
  }

  build() {
    Column() {
      AppBar({ title: '新闻详情' })
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('返回')
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .height('100%')
  }
}