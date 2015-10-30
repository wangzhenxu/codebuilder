<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.loiot.baqi.pojo.${className};

/**
 * ${moduleComment} 访问层。
 * 
 * @author  ${moduleAuthor} 
 * @creation <#if now??>${now?string('yyyy-MM-dd')}</#if>
 */
@Repository("${classNameLower}Dao")
public class ${className}Dao extends SqlSessionDaoSupport{
    
    /**
     * 添加 ${moduleComment}
     * 
     * @param p 参数对象
     */
    public ${className} add${className}(${className} p)throws Exception {
        this.getSqlSession().insert("${className}.add${className}", p);
        return p;
    }
    
    /**
     * 修改 ${moduleComment}
     * 
     * @param p 参数对象
     */
    public void update${className}(${className} p)throws Exception {
        this.getSqlSession().update("${className}.update${className}", p);
    }
    
    /**
     * 修改 ${moduleComment}
     * 
     * @param p 参数对象
     */
    public void update${className}(HashMap<String,Object> pMap)throws Exception {
        this.getSqlSession().update("${className}.update${className}ByMap", pMap);
    }
    
    
    
    /**
     * 删除  ${moduleComment}
     * 
     * @param id 主键
     */
    public void delete${className}(${table.idColumn.javaType} id)throws Exception {
        getSqlSession().delete("${className}.delete${className}", id);
    }
    
    /**
     * 删除  ${moduleComment}
     * 
     * @param id 主键
     */
    public void delete${className}(${className} p)throws Exception {
        getSqlSession().delete("${className}.delete${className}", p);
    }
    
    /**
     * 获得  ${moduleComment}
     * 
     * @param id ${moduleComment}Id
     * 
     * @return 返回与ID匹配的${moduleComment}
     */
    public ${className} get${className}ById(${table.idColumn.javaType} id)throws Exception {
    	HashMap<String, Object> pMap = new HashMap<String, Object>();
    	pMap.put("${pk}", id);
    	return (${className}) getSqlSession().selectOne("${className}.get${className}ById", pMap);
    }
    
    /**
     * 获得  ${moduleComment}
     * 
     * @param id ${moduleComment}Id
     * 
     * @return 返回与ID匹配的${moduleComment}
     */
    public ${className} get${className}ById(${table.idColumn.javaType} id,Long accountId)throws Exception {
    	HashMap<String, Object> pMap = new HashMap<String, Object>();
    	pMap.put("${pk}", id);
    	pMap.put("inPerson", accountId);
    	return (${className}) getSqlSession().selectOne("${className}.get${className}ById", pMap);
    }
    
    /**
     * 获得  ${moduleComment}
     * 
     * @param id ${moduleComment}Id
     * 
     */
    public ${className} get${className}(HashMap<String,Object> pMap)throws Exception {
    	return (${className}) getSqlSession().selectOne("${className}.query${className}List", pMap);
    }
    
    /**
     * 获得  ${moduleComment}
     * 
     * @param name ${moduleComment}名称
     * 
     * @return 返回与NAME匹配的${moduleComment}
     */
    public ${className} get${className}ByName(String name)throws Exception {
        return null;
        //return (${className}) getSqlSession().selectOne("${className}.get${className}ByName", name);
    }
    
    
    
    /**
     * 查询  ${moduleComment}列表条数
     * 
     * @param name ${moduleComment}名称
     * @return ${moduleComment}列表条数
     */
    
    public int get${className}ListCount(HashMap<String,Object> pMap)throws Exception {
        return (Integer) getSqlSession().selectOne("${className}.get${className}ListCount", pMap);
    }

    /**
     * 查询 ${moduleComment}列表
     * 
     * @param name ${moduleComment}名称
     * @param skipResults 跳过的记录数
     * @param maxResults 最大的记录数
     * @return ${moduleComment}列表
     */
    public List<${className}> query${className}List(HashMap<String, Object> pMap, int skipResults, int maxResults)throws Exception {
    	pMap.put("skipResults", skipResults);
    	pMap.put("maxResults", maxResults);
        return getSqlSession().selectList("${className}.query${className}List", pMap);
    }
    
    /**
     * 查询 ${moduleComment}列表
     * 
     * @param pMap 参数列表
     */
    public List<${className}> query${className}List(HashMap<String, Object> pMap)throws Exception {
        return getSqlSession().selectList("${className}.query${className}List", pMap);
    }
    
    /**
     * 查询 ${moduleComment}列表
     * 
     * @return ${moduleComment}列表
     */
    public List<${className}> query${className}List()throws Exception {
        Map<String, Object> params = new HashMap<String, Object>();
        return getSqlSession().selectList("${className}.query${className}List",params);
    }
    
    /**
     * 查询 ${moduleComment}列表
     * 
     * @return ${moduleComment}列表
     */
    public List<${className}> query${className}List(${className} p )throws Exception {
        return getSqlSession().selectList("${className}.query${className}List",p);
    }
    
    

}
