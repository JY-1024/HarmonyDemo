//任务类
class Task {
  static id: number = 1
  // 任务名称
  name: string = `任务${Task.id++}`
  // 任务状态，是否完成
  finished: boolean = false
}

//统一的卡片样式
@Styles function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}

// 任务完成样式
@Extend(Text) function finishedTask() {
  .decoration({ type: TextDecorationType.LineThrough })
  .fontColor('#B1B2B1')
}

@Entry
@Component
struct PropPage {
  // 总任务数量
  @State totalTask: number = 0
  // 已完成任务数量
  @State finishTask: number = 0
  // 任务数组
  @State tasks: Task[] = []

  handleTaskChange() {
    // 1、更新任务总数量
    this.totalTask = this.tasks.length
    // 2、更新已完成任务的数量
    this.finishTask = this.tasks.filter((item, index, array) => item.finished).length

  }

  build() {
    Column({ space: 10 }) {
      // 1.任务进度卡片
      Row() {
        Text('任务进度')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Stack() {
          Progress({
            value: this.finishTask,
            total: this.totalTask,
            type: ProgressType.Ring
          })
            .width(100)
          Row() {
            Text(this.finishTask.toString())
              .fontSize(24)
              .fontColor('#36D')
            Text('/' + this.totalTask.toString())
              .fontSize(24)
          }
        }
      }
      .card()
      .margin({ top: 10, bottom: 10 })
      .justifyContent(FlexAlign.SpaceEvenly)
      // 2、新增任务按钮
      Button('新增任务')
        .width(200)
        .onClick(() => {
          console.log("~~~~新增任务~~~~~~")
          // 1、新增任务数据
          this.tasks.push(new Task())
          // 2、更新任务总数量
          this.handleTaskChange()
        })
      // 3、任务列表
      List({ space: 10 }) {
        ForEach(
          this.tasks,
          (item: Task, index: number) => {
            ListItem() {
              Row() {
                Text(item.name)
                  .fontSize(20)
                Checkbox({
                  name: 'checkbox1',
                  group: 'checkboxGroup',
                })
                  .select(item.finished)
                  .selectedColor(Color.Blue)
                  .onChange((value) => {
                    // 1、更新当前任务的状态
                    item.finished = value
                    // 2、更新已完成任务的数量
                    this.handleTaskChange()
                  })
              }
              .card()
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .swipeAction({ end: this.DeleteButton(index)})
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F2F3')
  }

  @Builder DeleteButton(index: number) {
    Button() {
      Image($r('app.media.ic_public_delete_filled'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(()=>{
      this.tasks.splice(index,1) //删除数组中的元素
      this.handleTaskChange()
    })
  }
}