import { AppBar } from "./widget/AppBar"
import router from '@ohos.router'
@Entry
@Component
struct Product {
  private pId: number
  private cId: number
  aboutToAppear(){
    let params = router.getParams()
    console.log(params["pId"])
    console.log(params["cId"])
    this.pId=params["pId"];
    this.cId=params["cId"];
  }

  build() {
    Column() {
      AppBar({title:"商品页面"})

      Text(`pId=${this.pId}`).fontSize(30)

      Text(`aId=${this.cId}`).fontSize(30)

    }
    .width('100%')
    .height('100%')
  }
}