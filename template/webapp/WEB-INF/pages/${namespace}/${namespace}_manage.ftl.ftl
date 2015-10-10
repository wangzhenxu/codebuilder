<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>

<!-- 
	列表地址：${r"${Const.CTX}"}/${classNameLower}/list.action
	去添加页面地址 ：${r"${Const.CTX}"}/${classNameLower}/toAdd.action
	去修改页面地址 ：${r"${Const.CTX}"}/${classNameLower}/toEdit.action?id=
	删除页面地址 ：${r"${Const.CTX}"}/${classNameLower}/delete.action?id=
	详细页面地址 ：${r"${Const.CTX}"}/${classNameLower}/toView.action?id=
	
-->
<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>


<script>
	//删除  ${moduleComment}
	function del(id) {
	if(window.confirm("确定要删除吗？")){
				location='${r"${Const.CTX}"}/${classNameLower}/delete.action?id'= +id ;
	}
}
</script>
