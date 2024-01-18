import http from '@ohos.net.http';
import ShopInfo from '../viewmodel/ShopInfo';
import axios from '@ohos/axios'

class ShopModel {
  baseURL: string = 'http://localhost:3000'
  pageNo: number = 1

  getShopList(): Promise<ShopInfo[]>{
    return new Promise((resolve, reject) => {

      axios.get(
        `${this.baseURL}/shops`,
        {
          params: {pageNo: this.pageNo, pageSize: 3}
        }
      )
        .then(resp => {
          if(resp.status === 200){
            // 查询成功
            console.log('查询商铺成功！', JSON.stringify(resp.data))
            resolve(resp.data)
          }else{
            console.log('查询商铺信息失败！error:', JSON.stringify(resp))
            reject('查询商铺失败')
          }
        })
        .catch(error => {
          console.log('查询商铺信息失败！error:', JSON.stringify(error))
          reject('查询商铺失败')
        })
    })
  }

/*  getShopList(): Promise<ShopInfo[]>{
    return new Promise((resolve, reject) => {
      // 1.创建http的请求对象
      let httpRequest = http.createHttp()
      // 2.发送请求
      httpRequest.request(
        `${this.baseURL}/shops?pageNo=${this.pageNo}&pageSize=3`,
        {
          method: http.RequestMethod.GET
        }
      )
        .then(resp => {
          if(resp.responseCode === 200){
            // 查询成功
            console.log('查询商铺成功！', resp.result)
            resolve(JSON.parse(resp.result.toString()))
          }else{
            console.log('查询商铺信息失败！error:', JSON.stringify(resp))
            reject('查询商铺失败')
          }
        })
        .catch(error => {
          console.log('查询商铺信息失败！error:', JSON.stringify(error))
          reject('查询商铺失败')
        })
    })
  }*/
}

const shopModel = new ShopModel();
export default shopModel as ShopModel;