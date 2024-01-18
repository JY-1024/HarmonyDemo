@Entry
@Component
struct State2Page {
  @State count:number=1
  build() {
    Stack(){
      Column() {
        Text(`${this.count}`)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)

        Box({
          num:this.count,
          color:Color.Red
        })
        Box({
          num:this.count,
          color:Color.Orange
        })

        Box({
          num:this.count,
          color:Color.Pink
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      Button({type:ButtonType.Circle}){
        Text("+").fontSize(40).fontColor(Color.White)
      }.width(60)
      .height(60)
      .position({
        x:"80%",
        y:"90%"
      })
      .onClick(()=>{
        this.count++
      })
    }
  }
}

@Component
struct Box{
  private color:Color
  private num:number
  build(){
    Column(){
      Text(`${this.num}`)
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
    }
    .width(120)
    .height(120)
    .backgroundColor(this.color)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .margin({
      top:10
    })
  }
}