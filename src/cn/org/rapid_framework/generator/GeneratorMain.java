package cn.org.rapid_framework.generator;


/**
 * @author 时代凌宇
 */

public class GeneratorMain {
	/**
	 * 请直接修改以下代码调用不同的方法以执行相关生成任务.
	 */
	public static void main(String[] args) throws Exception {
		GeneratorFacade g = new GeneratorFacade();
		
//		g.printAllTableNames();				//打印数据库中的表名称
		
		g.deleteOutRootDir();							//删除生成器的输出目录
//		g.generateByTable("leave_user","template");	//通过数据库表生成文件,template为模板的根目录
//		g.generateByTable("leave_userdetail","template");
		
//		g.generateByTable("bonus_dayControl","template");//bonus
//		g.generateByTable("bonus_dayControlDetail","template");
//		g.generateByTable("bonus_manager","template");
//		g.generateByTable("bonus_other","template");
		
		
//		g.generateByTable("cost_ProjectContract","template");//cost
//		g.generateByTable("cost_projectFinally","template");
//		g.generateByTable("cost_projectPerson","template");
//		g.generateByTable("cost_projectSpend","template");
		
		
//		g.generateByTable("oftenProject","template");//workHour
//		g.generateByTable("projectWorkHour","template");
//		g.generateByTable("workHour","template");
//		g.generateByTable("workHourCount","template");
//		
//		g.generateByTable("performance_user","template");//performance--绩效分数
//		g.generateByTable("performance_userDetail","template");
	      
		
		g.generateByTable("zp_jl_expand_info","template");
	
		
 
		
		//g.generateByTable("app_remind_sms","template");
		
		/*g.generateByTable("project_depart","template");
		g.generateByTable("project_maintain","template");
		g.generateByTable("project_PreSales","template");
		g.generateByTable("project","template");
		
		g.generateByTable("project_implement","template");*/
		//g.generateByAllTable("template");	//自动搜索数据库中的所有表并生成文件,template为模板的根目录
//		g.generateByClass(Blog.class,"template_clazz");
		 
//		g.deleteByTable("table_name", "template"); //删除生成的文件
		//打开文件夹
		Runtime.getRuntime().exec("cmd.exe /c start "+GeneratorProperties.getRequiredProperty("outRoot"));
	}
}
