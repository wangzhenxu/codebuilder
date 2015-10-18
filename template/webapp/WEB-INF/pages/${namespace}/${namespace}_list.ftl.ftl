<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>

<#include "/web_common_macro_include">

<#noparse>
  	<#include "../include/comm_jlb_macro.ftl"/>
<html>
	<head>
	<title>网站后台管理系统-${pageTitle!''}管理</title>
	<@gmc_common_js "select" />
</#noparse>	
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong class="m_title"></strong></div>
    </div>
    <div class="sort">
     <div class="sort1 m_title" ></div>
     <div class="query">
		   <@generateQueryForm/>
     </div>
    </div>
    <div class="form">
    <#noparse>
      <#if subject.isPermitted("productClass:add")>
    </#noparse>
    		<div class="btn-group">
			  <button type="button" class="btn btn-default"  onclick="${namespace}.toAdd();">增加${pageTitle!''}</button>
	      	</div>
    <#noparse>
     </#if>
   </#noparse>
     <div class="form2">
     <table width="100%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#ffffff" style="border-collapse:collapse">
      <tr class="lan">
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>公司名称</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>公司地点</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>所属行业</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>公司规模</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>公司性质</strong></td>
         <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>融资规模</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>录入时间</strong></td>
        <td height="37" align="center" valign="middle" background="/images/erji_22.jpg"><strong>操 作</strong></td>
       </tr>
       <#noparse>
       <#list pager.data as c>
       
       <tr>
       </#noparse>
       <#noparse>
        <td align="center" class="hui" title="${c.name!''}">${StringUtil.truncate(c.name,14,"...")}</td>
        <td align="center" class="hui" title="${c.address!''}">${StringUtil.truncate(c.address,10,"...")}</td>
        <td align="center" class="hui">
      	</#noparse>
      	  <#noparse>
      	  <#if c.industryId??> 	
        	${DictionaryUtil.getName(c.industryId)}<#else>无
      	  </#if>
      	 </#noparse>
        </td>
        <td align="center" class="hui">
        <#noparse>
    	 <#if c.scaleId??> 	
    		${DictionaryUtil.getName(c.scaleId)}<#else>无
  	 	 </#if>
  	 	 </#noparse>
        </td>
        <td align="center" class="hui">
        <#noparse>
        <#if c.companyNature??> 	
    		${DictionaryUtil.getName(c.companyNature)}<#else>无
  	 	 </#if>
  	 	 </#noparse>
        </td>
        <td align="center" class="hui">
        <#noparse>
        <#if c.financingLevelId??> 	
    		${DictionaryUtil.getName(c.financingLevelId)}<#else>无
  	 	 </#if>
  	 	 </#noparse>
        </td>
         <td align="center" class="hui">
         <#noparse>
	         <#if c.lastUpdateTime??>
	         	${c.lastUpdateTime?string("yyyy-MM-dd")}
	 		</#if>
	 	</#noparse>
        </td>
        
		 <td align="center" class="hui" style="width:300px;"  >
	       		<div class="btn-group">
				  <button type="button" class="btn btn-default"  onclick="${namespace}.toDetail('<#noparse>${</#noparse>c.${pk}<#noparse>}</#noparse>')">详情</button>
				  <button type="button" class="btn btn-default"  onclick="${namespace}.toEdit('<#noparse>${</#noparse>c.${pk}<#noparse>}</#noparse>')">修改</button>
				  <#noparse>
				  <#if c.isDelete??>
				  </#noparse>
				  	<button type="button" class="btn btn-default"  onclick=${namespace}.modifyDeleteStatus('<#noparse>${</#noparse>c.${pk}<#noparse>}</#noparse>', <#noparse>'${c.isDelete!""}' </#noparse>);>
				  	 <#noparse>
				  	 	<#if c.isDelete==PauseStartType.START.getCode()> 暂停 </#if>
				  	 	<#if c.isDelete==PauseStartType.PAUSE.getCode()> 启用 </#if>
				  	 </#noparse>
				  </button>	
				  <#noparse>
				  </#if>
				  </#noparse>
				  <button type="button" class="btn btn-default"  onclick="${namespace}.toAddJob('<#noparse>${</#noparse>c.${pk}<#noparse>}</#noparse>')">发布职位</button>
	      		</div>
        </td>
       </tr>
       <#noparse>
       </#list>
       </#noparse>
       </#
       <tr>
     	 <td colspan="10" valign="middle" class="d">
     	 	<div class="btn-group" style="display:none;">
			  <button type="button" class="btn btn-default"  onclick="javascipt:void(0);">删除</button>
      	 	</div>
     	 </td>
       </tr>
      </table>
     </div>
	 <#-- 分页栏 -->
	 <#noparse>
     <@pageBar  </#noparse> pager=pager url="/${className}/list.action?jsonParam=<#noparse>${jsonParam!''}</#noparse>" join="&"> <#noparse></@pageBar> </#noparse>
    
    </div>
   </div>
  <!-- 弹窗 结束 -->
  	<#noparse>
	<#include "../include/deleteConfirmModal.ftl">
	</#noparse>
    <script src="/js/${namespace}.js"></script>
    <script>
		${namespace}.initPage();
	</script>
</html>



<#macro generateQueryForm>
  	<#assign countIteam =0 />
  	<#assign countIteamT =0 />
  	
	<form id="queryForm" >
	<ul>
			 <li style="width:22%">
		       	<span class="classify">公司名称：</span>
		    	<input name="name" type="text"   class="input"  id="name" value="${name!''}"/>
		      </li>
		<#list table.columns as column>
		<#if column.pk>
			<#elseif column.javaType=="java.lang.Long" >
			<#assign countIteamT = countIteamT+1 />
			    <#if countIteam?number lt 4>
			    	<#assign countIteam = countIteam+1 />
			       <li style="width:15%">
			       	<span class="classify">${column.columnAlias?replace("id","")?replace("Id","")}：</span>
			    	<select id="${column.columnNameLower}" name="${column.columnNameLower}">
			    		 <option value="" > 请选择 </option>
			    		  <#noparse>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c></#noparse>
			    		 		 <#noparse><option value="${c.dictionaryId}" <#if </#noparse> ${column.columnNameLower}<#noparse>?? &&</#noparse> ${column.columnNameLower}!=" <#noparse>> <#if</#noparse> ${column.columnNameLower}<#noparse>?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
			 			 	</#list>
					  	</#noparse>
			    	</select>
			       </li>
		    </#if></#if></#list>
		    <li style="width:5%"><a href="javascript:void(0)">
  		 		<button type="button" class="btn btn-default" id="queryBtn" >查&nbsp;询</button>
       		</li>
      </ul>
      
     <#if countIteamT gt 4>
        <#assign countIteam = 0 />
      	<ul>
  		<#list table.columns as column>
			<#if column.pk>
			<#elseif column.javaType=="java.lang.Long" >
				    <#assign countIteam = countIteam+1 />
				   <#if countIteam gt 4>
				       <li style="width:15%">
				       	<span class="classify">${column.columnAlias?replace("id","")?replace("Id","")}：</span>
				    	<select id="${column.columnNameLower}" name="${column.columnNameLower}">
			    		 <option value="" > 请选择 </option>
			    		  <#noparse>
			    		    <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c></#noparse>
			    		 		 <#noparse><option value="${c.dictionaryId}" <#if </#noparse> ${column.columnNameLower}<#noparse>?? &&</#noparse> ${column.columnNameLower}!=" <#noparse>> <#if</#noparse> ${column.columnNameLower}<#noparse>?number==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
			 			 	</#list>
					  	</#noparse>
			    		  </select>
				       </li>
			       </#if>
	          </#if>
          </#list>
      	</ul>
      </#if>
  </form>
</#macro>

