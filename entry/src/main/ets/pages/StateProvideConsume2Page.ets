
@Entry
@Component
struct StateProvideConsume2Page {
  @Provide("count") count: number =1
  build() {
    Stack(){
      Column() {
        Text(`${this.count}`)
          .fontSize(40)
          .fontWeight(FontWeight.Bold)

        ConsumeSecondPage({
          color:Color.Red
        })
        ConsumeSecondPage({
          color:Color.Orange
        })

        ConsumeSecondPage({
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
struct ConsumeSecondPage{
  private color:Color
  build(){
    Column(){
      ConsumeThirdPage()
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


@Component
struct ConsumeThirdPage{
  @Consume('count') count:number
  build(){
    Text(`${this.count}`)
      .fontSize(40)
      .fontWeight(FontWeight.Bold)
      .width(120)
      .height(120)
      .textAlign(TextAlign.Center)
      .onClick(()=>{
        this.count++
      })
  }
}