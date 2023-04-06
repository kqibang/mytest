// pages/me/me.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        u_name:'?',
        u_score:0,
        u_class:2

    },

    //前往登陆
    gotoLogin(){
        wx.navigateTo({
          url: '/pages/index/index',
        })
    },

    //前往注册
    gotoInsert(){
        wx.navigateTo({
          url: '/pages/insert/insert',
        })
    },

    //前往捐赠
    gotoDonate(){
        wx.navigateTo({
          url: '/pages/bookdonate/bookdonate',
        })
    },

    //前往归还
    gotoReturn(){
        wx.navigateTo({
          url: '/pages/bookreturn/bookreturn',
        })
    },

    //前往审核
    gotoCheck(){
        wx.navigateTo({
          url: '/pages/borrowcheck/borrowcheck',
        })
    },

    //从storage中获取用户信息
    useStorage(){
        var userInfo = wx.getStorageSync('userInfo');
        var that = this;
        that.setData({
            u_name:userInfo.u_name,
            u_score:userInfo.u_score,
            u_class:userInfo.u_class
        })
    },

    //退出
    logout() {
        wx.showModal({
            title: '提示',
            content: '真的要退出了吗',
            cancelText:'我骗你的',
            confirmText:'是的没错',
            confirmColor:'#000000',
            cancelColor:'#576b95',
            success (res) {
              if (res.confirm) {
                wx.removeStorage({
                  key: 'userInfo',
                })
                wx.navigateTo({
                  url: '/pages/index/index',
                })
                // wx.switchTab({
                //     url: '/pages/home/home',
                //   })
              } else if (res.cancel) {
                console.log('用户点击取消')
              }
              }
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
        //从storage中获取用户信息
        this.useStorage()
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