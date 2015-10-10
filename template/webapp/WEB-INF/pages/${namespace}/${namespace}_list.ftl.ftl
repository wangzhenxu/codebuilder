<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#include "/web_common_macro_include">
<#noparse>
  	<#include "../include/comm_jlb_macro.ftl"/>
<html>
	<head>
	<title>网站后台管理系统-产品分类</title>
	<@gmc_common_js "select" />
</#noparse>	
</head>
	<body>
	<div class="right">
    <div class="location">
     <div class="location01">您现在的位置是：首页 &gt; <strong>hrQQ</strong></div>
    </div>
    <div class="sort">
     <div class="sort1">产品分类</div>
     <div class="query">
      <ul>
       <li style="width:22%">
       	<span class="classify">公司名称：</span>
    	<input name="name" type="text"  class="input"  id="name" value="${name!''}"/>
       </li>
       <li style="width:15%">
       	<span class="classify">所属行业：</span>
    	<select id="industryId">
    		 <option value="" > 请选择 </option>
		  <#noparse>
    		   <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_INDUSTRY.getCode()) as c>
    		 		<option value="${c.dictionaryId}" <#if industryId??> <#if industryId==c.dictionaryId> selected </#if> </#if>  > ${c.name!''} </option>
 			 	</#list>
		  </#noparse>
    	</select>
       </li>
       <li style="width:20%">
       	<span class="classify">公司性质：</span>
    	<select id="companyNature">
    		 <option value="" > 请选择 </option>
    		<#noparse>
    		 <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_NATURE.getCode()) as c>
    		 	<option value="${c.dictionaryId}" <#if companyNature??> <#if companyNature==c.dictionaryId> selected </#if> </#if> > ${c.name!''} </option>
 			 </#list>
 			 </#noparse>
    	</select>
       </li>
        <li style="width:20%">
       	<span class="classify">公司规模：</span>
    	<select id="scaleId">
    		 <option value="" > 请选择 </option>
    		 <#noparse>	
    		 <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_SCALE.getCode()) as c>
    		 	<option value="${c.dictionaryId}" <#if scaleId??> <#if scaleId==c.dictionaryId> selected </#if> </#if> > ${c.name!''} </option>
 			 </#list>
 			 </#noparse>
    	</select>
       </li>
        <li style="width:15%">
       	<span class="classify">融资阶段：</span>
    	<select id="financingLevelId">
    		 <option value="" > 请选择 </option>
    		 <#noparse>
    		 <#list DictionaryUtil.getTypes(DictionaryType.COMPANY_FINANCING_LEVEL.getCode()) as c>
    		 	<option value="${c.dictionaryId}" <#if financingLevelId??> <#if financingLevelId==c.dictionaryId> selected </#if> </#if> > ${c.name!''} </option>
 			 </#list>
 			 </#noparse>
    	</select>
       </li>
       <li style="width:5%"><a href="javascript:void(0)"><img src="/images/erji_06.jpg" width="64" height="26" onclick="${namespace}.query();"/></a></li>
      </ul>
     </div>
    </div>
    <div class="form">
    <#noparse>
      <#if subject.isPermitted("productClass:add")>
    </#noparse>
     	<div class="form1"><a href="javascript:void(0)"><img src="/images/erji_18.jpg" width="83" height="22" border="0"  name="addpro"  onclick="${namespace}.toAdd();"/></a></div>
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
        
        <td align="center" class="hui">
       			 <a  href="javascript:">详情</a>
        		 <a  href="javascript:">修改</a>
         		 <a  href="javascript:">删除</a>
         		 <a  href="javascript:">发布职位</a>
        </td>
         		
       </tr>
       <#noparse>
       </#list>
       </#noparse>
       </#
       <tr>
     	 <td colspan="10" valign="middle" class="d">
     	 	<a href="javascript:emalModal.openTemplateModal();" class=""><img src="/images/del.jpg" width="74" height="26">
     	 	</a>
     	 </td>
       </tr>
      </table>
     </div>
	 <#-- 分页栏 -->
	 <#noparse>
     <@pageBar  </#noparse> pager=pager url="/${className}/list.action?" join="&"> <#noparse><@/pageBar> </#noparse>
    
    </div>
   </div>
  <!-- 弹窗 结束 -->
  	<#noparse>
	<#include "../include/deleteConfirmModal.ftl">
	</#noparse>
    <script src="/js/${namespace}.js"></script>
</html>

