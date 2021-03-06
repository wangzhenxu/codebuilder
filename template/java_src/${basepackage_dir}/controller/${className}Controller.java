<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
package ${basepackage}.controller;

<#include "/java_imports.include">
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.constant.URLConst;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.loiot.baqi.status.AccountType;
import com.loiot.commons.message.util.JsonUtil;
import com.timeloit.pojo.Account;
import com.loiot.baqi.utils.UserSessionUtils;


/**
 * ${moduleComment} 处理器。
 * ${table.tableAlias}
 * @author  ${moduleAuthor} 
 * @creation <#if now??>${now?string('yyyy-MM-dd')}</#if>
 */


@Controller
@RequestMapping(value = "/${classNameLower}")
public class ${className}Controller {
    
    public static final AjaxResponse NAME_EXIST= new AjaxResponse(-100, "${moduleComment}已存在");
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ${className}Service ${classNameLower}Service;
	
	private ${className} ${classNameLower};
	
	private HashMap<String,Object> pmap = new HashMap<String,Object>();
	
	/**
     * 跳转  ${moduleComment}列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    		@RequestParam(value = "jsonParam", defaultValue = "{}") String jsonParam,
    	${className} p, ModelMap model)throws Exception {
    	HashMap<String,Object> paramMap=this.getParaMap(jsonParam, model);
    	paramMap.put("qtype", "like");
    	//用户数据过滤
    	/*
    	if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
    		paramMap.put("inPerson", UserSessionUtils.getAccount().getAccountId());
    	}*/
        Pager<${className}> pager = ${classNameLower}Service.query${className}ListPage(paramMap , pageIndex);
        model.put("pager", pager);
        model.put("jsonParam", jsonParam);
        return "/${namespace}/${namespace}_list";
    }
    
    /**
     * 获取查询条件
     * @param jsonParam
     * @param model
     * @return
     */
    public HashMap<String,Object> getParaMap(String jsonParam,ModelMap model){
    	HashMap<String,Object> newParamMap = newParamMap =  new HashMap<String,Object>();
    	 HashMap<String,Object> paramMap =JsonUtil.toObject(jsonParam, HashMap.class);
		Iterator iter = paramMap.entrySet().iterator();
		while (iter.hasNext()) {
		Map.Entry entry = (Map.Entry) iter.next();
    		Object key = entry.getKey();
    		Object val = entry.getValue();
    		if(key.toString().equals("name")){
    			newParamMap.put("nameT", val);
    		}else
    		if(String.valueOf(val).length()>0){
    			newParamMap.put(String.valueOf(key), val);
        		model.put(String.valueOf(key), val);
    		}
		}
		return newParamMap;
    }

    /**
     * 跳转到添加页面
     * 
     * @return
     */
    @RequestMapping(value = "/toAdd")
    public String toAdd${className}(ModelMap model) {
        
        return "/${namespace}/${namespace}_add";
    }

    /**
     * 添加  ${moduleComment}
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add${className}(${className} p,HttpSession session,HttpServletRequest request) {
    	try {
            Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//验证唯一性
            pmap.clear();
            pmap.put("name", p.getName());
        	int result=${classNameLower}Service.get${className}ListCount(pmap);
        	if(result>0){
		        return NAME_EXIST;
			}
        	p.setInDatetime(new Date());
    		p.setInPerson(account.getUsername());
    		${classNameLower}Service.add${className}(p);
    		// 添加成功
    		return AjaxResponse.OK;
    	}
        catch (Exception e) {
			e.printStackTrace();
			 //失败
	        return AjaxResponse.FAILED;
		}
       
    }

    /**
     * 跳转到编辑页面
     * 
     * @return
     */
    @RequestMapping(value = "/toEdit")
    public String toEdit${className}(@RequestParam(value = "id", required = true) ${table.idColumn.javaType} id, ModelMap model)throws Exception {
        //model.put("p", ${classNameLower}Service.get${className}ById(id));
    	if(id==null){
    		return URLConst.ERROR_URL;
    	}
    	model.put("pid",  id);
        return "/${namespace}/${namespace}_add";
    }

    /**
     * 更新 ${moduleComment}
     * 
     * @param p 对象参数
     * @return ajax响应
     */
    @RequestMapping(value = "/edit")
    @ResponseBody
    public Object edit${className}(${className} p,HttpSession session,HttpServletRequest request) {
    	try {
        // 获得账号
        //Account account = (Account) session.getAttribute(Const.SESSION_USER_KEY);
    		//如果前端，没有改变编号，就不用验证
        	String onlyName=request.getParameter("onlyName");
        	if(!StringUtils.isBlank(onlyName) &&  !p.getName().equals(onlyName)){
	    	//验证唯一性
        	pmap.clear();
        	pmap.put("name", p.getName());
	    	int result=${classNameLower}Service.get${className}ListCount(pmap);
	    	if(result>0){
		        return NAME_EXIST;
			}
    	}
        ${classNameLower}Service.update${className}(p);
    	} catch (Exception e) {
			  e.printStackTrace();
			  return AjaxResponse.FAILED;
		}
        return AjaxResponse.OK;
    }

    /**
     * 跳转到查看页面
     * 
     * @return
     */
    @RequestMapping(value = "/toView")
    public String toView${className}(@RequestParam(value = "id", required = true) ${table.idColumn.javaType} id, ModelMap model)throws Exception {
    	if(id==null){
    		return URLConst.ERROR_URL;
    	}
    	//model.put("p", ${classNameLower}Service.get${className}ById(id));
    	 model.put("pid",  id);
    	return "/${namespace}/${namespace}_add";
    }

    /**
     * 删除  ${moduleComment}
     * 
     * @param id ${className}ID
     */
    @RequestMapping(value = "/delete")
    public String delete${className}(@RequestParam(value = "id", required = true) ${table.idColumn.javaType} id,HttpServletRequest request)throws Exception {
    	${classNameLower}Service.delete${className}(id);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/${classNameLower}/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  ${moduleComment}
     * 
     * @param id ${className}ID
     */
    @RequestMapping(value = "/ajaxDelete")
    @ResponseBody
    public Object ajaxDelete${className}(@RequestParam(value = "id", required = true) ${table.idColumn.javaType} id) {
    	try {
    		${className} p = new ${className}();
        	p.set${pk?cap_first}(id);
			${classNameLower}Service.delete${className}(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }
    
    /**
     * ajax 根据id查询实体bean
     * @return
     */
    @RequestMapping(value = "/getById")
    @ResponseBody
    public Object ajaxGetById(@RequestParam(value = "id", required = true) java.lang.Long id)throws Exception {
    	${className} p=null;
     	//用户数据过滤
     	/*if(UserSessionUtils.getAccountType()==AccountType.HR.getCode() || UserSessionUtils.getAccountType()==AccountType.JOB_HUNTER.getCode() ){
     		  p = ${classNameLower}Service.get${className}ById(id, UserSessionUtils.getAccount().getAccountId());
     	} else {
   		      p = ${classNameLower}Service.get${className}ById(id);
     	}*/
     	if(p==null){
     		return AjaxResponse.NOEXITS;
     	}
    	return AjaxResponse.OK(p);
    }
    
    /**
     * 更新 （停用、启用状态）
     * 
     * @param id 
     */
    @RequestMapping(value = "/modifyDeleteStatus")
    public String modifyDeleteStatus(@RequestParam(value = "id", required = true) java.lang.Long id,
    		@RequestParam(value = "deleteStatus", required = true) java.lang.Integer isDelete,
    		HttpServletRequest request)throws Exception {
    	${className} p = new ${className}();
    	p.set${pk?cap_first}(id);
    	p.setIsDelete(isDelete);
    	${classNameLower}Service.update${className}(p);
        String s = request.getHeader("Referer");
        String redirectStr = s.substring(s.indexOf("/${classNameLower}/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * 查询，名称是否存在，验证唯一性
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/checkNameExits")
    @ResponseBody
    public Object checkNameExits(@RequestParam(value = "name", required = true) java.lang.String name,
    		@RequestParam(value = "oldname",required = false) java.lang.String oldName,
    		@RequestParam(value = "flag", required = true) String flag
    		) throws Exception
    {
    	//验证唯一性
    	pmap.clear();
    	pmap.put("name", name);
    	if("edit".equals(flag) && oldName.equals(name)){
        	return AjaxResponse.OK(null);
    	} 
    	int result=${classNameLower}Service.get${className}ListCount(pmap);
    	if(result>0){
	        return NAME_EXIST;
		}
    	return AjaxResponse.OK(null);
    }
    

}
