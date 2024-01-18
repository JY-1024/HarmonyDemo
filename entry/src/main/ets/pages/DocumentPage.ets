import Want from '@ohos.app.ability.Want'
import common from '@ohos.app.ability.common'
@Entry
@Component
struct DocumentPage {
  @State editTitle: boolean = true
  @State title: string = '标题'
  @State content: string = ''
  private context = getContext(this) as common.UIAbilityContext

  build() {
    Row({space:10}) {
      Column({space:10}) {
        Row({space:10}){
          Image($r('app.media.ic_files_doc'))
            .width(30)
            .onClick(()=>{
              // 跳转到文档列表的 UIAbility
              let want: Want = {
                deviceId: '', //设备id。空代表当前应用
                bundleName: 'com.example.myapplication',
                abilityName: 'EntryAbility', //要拉起的abilityName
                moduleName: 'entry', //模块名
              }
              // 跳转
              this.context.startAbility(want)
            })

          if (!this.editTitle) {
            Text(this.title)
              .fontSize(30)
              .fontWeight(FontWeight.Bold)
          } else {
            TextInput({
              placeholder: '请输入标题',
              text: this.title
            })
              .layoutWeight(1)
              .onChange((value)=>{
                this.title = value
              })
            Button('确定')
              .onClick(()=>{
                this.editTitle = false
              })
          }
        }
        .width('100%')

        Divider()
        TextArea({
          placeholder:'请输入文档内容',
          text:this.content
        })
          .layoutWeight(1)
          .onChange((val)=>{
            this.content = val
          })
      }
      .padding(10)
      .width('100%')
    }
    .height('100%')
  }
}