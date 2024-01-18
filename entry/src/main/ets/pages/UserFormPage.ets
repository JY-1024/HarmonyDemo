@Entry
@Component
struct UserFormPage {
  @State showDatePicker: boolean = false
  @State textDate: string = "2024-12-1"
  private userinfo:object={
    username:"",
    sex:"1",
    date:{},
    hobby:[
      {
        title:"吃饭",
        checked:true
      },
      {
        title:"睡觉",
        checked:false
      },
      {
        title:"看电影",
        checked:false
      },
      {
        title:"聊天",
        checked:false
      },
      {
        title:"写代码",
        checked:true
      }
    ],
    info:"",

  }

  build() {
    Column() {
        Stack({alignContent:Alignment.BottomEnd}) {
        Column() {
          Row() {
            Text("姓名：").fontSize(16).fontWeight(FontWeight.Bold)
            TextInput({
              placeholder: "请输入姓名"
            }).layoutWeight(1)
              .borderRadius(10)
              .onChange((value)=>{
                this.userinfo["username"]=value
              })
          }.margin({ bottom: 20 })

          Row() {
            Text("性别：").fontSize(16).fontWeight(FontWeight.Bold)
            Radio({
              value: "1",
              group: "sex"
            }).checked(true)
              .onChange((value)=>{
              if(value==true){
                this.userinfo["sex"]="1"
              }else{
                this.userinfo["sex"]="2"
              }
            })
            Text("男")

            Radio({
              value: "2",
              group: "sex"
            })
              .margin({ left: 20 })
            Text("女")

          }.margin({ bottom: 20 })
          .justifyContent(FlexAlign.Start)
          .width("100%")

          Row() {
            Text("日期：").fontSize(16).fontWeight(FontWeight.Bold)

            Column() {
              Text(this.textDate)
              Divider().width(120).margin({ top: 4 })
            }

          }.margin({ bottom: 20 })
          .justifyContent(FlexAlign.Start)
          .width("100%")
          .onClick(()=>{
            this.showDatePicker=true;
          })


          Flex({ wrap: FlexWrap.Wrap }) {
            Row() {
              Text("爱好：").fontSize(16).fontWeight(FontWeight.Bold)
            }.width(60)
            .height(40)
            ForEach(this.userinfo["hobby"],(item)=>{
              Row() {
                Checkbox().select(item["checked"])
                  .onChange((value)=>{
                    item["checked"]=value
                  })
                Text(item["title"])
              }.width(80)
              .height(40)
            })

          }.margin({ bottom: 20 })

          Row() {
            Text("备注：").fontSize(16).fontWeight(FontWeight.Bold)
            TextArea({
              placeholder: "请输入备注"
            }).layoutWeight(1)
              .borderRadius(10)
              .height(80)
              .onChange((value)=>{
                  this.userinfo['info']=value
              })
          }.margin({ bottom: 20 })


          Button({type:ButtonType.Normal}){
            Text("提交").fontColor(Color.White).fontSize(20)
          }.width("100%")
          .height(50)
          .borderRadius(10)
          .onClick(()=>{
              this.onSubmit()
          })

        }.height('100%')
        .width('100%')
        .onClick(()=>{
            this.showDatePicker=false
        })

        if (this.showDatePicker) {
         Column(){
           Row(){
             Text("x").fontSize(22)
           }.justifyContent(FlexAlign.End)
           .width("100%")
           .height(40)
           .onClick(()=>{
             this.showDatePicker=false
           })
           DatePicker(
             {
               start: new Date('1977-1-1'),
               end: new Date('2100-1-1'),
               selected: new Date('2023-12-10')
             }
           ).onChange((value) => {
              this.userinfo['date']=value
              this.textDate=`${value.year}-${value.month+1}-${value.day}`
           })
         }
          .width("100%")

        }

      }
    }
    .padding(20)
    .width('100%')
    .height('100%')

  }

  onSubmit(){
    //JSON.stringify 表示把json对象转换成json字符串
    //JSON.parse表示把json字符串转换成json对象
    console.log(JSON.stringify(this.userinfo))
  }
}