// pages/sort/sort.js
Page({

    /**
     * 页面的初始数据
     */
    data: {
        b_name:'',
        books:[],
        b_id:0,
        class_xs:'小说',
        class_th:'童话',
        class_mz:'名著',
        class_kx:'科学',
        class_zz:'杂志',
        class_mh:'漫画'

    },

    //获取输入框内容
    inputBname(e){
        this.setData({
            b_name:e.detail.value
        })
    },

    //通过书名查找图书
    findBookByBname(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookByName',
          method:'POST',
          data:{
            b_name:this.data.b_name
          },
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

    //查找小说
    findBookByXS(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookByClass',
          method:'POST',
          data:{
              b_class:this.data.class_xs
          },
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

    //查找童话
    findBookByTH(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookByClass',
          method:'POST',
          data:{
              b_class:this.data.class_th
          },
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

    //查找名著
    findBookByMZ(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookByClass',
          method:'POST',
          data:{
              b_class:this.data.class_mz
          },
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

    //查找科学
    findBookByKX(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookByClass',
          method:'POST',
          data:{
              b_class:this.data.class_kx
          },
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

    //查找杂志
    findBookByZZ(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookByClass',
          method:'POST',
          data:{
              b_class:this.data.class_zz
          },
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

    //查找漫画
    findBookByMH(){
        wx.request({
          url: 'http://localhost:8080/book_share/findBookByClass',
          method:'POST',
          data:{
              b_class:this.data.class_mh
          },
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