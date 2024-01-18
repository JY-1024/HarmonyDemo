@Entry
@Component
struct StatePage {
  @State message:string = 'Hello State'
  build(){
    Column(){
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .onClick(()=>{
          this.message='Hello ArkTS!'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}