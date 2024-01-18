
@Entry
@Component
struct StateStoreLinkAppStoragePage {
  @StorageLink("count") count:number=1
  build() {
    Column() {
      Text(`${this.count}`).fontSize(30)
        .margin({
          top:20
        })

      Button(){
        Text(`设置值-StorageLink`).fontSize(18).fontColor(Color.White)
      }.width(200)
      .height(40)
      .onClick(()=>{
        AppStorage.Set<number>("count",AppStorage.Get<number>("count")+1)
      }).margin({
        top:20
      })

      Button(){
        Text(`获取值-StorageLink`).fontSize(18).fontColor(Color.White)
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

    }.height('100%')
    .width("100%")
  }
}