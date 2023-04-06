// pages/bookborrow/bookborrrow.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        u_name:"无法获取用户名，请先登录",
        b_id:'',
        book:{},
        day:'30天'

    },

    //前往登陆
    gotoLogin(){
        wx.navigateTo({
          url: '/pages/index/index',
        })
    },

    //通过书号查找图书信息
    findBookByBid(){
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

    //输入监听
    // inputUname(e){
    //     this.setData({
    //         u_name:e.detail.value
    //     })
    // },

    //确认借阅
    ConfirmBorrow(){
        wx.request({
            url: 'http://localhost:8080/book_share/bookBorrow',
            method:"POST",
              data:{   //传递借阅的参数
                  b_name:this.data.book.b_name,
                  b_author:this.data.book.b_author,
                  u_name:this.data.u_name,
                  b_score:this.data.book.b_score,
                  br_time:this.data.day
              },
              header:{
                'content-type':'application/json'  //默认值
                },
              dataType:"json",
              success:(res) =>{  //返回借阅结果
                  console.log(res.data)
                  if(res.data === true){
                      wx.showToast({
                        title: '借阅成功',
                        icon:'success',
                        duration:1000
                      })
                      setTimeout(
                          function(){
                              wx.switchTab({
                                  url: '/pages/home/home',
                                })
                          },1000)
                  }else{
                      wx.showToast({
                          title: '借阅失败',
                          icon:'error',
                          duration:2000
                        })
                  }
              }
          })
        
    },


    
    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        //获取storage的数据
        var userInfo = wx.getStorageSync('userInfo');
        var that = this;
        that.setData({
            b_id:options.id,
            u_name:userInfo.u_name
        })
        this.findBookByBid()
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