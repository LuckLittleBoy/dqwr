$(function(){
 $("#demo2").easyinsert({
  name: ["condition","","","timeSearch","demo2", "startT","demo2","endT"],//可以同时添加两个（或更多），name值相同也必须分开设置，name数组的长度就是每组input的个数。type、value、maxlength、className四种属性，若同组组员的设置一样，可以只设置一次
  type: ["select","custom","custom","select","custom", "text","custom", "text"],
  value: [{ '并含': 'and', '或含': 'or', '不含': 'and not' },"->","&nbsp;",{'公布日期': 'publishtime', '施行日期': 'applytime','废止日期':'breaktime' },"：从", "", "到",""],//可以给同组input分别设置默认值
  className: ["","","", "","","inputime","","inputime"],//不用我解释了吧
  readonly:["","","","","","readonly","","readonly"],
  toplimit: 3//可以添加组数上限（默认是0，表示无上限），它是总管，so，name相当于小组组长
 });
 $("#demo5").easyinsert({//type新增custom和select
  name: ["condition","","", "demo", "demo5","find","", "fangshi"],
  type: ["select","custom" ,"custom","select","custom", "text","custom", "select"],
  value: [{ '并含': 'and', '或含': 'or', '不含': 'and not' },"->","&nbsp;",{ '政策名称': 'pname', '序号或文号': 'pno','调整领域': 'field', '颁布形式': 'pBBXS','政策分类': 'pcategories', '主题词': 'ZTC', '关键字': 'GJZ' },":&nbsp;", "","&nbsp;", { '模糊查询': '2', '精确查询': '1'}],
  className: ["","","","","","inputxt1","", ""],
  toplimit:10//可以添加组数上限（默认是0，表示无上限），它是总管，so，name相当于小组组长
 });
});
;(function($){
 $.fn.extend({
  "easyinsert": function(o){
   o = $.extend({
    //触发器
    clicker: null,//根据class（或id）选择，默认.next()获取
    //父标签
    wrap: "li",
    name: "i-text",
    type: "text",
    value: "",
    maxlength: 20,
    className: "i-text",
    readonly: "true",
    //新增上限值
    toplimit: 0,//0表示不限制
    //初始化值，二维数组
    initValue: null//用于修改某资料时显示已有的数据
   }, o || {});
   var oo = {
    remove: "&nbsp;<a href=\"#nogo\" class=\"remove\">&nbsp;&nbsp;移除</a>",
    error1: "参数配置错误，数组的长度不一致，请检查。",
    error2: "参数配置错误，每组初始化值都必须是数组，请检查。"
   }
   //容器
   var $container = $(this);
   var allowed = true;
   //把属性拼成数组（这步不知道是否可以优化？）
   var arrCfg = new Array(o.name, o.type, o.value, o.maxlength, o.className,o.readonly);
   var arr = new Array();
   $.each(arrCfg, function(i, n){
    if ( $.isArray(n) ) {
     arr[i] = n;
    } else {
     arr[i] = new Array();
     if ( i === 0 ) {
      arr[0].push(n);
     }else{
      //补全各属性数组（根据name数组长度）
      $.each(arr[0], function() {
       arr[i].push(n);
      });
     }
    }
    //判断各属性数组的长度是否一致
    if ( arr[i].length !== arr[0].length ) {
     allowed = false;
     $container.text(oo.error1);
    }
   });
   if ( allowed ) {
    //获取触发器
    var $Clicker = !o.clicker ? $container.next() : $(o.clicker);
    $Clicker.bind("click", function() {
     //未添加前的组数
     var len = $container.children(o.wrap).length;
     //定义一个变量，判断是否已经达到上限
     var isMax = o.toplimit === 0 ? false : (len < o.toplimit ? false : true);
     if ( !isMax ) {//没有达到上限才允许添加
      var $Item = $("<"+ o.wrap +">").appendTo( $container );
      $.each(arr[0], function(i) {
       switch ( arr[1][i] ) {
        case "select"://下拉框
         var option = "";
         $.each(arr[2][i], function(i, n) {
          option += "<option value='"+ n +"'>"+ i +"</option>";
         });
         $("<select>", {
          name: arr[0][i],
          className: arr[4][i],
          id:"sss"
         }).append( option ).appendTo( $Item );
         break;
        case "custom"://自定义内容，支持html
         $Item.append( arr[2][i] ); 
         break;
        default://默认是input
         $("<input>", {//jQuery1.4新增方法
          name: arr[0][i],
          type: arr[1][i],
          value: arr[2][i],
          maxlength: arr[3][i],
          className: arr[4][i],
          click:function(){
        	 if(arr[4][i]==="inputime")
        	 {
        		  new Calendar().show(this);
        	 }
          }
         }).appendTo( $Item );
       }
      });
      $Item = $container.children(o.wrap);
      //新组数
      len = $Item.length;
      if ( len > 1 ) {
       $Item.last().append(oo.remove);
       if ( len === 2 ) {//超过一组时，为第一组添加“移除”按钮
        $Item.first().append(oo.remove);
       }
      }
      $Item.find(".remove").click(function(){
       //移除本组
       $(this).parent().remove();
       //统计剩下的组数
       len = $container.children(o.wrap).length;
       if ( len === 1 ) {//只剩一个的时候，把“移除”按钮干掉
        $container.find(".remove").remove();
       }
       //取消“移除”按钮的默认动作
       return false;
      });
     }
     //取消触发器的默认动作
     return false;
    });
    //初始化
    if ( $.isArray(o.initValue) ) {//判断初始值是否是数组（必需的）
     $.each(o.initValue, function(i, n) {
      if ( !$.isArray(n) ) {
       $container.empty().text(oo.error2);
       return false;
      }else{
       if ( n.length !== arr[0].length ) {
        $container.empty().text(oo.error1);
        return false;
       }
      }
      var arrValue = new Array();
      //初始值替换默认值
      $.each(n, function(j, m) {
       arrValue[j] = arr[2][j]
       arr[2][j] = m;
      });
      $Clicker.click();
      //默认值替换初始值
      $.each(arrValue, function(j, m) {
       arr[2][j] = m;
      });
      //上面这种[移形换位法]不知道效率怎么样，我想不出别的更好的方法
     });
    }else{
     $Clicker.click();
    }
   }
  }
 });
})(jQuery);