import http from '@ohos.net.http';
import ResponseCode from '@ohos.net.http';
import image from '@ohos.multimedia.image';
import AppBar from "../pages/widget/AppBar"
@Entry
@Component
struct PixelMapImage {
  @State image: PixelMap = undefined;
  //生命周期函数
  aboutToAppear(){
    http.createHttp().request("https://www.itying.com/themes/itying/images/51_284.png",
      (error, data) => {
        if (error){
          console.error(`http reqeust failed with. Code: ${error.code}, message: ${error.message}`);
        } else {
          let code = data.responseCode;
          if (ResponseCode.ResponseCode.OK === code) {
            let res: any = data.result
            let imageSource = image.createImageSource(res);
            let options = {
              alphaType: 0,                     // 透明度
              editable: false,                  // 是否可编辑
              pixelFormat: 3,                   // 像素格式
              scaleMode: 1,                     // 缩略值
              size: { height: 100, width: 100}
            }  // 创建图片大小
            imageSource.createPixelMap(options).then((pixelMap) => {
              this.image = pixelMap
            })
          }
        }
      }
    )
  }
  build() {
    Column() {
      AppBar({title:"PixelMapImage(了解)"})

      Image(this.image).height(100).width(100)

    }
    .width('100%')
    .height('100%')
  }
}