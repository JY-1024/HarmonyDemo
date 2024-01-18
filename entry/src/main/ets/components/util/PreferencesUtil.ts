import preferences from '@ohos.data.preferences';

class PreferencesUtil {
  preMap: Map<string, preferences.Preferences> = new Map()

  //加载preferences实例
  /*  //异步写法
     loadPreference(context, name: string) {
      // 加载preferences
       preferences.getPreferences(context, name)
         .then((pref)=>{
           this.preMap.set(name,pref)
           console.log('testTag',`加载Preferences[${name}]成功`)
         })
         .catch((reason)=>{
           console.log('testTag',`加载Preferences[${name}]失败`,JSON.stringify(reason))
         })
    }*/

  //同步写法
  async loadPreference(context, name: string) {
    // 加载preferences
    try {
      let pref = await preferences.getPreferences(context, name)
      this.preMap.set(name, pref)
      console.log('testTag', `加载Preferences[${name}]成功`)
    } catch (e) {
      console.log('testTag', `加载Preferences[${name}]失败`, JSON.stringify(e))
    }
  }

  //新增
  async putPreferenceValue(name: string, key: string, value: preferences.ValueType) {
    if (!this.preMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化!`)
      return
    }
    try { //根据名称获取Preference对象
      let pref = this.preMap.get(name)
      //写入数据
      await pref.put(key, value)
      //刷盘
      await pref.flush()
      console.log('testTag', `保存Preferences[${name}.${key}=${value}]成功`)
    } catch (e) {
      console.log('testTag', `保存Preferences[${name}.${key}=${value}]失败`, JSON.stringify(e))
    }
  }

  //读
  async getPreferenceValue(name: string, key: string, defaultValue: preferences.ValueType) {
    if (!this.preMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化!`)
      return
    }
    try { //根据名称获取Preference对象
      let pref = this.preMap.get(name)
      //读取数据
      let value = await pref.get(key, defaultValue)
      console.log('testTag', `读取Preferences[${name}.${key}]成功`)
      return value
    } catch (e) {
      console.log('testTag', `读取Preferences[${name}.${key}]失败`, JSON.stringify(e))
    }
  }

  //删
  async deletePreferenceValue(name: string, key: string) {
    if (!this.preMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化!`)
      return
    }
    try { //根据名称获取Preference对象
      let pref = this.preMap.get(name)
      //删除数据
      await pref.delete(key)
      console.log('testTag', `删除Preferences[${name}.${key}]成功`)
    } catch (e) {
      console.log('testTag', `删除Preferences[${name}.${key}]失败`, JSON.stringify(e))
    }
  }

}

const prefencesUtil = new PreferencesUtil()

export default prefencesUtil as PreferencesUtil