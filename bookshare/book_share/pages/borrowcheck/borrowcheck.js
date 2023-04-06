// pages/borrowcheck/borrowcheck.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        checks:[],
        index:0,
        c_pass:0
    },

    //得到捐赠信息
    getDonateMsg(){
        wx.request({
          url: 'http://localhost:8080/book_share/findCheckAll',
          method:'POST',
          data:{ },
          header:{
            'content-type':'application/json'  //默认值
            },
          dataType:"json",
          success:(res)=>{
              this.setData({
                  checks:res.data
              })
          }
        })
    },

    //通过捐赠
    passDonate(e){
        this.setData({
            index:e.currentTarget.dataset.index,
            c_pass:1
        })
        wx.request({
          url: 'http://localhost:8080/book_share/donateCheck',
          method:'POST',
          data:{
            b_name:this.data.checks[this.data.index].b_name,
            b_author:this.data.checks[this.data.index].b_author,
            b_profile:this.data.checks[this.data.index].b_profile,
            b_score:this.data.checks[this.data.index].b_score,
            b_class:this.data.checks[this.data.index].b_class,
            b_image:this.data.checks[this.data.index].b_image,
            u_name:this.data.checks[this.data.index].u_name,
            c_id:this.data.checks[this.data.index].c_id,
            c_pass:this.data.c_pass
          },
          header:{
            'content-type':'application/json'  //默认值
            },
          dataType:"json",
          success:(res)=>{
              if(res.data){
                  wx.showToast({
                    title: '通过成功',
                    icon:'success',
                    duration:2000
                  })
              }else{
                wx.showToast({
                    title: '通过失败',
                    icon:'error',
                    duration:2000
                  })
              }
              this.getDonateMsg()
          }
        })
    },

    //驳回捐赠
    rejectDonate(e){
        this.setData({
            index:e.currentTarget.dataset.index,
            c_pass:2
        })
        wx.request({
          url: 'http://localhost:8080/book_share/donateCheck',
          method:'POST',
          data:{
            b_name:this.data.checks[this.data.index].b_name,
            b_author:this.data.checks[this.data.index].b_author,
            b_profile:this.data.checks[this.data.index].b_profile,
            b_score:this.data.checks[this.data.index].b_score,
            b_class:this.data.checks[this.data.index].b_class,
            b_image:this.data.checks[this.data.index].b_image,
            u_name:this.data.checks[this.data.index].u_name,
            c_id:this.data.checks[this.data.index].c_id,
            c_pass:this.data.c_pass
          },
          header:{
            'content-type':'application/json'  //默认值
            },
          dataType:"json",
          success:(res)=>{
              if(res.data === false){
                wx.showToast({
                    title: '驳回成功',
                    icon:'success',
                    duration:2000
                  })
              }else{
                wx.showToast({
                    title: '驳回失败',
                    icon:'error',
                    duration:2000
                  })
              }
              this.getDonateMsg()
          }
        })
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        this.getDonateMsg()
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