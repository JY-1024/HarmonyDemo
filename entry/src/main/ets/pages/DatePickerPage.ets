@Entry
@Component
struct DatePickerPage {
  @State showDatePicker: boolean = false

  build() {
    Column() {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Column() {
          Button() {
            Text("显示日期").fontColor(Color.White)
          }.margin({ top: 40 })
          .height(60)
          .width("90%")
          .onClick(()=>{
            this.showDatePicker=true;
          })

        }.height('100%')
        .width("100%")
        .onClick(()=>{
          this.showDatePicker=false;
        })

        if (this.showDatePicker) {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
            selected: new Date('2024-1-30')
          }).onChange((date) => {
            console.log(`${date.year}-${date.month + 1}-${date.day}`)
          }).backgroundColor("#eee")
        }

      }
    }
    .width('100%')
    .height('100%')
  }
}