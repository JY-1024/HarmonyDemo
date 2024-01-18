
import router from '@ohos.router'

@Entry
@Component
struct StateStorePropAppStoragePage {
  @StorageLink("num") num:number=10
  @StorageProp("count") count:number=1
  build() {
    Column() {

      Text(`count=${this.count}`).fontSize(30)
        .margin({
          top:20
        })

      Button(){
        Text(`设置StorageProp值`).fontSize(18).fontColor(Color.White)
      }.width(200)
      .height(40)
      .onClick(()=>{
        AppStorage.Set<number>("count",AppStorage.Get<number>("count")+1)
      }).margin({
        top:20
      })

      Button(){
        Text(`获StorageProp取值`).fontSize(18).fontColor(Color.White)
      }.width(200)
      .height(40)
      .onClick(()=>{
        let tempCount=AppStorage.Get<number>("count")
        console.log(tempCount.toString())
      }).margin({
        top:20
      })


      Button(){
        Text(`改变变量Count的值`).fontSize(18).fontColor(Color.White)
      }.width(200)
      .height(40)
      .onClick(()=>{
        this.count++
      }).margin({
        top:20
      })



      Text(`num=${this.num}`).fontSize(30)
        .margin({
          top:100
        })
      Button(){
        Text(`设置num的值-News页面会同步状态`).fontSize(18).fontColor(Color.White)
      }.width("96%")
      .height(40)
      .onClick(()=>{
        ++this.num
        PersistentStorage.PersistProp("num",this.num)
      }).margin({
        top:20
      })
      Button(){
        Text(`跳转到news`).fontSize(18).fontColor(Color.White)
      }.width(200)
      .height(40)
      .onClick(()=>{
        router.pushUrl({
          url:"pages/News"
        })
      }).margin({
        top:20
      })




    }.height('100%')
    .width("100%")
  }
}