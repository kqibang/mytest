// pages/bookmessage/bookmessage.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        b_id:'',
        book:{}

    },

    //搜索图书信息
    getBookMessage(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookByBid',
          method:"POST",
          data:{
              b_id:this.data.b_id
          },
          header:{
            'content-type':'application/json'  //默认值
            },
          dataType:"json",
          success:(res)=>{
              this.setData({
                  book:res.data
              })
          }
        })

    },

    //前往借阅
    gotoBorrow(e){

        wx.navigateTo({
          url: '/pages/bookborrow/bookborrrow?id='+this.data.b_id,
        })
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        var that=this
        // console.log(options)
        that.setData({
            b_id:options.id
        })
        this.getBookMessage()
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