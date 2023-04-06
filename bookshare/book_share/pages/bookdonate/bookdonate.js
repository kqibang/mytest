// pages/bookdonate/bookdonate.js
Page({

    /**
     * 页面的初始数据
     */
    data: {

        u_name:'',
        b_name:'',
        b_author:'',
        b_profile:'',
        b_score:5,
        b_class:'',
        b_image:'http://localhost:8080/book_share/img/noimg.jpg',
        count:1,
        imgs:""
    },

    /**
     * 输入监听
     */
    inputBname(e){
        this.setData({
            b_name:e.detail.value
        })
    },
    inputBauthor(e){
        this.setData({
            b_author:e.detail.value
        })
    },
    inputBprofile(e){
        this.setData({
            b_profile:e.detail.value
        })
    },
    inputBscore(e){
        this.setData({
            b_score:e.detail.value
        })
    },
    inputBclass(e){
        this.setData({
            b_class:e.detail.value
        })
    },
    inputUname(e){
        this.setData({
            u_name:e.detail.value
        })
    },

    //确认捐赠
    ConfirmDonate(){
        wx.request({
          url: 'http://localhost:8080/book_share/bookDonate',
          method:'POST',
          data:{
              b_name:this.data.b_name,
              b_author:this.data.b_author,
              b_profile:this.b_profile,
              b_score:this.data.b_score,
              b_class:this.data.b_class,
              u_name:this.data.u_name,
              b_image:this.data.b_image
          },
          header:{
             'content-type':'application/json'  //默认值
          },
          dataType:"json",
          success:(res)=>{
              if(res.data){
                  wx.showToast({
                    title: '捐赠成功',
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
                    title: '捐赠失败',
                    icon:'error',
                    duration:1000
                  })
              }
          }
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

    /**
     * 上传图片
     */
    uploadingimg(){
        var that = this
        wx.chooseMedia({
            count: that.data.count, // 默认1
            mediaType: ['image'], // 可以指定是原图还是压缩图
            sourceType: ["album", "camera"], // 可以指定来源是相册还是相机，默认二者都有
            camera: 'back',
            success: function (res) {
            // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
                var tempFilePaths = res.tempFiles[0].tempFilePath
                 wx.uploadFile({
                    url: 'http://localhost:8080/book_share/uploadFile',
                    filePath: tempFilePaths,
                    name: "file",
                    header: {
                        "content-type": "multipart/form-data"
                    },
                    success: function (res) {
                        console.log(res)
                        if (res.statusCode == 200) {
                            wx.showToast({
                                title: "上传成功",
                                icon: "none",
                                duration: 1500
                            })
                            that.setData({
                                b_image: res.data
                            })
                        }
                    },
                    fail: function (err) {
                        wx.showToast({
                            title: "上传失败",
                            icon: "none",
                            duration: 2000
                        })
                    },
                    complete: function (result) {
                        console.log(result.errMsg)
                    }
                })
      
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