<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
//${moduleComment}
var ${namespaceLower} = {
	//请求url
	listUrl:"/${classNameLower}/list.action", //列表地址
	toAddUrl:"/${classNameLower}/toAdd.action", //去添加页面地址
	toEditUrl:"/${classNameLower}/toEdit.action?id=", //去修改页面地址
	deleteUrl :"/${classNameLower}/delete.action?id=", //删除页面地址
	toViewUrl:"/${classNameLower}/toView.action?id=", //详细页面地址
    
	//属性
	<@generateFields/>
	
	//初始化添加页面
	initAddPage : function (){
		jQuery("#addform").validationEngine({scroll:false});
		$("#addBtn").click(function(){
			${namespace}.add();
		});
	},
	//列表查询
	query : function(){
		location.href=this.listUrl+"?";
	},
	//跳转到添加页面
	toAdd : function (){
		location.href=this.toAddUrl;
	},
	//${moduleComment} 添加 
	add : function (){
			var b = $('#addform').validationEngine('validate');
			if(!b){
				return false;
			}
			//$("#desc").val(CKEDITOR.instances.desc1.getData());
			//$("#moreDesc").val(CKEDITOR.instances.desc2.getData());
			
			$('#addform').ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				location=this.listUrl;
			} else {
				//唯一判断
				if(resp.s==-100301) {
					 $("#name").validationEngine("showPrompt",resp.d,"error");
				}
			}
			});		
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
</#macro>
