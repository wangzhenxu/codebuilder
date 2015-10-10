<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>

<!-- 
	列表地址：${r"${Const.CTX}"}/${classNameLower}/list.action
	去添加页面地址 ：${r"${Const.CTX}"}/${classNameLower}/toAdd.action
	去修改页面地址 ：${r"${Const.CTX}"}/${classNameLower}/toEdit.action?id=
	删除页面地址 ：${r"${Const.CTX}"}/${classNameLower}/delete.action?id=
	详细页面地址 ：${r"${Const.CTX}"}/${classNameLower}/toView.action?id=
	validate :<input type="text" name="name" id="name"  class="input_text w200 validate[required]" >
-->
<script>
	 left_menu_class_num=1;
	 leftMenuNum=1;
</script>
<script type="text/javascript" src="http://www.loiot.com/c/validation/jquery.validationEngine.js"></script>
<script type="text/javascript" src="http://www.loiot.com/c/validation/jquery.validationEngine.min.js"></script>
<link href="http://www.loiot.com/c/validation/validationEngine.jquery.css" rel="stylesheet" type="text/css" />

<script  language="javascript">	
$(document).ready(function(){
   $("#editform").validationEngine({ ajaxSubmit: true, validateAttribute: "validate",validationEventTriggers:"keyup blur"}); 
   $("#addDeskType").click(add);
});
</script>

<form id="editform" name="form" action="${r"${Const.CTX}"}/${classNameLower}/edit.action" method="post">
<!-- 右侧 开始 -->
<!-- 右侧 结束 -->
</form>

<script>
	
	//修改  ${moduleComment} 
	function edit(){
		var b = $('#editform').validationEngine('validate');
			if(!b){
				return false;
			}
			$('#editform').ajaxSubmit(function(resp) {
			if (resp.s > 0) {
				location="${r"#{Const.CTX}"}/${classNameLower}/list.action";
			} else {
				//坐席类型存在
				if(resp.s==-100301) {
					 $("#name").validationEngine("showPrompt",resp.d,"error");
				}
			}
		});
		
	}
}
</script>
