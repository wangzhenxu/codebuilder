<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.loiot.baqi.controller.response.Pager;
import com.loiot.baqi.dao.${className}Dao;
import com.loiot.baqi.service.${className}Service;
import com.loiot.baqi.pojo.${className};
import com.loiot.baqi.pojo.ZpJlJobLevels;


/**
 * ${moduleComment} 逻辑类。
 * 
 * @author  ${moduleAuthor} 
 * @creation <#if now??>${now?string('yyyy-MM-dd')}</#if>
 */
@Service("${classNameLower}Service")
@Transactional
public class ${className}Service{
    
    private Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource
	private ${className}Dao ${classNameLower}Dao;
	
	
	 /**
     * 查询 ${moduleComment}列表分页
     * 
     * @param name ${moduleComment}名称
     * @param pageIndex 页索引
     * @return
     */
    public Pager<${className}> query${className}ListPage(HashMap<String,Object> pMap, int pageIndex)throws Exception {

        // 查询${moduleComment}列表总条数
        int totalResults = ${classNameLower}Dao.get${className}ListCount(pMap);

        // 构造一个分页器
        Pager<${className}> pager = new Pager<${className}>(totalResults, pageIndex);

        // 查询${moduleComment}列表
        List<${className}> ${classNameLower}List = ${classNameLower}Dao.query${className}List(pMap, pager.getSkipResults(),
                pager.getMaxResults());
        pager.setData(${classNameLower}List);
        return pager;
    }
	
	 /**
     * 添加 ${moduleComment}
     * 
     * @param p 参数对象
     */
    public ${className} add${className}(${className} p)throws Exception {
       return  ${classNameLower}Dao.add${className}(p);
    }
    
    /**
     * 修改 ${moduleComment}
     * 
     * @param p 参数对象
     */
    public void update${className}(${className} p)throws Exception {
        ${classNameLower}Dao.update${className}(p);
    }
    
    /**
     * 删除  ${moduleComment}
     * 
     * @param id 主键
     */
    public void delete${className}(${table.idColumn.javaType} id)throws Exception {
        ${classNameLower}Dao.delete${className}(id);
    }
    
    /**
     * 删除  ${moduleComment}
     * 
     * @param id 主键
     */
    public void delete${className}(${className} p)throws Exception {
        ${classNameLower}Dao.delete${className}(p);
    }
    
    /**
     * 获得  ${moduleComment}
     * 
     * @param id ${moduleComment}Id
     * 
     * @return 返回与ID匹配的${moduleComment}
     */
    public ${className} get${className}ById(${table.idColumn.javaType} id)throws Exception {
        return  ${classNameLower}Dao.get${className}ById(id);
    }
    
    /**
     * 获得  ${moduleComment}
     * 
     * @param name ${moduleComment}名称
     * 
     * @return 返回与NAME匹配的${moduleComment}
     */
    public ${className} get${className}ByName(String name)throws Exception {
        return  ${classNameLower}Dao.get${className}ByName(name);
    }
    
    /**
     * 查询 ${moduleComment}列表
     * @return ${moduleComment}列表
     */
    public List<${className}> query${className}List(HashMap<String,Object> pMap)throws Exception {
        return  ${classNameLower}Dao.query${className}List(pMap);
    }
    
    /**
     * 查询 ${moduleComment}列表
     * @return ${moduleComment}列表
     */
    public List<${className}> query${className}List(${className} p)throws Exception {
        return  ${classNameLower}Dao.query${className}List(p);
    }
    
    /**
     * 查询  ${moduleComment}列表条数
     * 
     * @param name ${moduleComment}名称
     * @return ${moduleComment}列表条数
     */
    
    public int get${className}ListCount(HashMap<String,Object> pMap)throws Exception {
        return  ${classNameLower}Dao.get${className}ListCount(pMap);
    }
    
    /**
     * 查询id集合
     * @return
     */
    public List<Long> getIds(List<${className}> list) {
    	List<Long> idsList = null;
        if(list!=null && list.size()>0) {
        	idsList = new ArrayList<Long>();
        	for (${className} b : list) {
            	idsList.add(null);
            }
        }
        return idsList;
    }
}
