
@Entry
@Component
struct TextInputPage {
  @State message: string = 'aaa'
  controller: TextInputController = new TextInputController()

  build() {
    Scroll() {
      Column() {
        TextInput({
          placeholder: "请输入用户名", //提示
          text: "lisi", //真实内容
          controller: this.controller
        }).height(60)
        Button() {
          Text("改变光标的位置").fontColor(Color.White)
        }.onClick(() => {
          this.controller.caretPosition(2)
        }).width("90%")
        .height(40)
        .margin({ top: 20 })

        TextInput({
          placeholder: "请输入内容",
          text: this.message
        })
          .height(60)
          .type(InputType.Normal)
          .margin({ top: 20 })
          .placeholderColor(Color.Grey) //提示文本颜色
          .placeholderFont({ size: 20, weight: 400 }) //提示文本字体
          .fontSize(20) //输入文本大小
          .fontColor(Color.Black) //输入文本颜色
          .onChange((str) => {
            this.message = str;
          })

        Text(this.message)

        TextInput()
          .height(60)
          .type(InputType.PhoneNumber)
          .margin({ top: 20 })

        TextInput()
          .height(60)
          .type(InputType.Password)
          .margin({ top: 20 })

        TextInput()
          .height(60)
          .type(InputType.Password)
          .margin({ top: 20 })
          .borderRadius(0)
          .backgroundColor(Color.Orange)

        TextArea({
          placeholder: "请输入详情内容"
        })
          .width('100%')
          .height(100)
          .margin({ top: 20 })
          .fontSize(20)
          .fontColor(Color.Red)
          .borderRadius(10)
          .onChange((value) => {
            console.log(value)
          })

        Row() {
          Text("男")
          Radio({
            value: "1",
            group: "sex"
          }).checked(true)
            .onChange((value) => {
              console.log(value.toString());
            })

          Text("女").margin({ left: 10 })
          Radio({
            value: "2",
            group: "sex"
          }).onChange((value) => {
            console.log(value.toString());
          })
        }.margin({ top: 20 })
        .justifyContent(FlexAlign.Start)
        .width("100%")


        Row() {
          Text("爱好:").fontWeight(FontWeight.Bold)
          Checkbox({
            name: "Checkbox1"
          })
            .select(true)
            .onChange((value) => {
              console.log(value.toString())
            })
          Text("吃饭")

          Checkbox({
            name: "Checkbox1"
          })
            .select(true)
          Text("睡觉")
          Checkbox({
            name: "Checkbox1"
          })
            .select(true)
          Text("写代码")
          Checkbox({
            name: "Checkbox1"
          })
            .select(true)
          Text("打游戏")
        }.margin({ top: 20 })
        .justifyContent(FlexAlign.Start)
        .width("100%")


        Column() {

          Row() {
            CheckboxGroup({
              group: "aaa"
            })
            Text('Select All').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
          }.justifyContent(FlexAlign.Start)
          .width("100%")

          Row() {
            Checkbox({
              name:"a1",
              group: "aaa"
            })
            Text('A').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
          }.justifyContent(FlexAlign.Start)
          .width("100%")
          Row() {
            Checkbox({
              name:"a2",
              group: "aaa"
            })
            Text('B').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
          }.justifyContent(FlexAlign.Start)
          .width("100%")

          Row() {
            Checkbox({
              name:"a3",
              group: "aaa"
            })
            Text('C').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
          }.justifyContent(FlexAlign.Start)
          .width("100%")

        }.width("100%")
        .margin({top:20,bottom:200})

      }
      .width('100%')
      .padding(20)
    }.scrollBar(BarState.Off)
  }
}