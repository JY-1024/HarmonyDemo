import web_webview from '@ohos.web.webview';

@Entry
@Component
struct WebViewPage {
  @State message: string = 'Hello World'

  controller: web_webview.WebviewController = new web_webview.WebviewController()
  build() {
    Column() {
      //加载在线网页
      Web({src:'http://bbs.itying.com',controller:this.controller})
    }
    .width('100%')
    .height('100%')
  }
}