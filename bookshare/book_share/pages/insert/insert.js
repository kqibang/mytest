// pages/insert/insert.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        u_name:'',
        u_pass:'',
        u_rpass:'',
        u_score:50,
        u_class:2,
        msg:''
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
    inputUrpass(e){
        this.setData({
            u_rpass:e.detail.value
        })
    },

    //注册
    insertUser(){
        if(this.data.u_pass === this.data.u_rpass){
            wx.request({
                url: 'http://localhost:8080/book_share/insertUser',
                method:"POST",
                data:{
                  u_name:this.data.u_name,
                  u_pass:this.data.u_pass,
                  u_score:this.data.u_score,
                  u_class:this.data.u_class
                },
                header:{
                    'content-type':'application/json'  //默认值
                 },
                 dataType:"json",
                 success:(res) =>{
                     if(res.data === true){
                        wx.showToast({
                            title: '注册成功',
                            icon:'success',
                            duration:2000
                          })
                          setTimeout(
                              function(){
                                  wx.navigateTo({
                                      url: '/pages/index/index',
                                    })
                              },2000)
                     }else{
                         this.setData({
                             msg:'帐号重复，请修改帐号后重新输入'
                         })
                     }
                 }
                 
              })
        }else{
            this.setData({
                msg:'两次密码不相同'
            })
        }
        
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