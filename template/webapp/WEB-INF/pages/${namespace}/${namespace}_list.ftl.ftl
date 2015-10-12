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
     <div class="location01">您现在的位置是：首页 &gt; <strong>${pageTitle!''}管理</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">${pageTitle!''}管理</div>
     <div class="query">
		<form id="queryForm" >
      <ul>
       <li style="width:22%">
       	<span class="classify">公司名称：</span>
    	<input name="name" type="text"   class="input"  id="name" value="${name!''}"/>
       </li>
       <li style="width:15%">
       	<span class="classify">所属行业：</span>
    	<select id="industryId" name="">
    		 <option value="" > 请选择 </option>
		  <#noparse>
    		   <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c>
    		 		<option value="${c.dictionaryId}" <#if industryId??> <#if industryId==c.dictionaryId?String> selected </#if> </#if>  > ${c.name!''} </option>
 			 	</#list>
		  </#noparse>
    	</select>
       </li>
       <li style="width:5%"><a href="javascript:void(0)"><img src="/images/erji_06.jpg" width="64" height="26" onclick="${namespace}.query();"/></a></li>
      </ul>
      </form>
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
				  <button type="button" class="btn btn-default"  onclick="">详情</button>
				  <button type="button" class="btn btn-default"  onclick="">修改</button>
				  <button type="button" class="btn btn-default"  onclick="">删除</button>
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
     <@pageBar  </#noparse> pager=pager url="/${className}/list.action?jsonParam=${jsonParam!''}" join="&"> <#noparse><@/pageBar> </#noparse>
    
    </div>
   </div>
  <!-- 弹窗 结束 -->
  	<#noparse>
	<#include "../include/deleteConfirmModal.ftl">
	</#noparse>
    <script src="/js/${namespace}.js"></script>
</html>
