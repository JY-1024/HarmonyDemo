@Entry
@Component
struct AnimationTranslateActionSheetPage {
  @State boxPosition: number = 200
  @State flag: boolean = true

  build() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Column() {
        Button() {
          Text("show actionSheet").fontSize(30).fontColor(Color.White)

        }
        .width("80%")
        .height(60)
        .onClick(() => {
          /*
           animateTo({
            duration:500
          },()=>{
            if(this.flag){
              this.boxPosition=0
            }else{
              this.boxPosition=200
            }
            this.flag=!this.flag
          })
          */

          if (this.flag) {
            this.boxPosition = 0
          } else {
            this.boxPosition = 200
          }
          this.flag = !this.flag
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .onClick(() => {
        this.boxPosition = 200
        this.flag = true
      })

      Column() {
        List({
          space: 44
        }) {
          ListItem() {
            Text("相册选择").fontSize(18).fontColor("#666").width("100%").textAlign(TextAlign.Center)
          }

          ListItem() {
            Text("相机拍照").fontSize(18).fontColor("#666").width("100%").textAlign(TextAlign.Center)
          }

          ListItem() {
            Text("取消").fontSize(18).fontColor("#666").width("100%").textAlign(TextAlign.Center)
          }.onClick(() => {

          })
        }
        .divider({
          strokeWidth: 1,
          color: Color.Gray
        }).margin({
          top: 26
        })
      }
      .width('100%')
      .height(200)
      .backgroundColor("#efefef")
      .translate({
        y: this.boxPosition
      })
      .animation({
        duration: 1000
      })

    }
  }
}