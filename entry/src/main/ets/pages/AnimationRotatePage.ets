@Entry
@Component
struct AnimationRotatePage {
  @State flag: boolean = true;
  @State boxRotate: number = 0;

  build() {
    Stack({
      alignContent: Alignment.BottomEnd
    }) {

      Column() {
        Row() {
          Image("https://www.itying.com/images/flutter/2.png")
            .width(200)
            .height(200)
            .borderRadius(100)
        }.width(200)
        .height(200)
        .rotate({
          z: 1,
          angle: this.boxRotate
        }).animation({ duration: 1000 })

      }
      .width('100%')
      .height('100%')
      .padding(20)
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)

      Button() {
        Text("动画").fontSize(20).fontColor(Color.White)
      }.onClick((event: ClickEvent) => {
        /*
         animateTo({},()=>{
            if(this.flag){
              this.boxRotate=360
            }else{
              this.boxRotate=0
            }
            this.flag=!this.flag
          })
         */

        if (this.flag) {
          this.boxRotate = 360
        } else {
          this.boxRotate = 0
        }
        this.flag = !this.flag

      })
      .width(80)
      .height(80)
      .margin({
        bottom: 10,
        right: 10
      })
    }
  }
}