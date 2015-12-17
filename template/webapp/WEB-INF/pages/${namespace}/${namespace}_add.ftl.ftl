<#include "/web_common_macro_include">
<#noparse>
<#include "../include/comm_jlb_macro.ftl"/>
<@gmc_common_js "add" />
</#noparse>
<form id="addform" name="form"  method="post">
<#list table.columns as column>
	<#if column.pk>
<input type="hidden" name="${column.columnNameLower}" id="${column.columnNameLower}" <#noparse> value="${pid!''}" </#noparse> />
	</#if>
</#list>
<input type="hidden" name="onlyName" id="onlyName"/>

<!-- 右侧 开始 -->
<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <a href="javascript:${namespace}.tolist();">CMS发布管理</a> &gt; 系统发布 &gt;<strong class="m_title" > 添加${pageTitle!''}</strong></div>
    </div>
    <div class="nav">
     <div class="basic">
	 <div class="basic01 m_title" >添加${pageTitle!''}</div>
	</div>
     <div class="query1">
       <table width="100%" border="0" align="left">
         <tr>
           <td colspan="4" class="red">* 号为必填项</td>
         </tr>
         
   <#list table.notPkColumns as column>
     
    <tr>
           <td  align="right" class="hui1"><#if !column.nullable><span class="red">*</span></#if>${column.columnAlias} ：</td>
           <td  align="left" valign="middle">
          	<#if column.isStringColumn>
          		<#if column.size lt 50>
          	   			<input name="${column.columnNameLower}" id="${column.columnNameLower}" type="text" class="input <#if !column.nullable> validate[required] </#if>">
          			<#else>
          			 <textarea  cols="45" rows="5" class="input validate[required,length[1000] text-input mokuainr ckeditor" name="${column.columnNameLower}"  id="${column.columnNameLower}" ></textarea>
          		</#if>
          	</#if>
          	<#if  column.javaType=="java.lang.Long">
          	    <#noparse>
		 		 <#list DictionaryUtil.getTypes(DictionaryType.ENGLISH_LEVEL.getCode()) as c>
		          	 	<input class="radio" name="{column.columnNameLower}" type="radio" value="${c.dictionaryId}" > ${c.showName!''} 
	          	 </#list> 
          	 </#noparse>
          	</#if>
          	
          		<#if  column.isDateTimeColumn>
          	   <input name="${column.columnNameLower}" id="${column.columnNameLower}" type="text" onClick="WdatePicker({dateFmt:'yyyy-MM'})" >
          	</#if>
          	
           </td>
     </tr>
 </#list>
         
         
         
        
         
         
         </table>

     </div>
    </div>
    <div class="anniu">
	  	<div class="btn-group">
	  			  <button type="button" class="btn btn-default" id="addBtn">保 &nbsp;存</button>
				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  		 <button type="button" class="btn btn-default" onclick="${namespace}.tolist();">返&nbsp; 回</button>
      	</div>
    </div>
   </div>
<!-- 右侧 结束 -->
</form>
 <#noparse>
<#include "../include/deleteConfirmModal.ftl">
 </#noparse>
<script src="/js/${namespace}.js"></script>
<script>
	${namespace}.initPage();
</script>

<#macro generateDetailInfo>


<#list table.columns as column>
	<#if  column.columnNameLower=="inPerson"  >
	   <tr style="display:none;" class="_detail">
           <td  align="right" class="hui1">录入人：</td>
           <td  align="left" valign="middle"  colspan="3" id="${column.columnNameLower}Name">
           </td>
         </tr>
     <#elseif column.columnNameLower=="inDatetime" || column.columnNameLower=="inTime">
	 	<tr style="display:none;" class="_detail">
           <td  align="right" class="hui1">录入时间：</td>
           <td  align="left" valign="middle" colspan="3" id="${column.columnNameLower}">
           </td>
         </tr>    
	  <#elseif  column.columnNameLower=="lastUpdateTime">
	 	<tr style="display:none;" class="_detail">
           <td  align="right" class="hui1">最后更新时间：</td>
           <td  align="left" valign="middle" colspan="3" id="${column.columnNameLower}">
           </td>
         </tr>
      <#elseif  column.columnNameLower=="isDelete">
      <tr style="display:none;" class="_detail">
             <td  align="right" class="hui1">是否停用：</td>
             <td  align="left" valign="middle" colspan="3" id="${column.columnNameLower}">
             
             </td>
         </tr>
	</#if>
</#list>
</#macro>
