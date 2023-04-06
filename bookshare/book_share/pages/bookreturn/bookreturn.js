// pages/bookreturn/bookreturn.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        borrows:[],
        u_name:''

    },

    /**
     * 通过帐号得到用户的借阅信息
     */
    getBorrowMsg(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBorrowByUname',
          method:"POST",
          data:{
              u_name:this.data.u_name
          },
          header:{
            'content-type':'application/json'  //默认值
            },
          dataType:"json",
          success:(res)=>{
              this.setData({
                  borrows:res.data
              })
          }
        })
    },

    //图书归还
    returnTap(e){
        wx.showModal({
          title: '提示',
          content: '确定要归还吗',
          cancelText:'取消',
          confirmText:'确定',
          confirmColor:'#000000',
          cancelColor:'#576b95',
          success: (res) => {
            if (res.cancel) {
              console.log('用户点击了取消')
            }
        
            if (res.confirm) {
                //实现归还功能
                wx.request({
                    url: 'http://localhost:8080/book_share/bookReturn',
                    method:"POST",
                    data:{
                        br_id:e.currentTarget.dataset.brid
                    },
                    header:{
                      'content-type':'application/json'  //默认值
                      },
                    dataType:"json",
                    success:(res)=>{
                        if(res.data){
                            this.getBorrowMsg()
                        }
                    }
                  })
            }
          }
        })
        
    },
    

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        var userInfo = wx.getStorageSync('userInfo');
        var that = this;
        that.setData({
            u_name:userInfo.u_name
        })
        this.getBorrowMsg()
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