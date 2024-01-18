//任务类
@Observed
class Task2 {
  static id: number = 1
  // 任务名称
  name: string = `任务${Task2.id++}`
  // 任务状态，是否完成
  finished: boolean = false
}

//统一的卡片样式
@Styles function card2() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}

// 任务完成样式
@Extend(Text) function finishedTask2() {
  .decoration({ type: TextDecorationType.LineThrough })
  .fontColor('#B1B2B1')
}

// 任务统计信息
class StatInfo {
  totalTask: number = 0
  finishTask: number = 0
}

@Entry
@Component
struct PropPage2 {
  // 总任务数量
  // @State totalTask: number = 0
  // 已完成任务数量
  // @State finishTask: number = 0

  //统计信息
  @State stat:StatInfo = new StatInfo()

  build() {
    Column({ space: 10 }) {
      // 1、任务进度卡片
      // TaskStatistics({ finishTask: this.finishTask, totalTask: this.totalTask })
      TaskStatistics({ finishTask: this.stat.finishTask, totalTask: this.stat.totalTask })

      // 2、任务列表
      // TaskList({totalTask: $totalTask,finishTask: $finishTask})
      TaskList({stat: $stat})

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F2F3')
  }


}


@Component
struct TaskStatistics {
  @Prop finishTask: number
  @Prop totalTask: number

  build() {
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
    .card2()
    .margin({ top: 10, bottom: 10 })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}

@Component
struct TaskList {
  // 总任务数量
  // @Link totalTask: number
  // 已完成任务数量
  // @Link finishTask: number

  @Link stat: StatInfo

  // 任务数组
  @State tasks: Task2[] = []

  handleTaskChange() {
    // 1、更新任务总数量
    this.stat.totalTask = this.tasks.length
    // 2、更新已完成任务的数量
    this.stat.finishTask = this.tasks.filter((item, index, array) => item.finished).length

  }

  build() {
    Column(){
      Button('新增任务')
        .width(200)
        .onClick(() => {
          console.log("~~~~新增任务~~~~~~")
          // 1、新增任务数据
          this.tasks.push(new Task2())
          // 2、更新任务总数量
          this.handleTaskChange()
        })
      // 3、任务列表
      List({ space: 10 }) {
        ForEach(
          this.tasks,
          (item: Task2, index: number) => {
            ListItem() {
             TaskItem({aItem:item,onTaskChange:this.handleTaskChange.bind(this)})
            }
            .swipeAction({ end: this.DeleteButton(index) })
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
    }
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
    .onClick(() => {
      this.tasks.splice(index, 1) //删除数组中的元素
      this.handleTaskChange()
    })
  }
}


@Component
struct TaskItem {
  @ObjectLink aItem:Task2
  onTaskChange: ()=>void
  build() {
    Row() {
      if (this.aItem.finished){
        Text(this.aItem.name)
          .fontSize(20)
          .finishedTask2()
      } else {
        Text(this.aItem.name)
          .fontSize(20)
      }
      Checkbox({
        name: 'checkbox1',
        group: 'checkboxGroup',
      })
        .select(this.aItem.finished)
        .selectedColor(Color.Blue)
        .onChange((value) => {
          // 1、更新当前任务的状态
          this.aItem.finished = value
          // 2、更新已完成任务的数量
          // this.handleTaskChange()
          this.onTaskChange()
        })
    }
    .card2()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}