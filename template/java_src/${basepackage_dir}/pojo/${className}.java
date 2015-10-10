<#include "/macro.include"/>
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
package ${basepackage}.pojo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ${moduleComment} 实体类
 * 
 * @author  ${moduleAuthor} 
 * @creation <#if now??>${now?string('yyyy-MM-dd')}</#if>
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ${className}  implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	<@generateFields/>
	<@generateCompositeIdConstructorIfis/>
	
}

<#macro generateFields>
<#if table.compositeId>
	private ${className}Id id;
	<#list table.columns as column>
		<#if !column.pk>
	private ${column.javaType} ${column.columnNameLower};
		</#if>
	</#list>
<#else>
		
	<#list table.columns as column>
	    private ${column.javaType} ${column.columnNameLower};  //${column.columnAlias!} db_column: ${column.sqlName} 
	</#list>
</#if>

</#macro>

<#macro generateCompositeIdConstructorIfis>

	<#if table.compositeId>
	public ${className}(){
	}
	public ${className}(${className}Id id) {
		this.id = id;
	}
	<#else>
	<@generateConstructor className/>
	</#if>
	
</#macro>





