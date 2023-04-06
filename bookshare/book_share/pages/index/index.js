// pages/index/index.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        u_name:'',
        u_pass:'',
        msg:'',
        user:[]

    },

    /**
     * 输入监听
     */
    inputUname(e){
        this.setData({
            u_name:e.detail.value
        })
    },
    inputUpass(e){
        this.setData({
            u_pass:e.detail.value
        })
    },

    //登陆
    login(){
        wx.request({
          url: 'http://localhost:8080/book_share/login',
          method:'post',
          data:{
            u_name:this.data.u_name,
            u_pass:this.data.u_pass
          },
          header:{
             'content-type':'application/json'  //默认值
          },
          dataType:"json",
          success:(res) => {
              this.setData({
                  user:res.data
              })
              //帐号和密码正确跳转到主页
              if(this.data.user.u_name === this.data.u_name){
                  //获取成功后将数据存储到storage
                  wx.setStorage({
                      data:res.data,
                      key:'userInfo',
                    //   success:(res)=>{
                    //       console.log(res)
                    //   }
                  })
                  wx.switchTab({
                    url: '/pages/home/home',
                  })
            }
            else{
                  this.setData({
                        msg:"帐号或密码错误，请重新输入"
                })
            }
          }
        })
        
    },

    //前往注册页面
    insert(){
        wx.navigateTo({
          url: '/pages/insert/insert',
        })
    },
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {

    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady() {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow() {

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload() {

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom() {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage() {

    }
})