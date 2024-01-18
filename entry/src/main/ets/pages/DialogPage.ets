
import promptAction from '@ohos.promptAction'
@Entry
@Component
struct DialogPage {
  @State message: string = 'Hello World'

  showToast() {
    promptAction.showToast({
      message:"登录成功",
      duration:4000,
      bottom:400
    })
  }
  showDialog() {
    promptAction.showDialog({
      title:"提示！",
      message:"您确定要删除吗?",
      buttons:[
        {
          text:"取消",
          color:"#000"
        },
        {
          text:"确定",
          color:"#000"
        }
      ]

    })
      .then((data)=>{
        console.log("showDialog index:"+data.index)
      })
  }

  showActionMenu() {

    promptAction.showActionMenu({
      title:"选择字体",
      buttons:[
        {
          text:"超大号",
          color:"#000"
        },
        {
          text:"大号",
          color:"#000"
        },
        {
          text:"中号",
          color:"#000"
        },
        {
          text:"小号",
          color:"#000"
        },
      ]
    }).then((data)=>{
      console.log("showActionMenu index:"+data.index)
    })
  }

  build() {
    Column() {
      Button() {
        Text("showToast").fontColor(Color.White).fontSize(18)
      }.width("90%")
      .height(40).margin({ top: 40 })
      .onClick(() => {
        this.showToast()
      })

      Button() {
        Text("showDialog ").fontColor(Color.White).fontSize(18)
      }.width("90%")
      .height(40).margin({ top: 40 })
      .onClick(() => {
        this.showDialog()
      })

      Button() {
        Text("showActionMenu").fontColor(Color.White).fontSize(18)
      }.width("90%")
      .height(40).margin({ top: 40 })
      .onClick(() => {
        this.showActionMenu()
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}