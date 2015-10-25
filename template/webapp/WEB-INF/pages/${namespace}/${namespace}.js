<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
//${moduleComment}
var ${namespaceLower} = {
	//请求url
	listUrl:"/${classNameLower}/list.action", //列表地址
	toAddUrl:"/${classNameLower}/toAdd.action", //去添加页面地址
	addUrl:"/${classNameLower}/add.action", //添加地址
	toEditUrl:"/${classNameLower}/toEdit.action?id=", //去修改页面地址
	editUrl:"/${classNameLower}/edit.action", //去修改页面地址
	deleteUrl :"/${classNameLower}/delete.action?id=", //删除页面地址
	toViewUrl:"/${classNameLower}/toView.action?id=", //详细页面地址
	getByIdUrl : "/${classNameLower}/getById.action", //根据id查询对象
	modifyDeleteStatusUrl:"/${classNameLower}/modifyDeleteStatus.action", //停用 或启用

	onlyName :  $("#onlyName"), //修改，唯一验证时需要添加此属性
	m_title : $(".m_title"),//页面标题
	_title_val : "${pageTitle!''}",
	
	addform : jQuery("#addform"), //添加form
	queryfrom :jQuery("#queryForm"), //查询form
	addBtn : $("#addBtn"),//添加按钮
	queryBtn : $("#queryBtn"),//查询按钮
	left_menu_selected_id : "${classNameLower}_list",   //左侧菜单选择id  


	//属性
	<@generateFields/>
	//页面初始化
	initPage : function (){
		var self = this;
		self.currPage = common.getCurrPageFlag();
		common.initLeftMenuSelected(self.left_menu_selected_id);

		//初始化标题
		common.initPageTitle();
		//列表页面
		if(self.currPage!="list"){
			self.addform.validationEngine({scroll:false});
			self.addBtn.click(function(){
				self.add();
			});
		}
		if(self.currPage=="list"){
			self.initSeletePage();
		}else
		if(self.currPage=="edit"){
			self.initEditPage();
		} else 
		if(self.currPage=="add"){
			self.initAddPage();
		}else 
		if(self.currPage=="detail"){
			self.initDetailPage();
		}
	},
	initSeletePage : function (){
		var self =this;
		self.queryfrom.validationEngine({scroll:false});
		self.queryBtn.click(function(){
			self.query();
		});
    },
	//列表查询
	query : function(){
		var self = this;
		var b = self.queryfrom.validationEngine('validate');
		if(!b){
			return false;
		}
		var serializeObj = common.serializeJson("queryForm");
		var jsonStr = JSON.stringify(serializeObj)
		location.href=this.listUrl+"?jsonParam="+jsonStr;
	},
	 //跳转列表页面
	tolist : function (){
		location.href=this.listUrl;
	},
	//跳转到添加页面
	toAdd : function (){
		location.href=this.toAddUrl;
	},
	 //跳转修改页面
	toEdit : function (id){
		location.href=this.toEditUrl +id;
   },
   //跳转详情页面
   toDetail : function (id){
		location.href=this.toViewUrl+id;
	},
	//初始化添加页面
	initAddPage : function (){
		var self = this;
		self.addform.attr("action",self.addUrl);
	},
	//初始化详情页面数据
	initDetailPage : function(){
		   var self = this;
			self.getById(self.${pk}.val(),function (result){
				if (result.s > 0) {
					self.setForm(result.data);
					$("input").attr("disabled",true);
					self.addBtn.hide();
					$("._detail").show();
				}//不存在
				else if (result.s==-1000) {
					location.href = common.notFindUrl;
				}  
				else {
					common.alert(result.d);
				}
			});
	   },
	
	//${moduleComment} 添加 
	add : function (){
			var self = this;
			var b = self.addform.validationEngine('validate');
			if(!b){
				return false;
			}
			//$("#desc").val(CKEDITOR.instances.desc1.getData());
			//$("#moreDesc").val(CKEDITOR.instances.desc2.getData());
			if(self.currPage=="edit"){
				   common.openModal("delete_sure","确定修改信息吗？");
				   $("#delete_sure_a").click(function(){
					   self.ajaxSubmitForm();
				   });
			} else {
					self.ajaxSubmitForm();
		    }
	},
	//提交表单
	ajaxSubmitForm  : function (){
		var self = this;
		self.addform.ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				location.href=self.listUrl;
			} else {
				//唯一判断
				if(resp.s==-100) {
					 $("#name").validationEngine("showPrompt",resp.d,"error");
				}
			}
		});	
	},
	//初始化修改页面数据
	initEditPage : function (){
		var self = this;
		self.getById(this.${pk}.val(),function (result){
			if (result.s > 0) {
				self.setForm(result.data);
			}//不存在
			else if (result.s==-1000) {
				location.href = common.notFindUrl;
			}  
			else {
				common.alert(resp.d);
			}
		});
		self.addform.attr("action",self.editUrl);
   },
   //根据id查询信息
   getById : function (id,callBack){
	   var self = this;
	   var obj = null;
	   var rData={"id" : id};
		$.ajax({
			url : self.getByIdUrl,
			data : rData,// 
			success :callBack
		});
   },
   //删除
   toDelete : function(id){
	   var self = this;
	   common.openModal("delete_sure","确定删除吗？");
	   $("#delete_sure_a").click(function(){
		  location.href= self.deleteUrl+id; 
	   });
   },
   //更新删除状态
   modifyDeleteStatus : function (id,status){
	   var self = this;
	   var delTitle = "";
	   if(status==1){
		   status=2;
		   delTitle="确定暂停吗?";
	   } else 
	   if(status==2){
		   status=1;
		   delTitle="确定启用吗？";
	   }	   
	   common.openModal("delete_sure",delTitle);
	   $("#delete_sure_a").click(function(){
		  location.href= self.modifyDeleteStatusUrl+"?id="+id+"&deleteStatus="+status; 
	   });
   },
   //填充表单数据
   setForm : function (obj){
	   var self = this;
	    //唯一验证时需要记录原来的名称
	   self.onlyName.val(obj.name);
	   //赋值
	  <@generateUpdateFields/>
   }
}
<#macro generateFields>
<#if table.compositeId>
private ${className}Id id;
<#list table.columns as column>
	<#if !column.pk>
		${column.columnNameLower} : $("#${column.columnNameLower}"),
	</#if>
</#list>
<#else>
	
<#list table.columns as column>
	${column.columnNameLower} : $("#${column.columnNameLower}"), //${column.columnAlias!}
</#list>
</#if>
<#if inPerson!="">
	${inPerson}Name : $("#inPersonName"),
</#if>
</#macro>

<#macro generateUpdateFields>
<#list table.columns as column>
	<#if column.pk>
		self.${column.columnNameLower}.val(obj.${column.columnNameLower}); //${column.columnAlias!}
		
		//用户详情显示信息
		<#elseif  column.columnNameLower=="inPerson" || column.columnNameLower=="inDatetime" || column.columnNameLower=="inTime" || column.columnNameLower=="lastUpdateTime" || column.columnNameLower=="isDelete"  >
		<#if column.javaType=="java.util.Date">
		if(obj.${column.columnNameLower} && obj.${column.columnNameLower}>0){
		  var new1 = new Date(obj.${column.columnNameLower}).format("yyyy-MM-dd HH:mm");
		  self.${column.columnNameLower}.html(new1); //${column.columnAlias!}
		}
		<#elseif column.columnNameLower=="isDelete">
                //启用状态
		if(obj.${column.columnNameLower} && obj.${column.columnNameLower}==1){
			self.${column.columnNameLower}.html("启用");
        	}else
    	 //停用状态
		if(obj.${column.columnNameLower} && obj.${column.columnNameLower}==2){
			self.${column.columnNameLower}.html("暂停");
			}
				<#else>
		self.${column.columnNameLower}.html(obj.${column.columnNameLower});
			</#if>
			
		//其它属性
		<#elseif column.javaType=="java.lang.Long" >
		$("input[name='${column.columnNameLower}'][value='"+obj.${column.columnNameLower}+"']").attr("checked",true); //${column.columnAlias!}
		<#elseif column.javaType=="java.util.Date" >
		if(obj.${column.columnNameLower} && obj.${column.columnNameLower}>0){
			var new1 = new Date(obj.${column.columnNameLower}).format("yyyy-MM");
			self.${column.columnNameLower}.val(new1); //${column.columnAlias!}
		}
		<#else>
		self.${column.columnNameLower}.val(obj.${column.columnNameLower}); //${column.columnAlias!}
	</#if>
</#list>
	<#if inPerson!="">
		self.inPersonName : obj.inPersonName;
	</#if>
</#macro>
