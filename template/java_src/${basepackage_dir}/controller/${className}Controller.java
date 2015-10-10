<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
package ${basepackage}.controller;

<#include "/java_imports.include">
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loiot.baqi.pojo.*;
import com.loiot.baqi.constant.Const;
import com.loiot.baqi.controller.response.AjaxResponse;
import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.service.*;
import com.timeloit.pojo.Account;

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
	
	/**
     * 跳转  ${moduleComment}列表页
     * 
     * @return 模板位置
     */
    @RequestMapping(value = "/list")
    public String list(@RequestParam(value = "pi", defaultValue = "0") int pageIndex,
    	${className} p, ModelMap model)throws Exception {
    	HashMap<String,Object> pMap = new HashMap<String,Object>();
    	pMap.put("qtype", "like");
        Pager<${className}> pager = ${classNameLower}Service.query${className}ListPage(pMap, pageIndex);
        model.put("pager", pager);
        //model.put("name", name);
        return "/${namespace}/${namespace}_list";
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
        	HashMap<String,Object> pMap =new HashMap<String,Object>();
        	pMap.put("name", p.getName());
        	int result=${classNameLower}Service.get${className}ListCount(pMap);
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
        model.put("p",  ${classNameLower}Service.get${className}ById(id));
        return "/${namespace}/${namespace}_edit";
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
    	if(!p.getName().equals(p.getName())){
	    	//验证唯一性
	    	HashMap<String,Object> pMap =new HashMap<String,Object>();
	    	pMap.put("name", p.getName());
	    	int result=${classNameLower}Service.get${className}ListCount(pMap);
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
        model.put("p", ${classNameLower}Service.get${className}ById(id));
        return "/${namespace}/${namespace}_view";
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
        String redirectStr = s.substring(s.indexOf("/${namespace}/"), s.length());
        return "redirect:"+redirectStr;
    }
    
    /**
     * ajax删除  ${moduleComment}
     * 
     * @param id ${className}ID
     */
    @RequestMapping(value = "/ajaxDelete")
    public Object ajaxDelete${className}(@RequestParam(value = "id", required = true) ${table.idColumn.javaType} id) {
    	try {
    		${className} p = new ${className}();
        	//p.set${className}Id(id);
			${classNameLower}Service.delete${className}(p);
			return AjaxResponse.OK;
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		  return AjaxResponse.FAILED;
		}
    }

}
