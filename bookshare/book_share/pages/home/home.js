// pages/home/home.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        books:[ ],
        b_id:0

    },

    //获取所有图书
    findBookAll(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookAll',
          method:"POST",
          data:{},
          header:{
            'content-type':'application/json'  //默认值
            },
          dataType:"json",
          success:(res) => {
              this.setData({
                  books:res.data
              })
          }
        })
    },

    // 前往图书详情页面
    gotoBookMessage:function(e){
        //  console.log(e.currentTarget.dataset.numnum)
        this.setData({
            b_id:e.currentTarget.dataset.bid
        })
        wx.navigateTo({
          url: '/pages/bookmessage/bookmessage?id='+this.data.b_id
        })
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {

        this.findBookAll()
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
        this.findBookAll()
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