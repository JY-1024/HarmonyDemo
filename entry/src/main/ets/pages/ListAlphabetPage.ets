
const alphabets = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
  'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

interface CarItemInterface{
  title:string,
}
interface CarInterface{
  alphabet:string,
  carItem:CarItemInterface[]
}
@Entry
@Component
struct ListAlphabetPage {
  @State carList: CarInterface[] = [
    {
      alphabet: "A",
      carItem: [
        {
          title: "奥迪"
        },
        {
          title: "奥拓"
        },
        {
          title: "爱驰"
        },
        {
          title: "ATS"
        },
        {
          title: "AIM"
        },
        {
          title: "阿尔特"
        },
      ]
    },
    {
      alphabet: "B",
      carItem: [
        {
          title: "奔驰"
        },
        {
          title: "比亚迪"
        },
        {
          title: "宝马"
        },
        {
          title: "保时捷"
        },
        {
          title: "北京"
        },
        {
          title: "标致"
        },
      ]
    },
    {
      alphabet: "C",
      carItem: [
        {
          title: "长安"
        },
        {
          title: "长城"
        },
        {
          title: "曹操汽车"
        },
        {
          title: "成功汽车"
        },
        {
          title: "北京"
        },
        {
          title: "标致"
        },
      ]
    }
    ,
    {
      alphabet: "D",
      carItem: [
        {
          title: "大众"
        },
        {
          title: "东风"
        },
        {
          title: "Ds"
        },
        {
          title: "大运"
        },
        {
          title: "东南"
        },
        {
          title: "大帝"
        },
      ]
    },
    {
      alphabet: "E",
      carItem: [
        {
          title: "e.GO"
        },
        {
          title: "Elek"
        },

      ]
    },
    {
      alphabet: "F",
      carItem: [
        {
          title: "丰田"
        },
        {
          title: "福特"
        },
        {
          title: "福田"
        },
        {
          title: "法拉利"
        },
        {
          title: "福地"
        },
        {
          title: "菲亚特"
        },

      ]
    }
  ]
  @State selectedIndex:number=0;
  listScroller:Scroller =new Scroller()
  @Builder GroupHeader(cate: string) {
    Text(cate)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(8)
  }

  build() {
    Column() {
      Stack({
        alignContent:Alignment.End
      }){
        Column(){
          List({scroller:this.listScroller}) {
            ForEach(this.carList, (cate:CarInterface) => {
              ListItemGroup({
                header: this.GroupHeader(`${cate.alphabet}`)
              }) {
                ForEach(cate.carItem, (item:CarItemInterface) => {
                  ListItem() {
                    Text(`${item.title}`)
                      .fontSize(16)
                      .width('100%')
                      .padding(20)
                  }
                })

              }
            })
          }
          .sticky(StickyStyle.Header)  // 设置吸顶，实现粘性标题效果
          .onScrollIndex((index:number)=>{
            this.selectedIndex=index
          })
        }.height('100%')

        AlphabetIndexer({
          arrayValue:alphabets,
          selected:0
        }).selected(this.selectedIndex)
          .onSelect((index)=>{
            this.listScroller.scrollToIndex(index)
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}
