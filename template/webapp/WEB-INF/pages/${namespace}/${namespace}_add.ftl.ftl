<#include "/web_common_macro_include">
<#noparse>
<#include "../include/comm_jlb_macro.ftl"/>
<#gmc_common_js "add" />
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
     <div class="location01">您现在的位置是：首页 &gt; <a href="control.html">CMS发布管理</a> &gt; 系统发布 &gt;<strong class="m_title" > 添加${pageTitle!''}</strong></div>
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
         <tr>
           <td  align="right" class="hui1">上传简历：</td>
           <td  align="left" valign="middle">
	         <div class="uploadlay">
	           <div id="ui-upload-holder">
	             <div id="ui-upload-txt">浏览</div>
	             <input type="file" id="ui-upload-input" class="ui-upload-input" name="ui-upload-input" onchange="jlInfo.upload(this);">
	             </div>
	         </div>
          </td>
          <td  clospan="2" ></td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">姓名：</td>
           <td  align="left" valign="middle">
          	 <input name="name" id="name" type="text" class="input validate[required]">
           </td>
          <td align="right" class="hui1">电话：</td>
          <td  align="left" valign="middle">
          	 <input name="phone" id="phone" type="text" class="input validate[required]">
          </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">性别：</td>
           <td  align="left" valign="middle">
	          	<#noparse>
	          	 <#list DictionaryUtil.getTypes(DictionaryType.SEX.getCode()) as c>
	          	 	<input class="radio" name="sex" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
	          	 </#list>
	          	</#noparse>
           </td>
          <td align="right" class="hui1">邮箱：</td>
          <td  align="left" valign="middle">
          	 <input name="emal" id="emal" type="text" class="input validate[required]">
          </td>
         </tr>
          <tr>
           <td  align="right" class="hui1">身份证：</td>
           <td  align="left" valign="middle">
          	 <input name="identityCard" id="identityCard" type="text" class="input validate[required]">
           </td>
          <td align="right" class="hui1">婚否：</td>
          <td  align="left" valign="middle">
				 <#noparse>
				 <#list DictionaryUtil.getTypes(DictionaryType.IS_MARRY.getCode()) as c>
	          	 	<input class="radio" name="maritalId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
	          	 </#list>
	          	 </#noparse>
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">最高学历：</td>
           <td  align="left" valign="middle">
          	<#noparse>
          	 <#list DictionaryUtil.getTypes(DictionaryType.EDUCATION.getCode()) as c>
	          	 	<input class="radio" name="educationId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list> 
          	 </#noparse>
           </td>
          <td align="right" class="hui1">学校名称：</td>
          <td  align="left" valign="middle">
          	 <input name="schoolTag" id="schoolTag" type="text" >
          </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">专业：</td>
           <td  align="left" valign="middle">
          	   <input name="topSpecialty" id="topSpecialty" type="text" >
           </td>
          <td align="right" class="hui1">英语等级：</td>
          <td  align="left" valign="middle">
	 		 <#noparse>
	 		 <#list DictionaryUtil.getTypes(DictionaryType.ENGLISH_LEVEL.getCode()) as c>
	          	 	<input class="radio" name="englishLevelId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list> 
          	 </#noparse>
		  </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">出生年月：</td>
           <td  align="left" valign="middle">
          	 <input name="birthday" id="birthday" onClick="WdatePicker({dateFmt:'yyyy-MM'})" type="text" >
           </td>
          <td align="right" class="hui1"></td>
          <td  align="left" valign="middle">
          </td>
         </tr>
          <tr>
           <td  align="right" class="hui1">工作开始时间：</td>
           <td  align="left" valign="middle">
          	 <input name="jobStartTimeT" id="jobStartTimeT" onClick="WdatePicker({dateFmt:'yyyy-MM'})" type="text" >
           </td>
          <td align="right" class="hui1">现住址：</td>
          <td  align="left" valign="middle">
                       <input name="nowAddress" id="nowAddress" type="text" >
          </td>
         </tr>
         
         <tr>
           <td  align="right" class="hui1">职位：</td>
           <td  align="left" valign="middle" clospan="3">
	        <#noparse>
	         <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION.getCode()) as c>
          	  	 <input class="radio" name="jobPositionId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list>
          	 </#noparse>
          </td>
         </tr>
         <tr>
           <td  align="right" class="hui1">职位级别：</td>
           <td  align="left" valign="middle" clospan="3">
			 <#noparse>
			 <#list DictionaryUtil.getTypes(DictionaryType.JOB_POSITION_LEVE.getCode()) as c>
          	  	 <input class="radio" name="jobPositionLevelId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list>
          	 </#noparse>
           </td>
         </tr>
         
          <tr>
           <td  align="right" class="hui1">薪水要求：</td>
           <td  align="left" valign="middle" clospan="3">
           <#noparse>
			<#list DictionaryUtil.getTypes(DictionaryType.SALARY_REQUIRE.getCode()) as c>
          	  	 <input class="radio" name="salaryRequireId" type="radio" value="${c.dictionaryId}" > ${c.name!''} 
          	 </#list>
          	</#noparse>
           </td>
         </tr>
          
          <@generateDetailInfo/>
         
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
