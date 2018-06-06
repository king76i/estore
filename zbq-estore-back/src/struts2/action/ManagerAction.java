package struts2.action;
import java.util.ArrayList;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import struts2.dao.ManagerDao;
import struts2.entity.ManagerEntity;

public class ManagerAction extends ActionSupport{
	ManagerDao dao = new ManagerDao();
	private ManagerEntity manager;
	public ManagerEntity getManager() {
		return manager;
	}
	public void setManager(ManagerEntity manager) {
		this.manager = manager;
	}
	public String login() throws Exception {
		manager = dao.login(manager.getName(), manager.getPassword());
		if(manager!=null){
			ActionContext.getContext().getSession().put("manager", manager);
			return SUCCESS;
		}else{
			ServletActionContext.getRequest().setAttribute("result", "用户名或者密码不正确");
			return ERROR;
		}	
	}
	public String logout()throws Exception{
		ActionContext.getContext().getSession().remove("manager");
		return SUCCESS;
	}	
	public String selectManager(){
		ArrayList<ManagerEntity> list = dao.selectManager();
		ServletActionContext.getRequest().setAttribute("managerList", list);
		return SUCCESS;
	}
	public String  deleteManager() throws Exception{
		dao.deletetManager(manager.getId());
		return SUCCESS;
	}
	public String addManager(){
		boolean exist = dao.checkManagerName(manager.getName());
		if(exist){
			ServletActionContext.getRequest().setAttribute("result","该管理员已存在!");
			return ERROR;
		}
		dao.insertManager(manager);
		return SUCCESS;
	}
	public String updatePassword(){
		dao.updateManagerPassword(manager);
		ServletActionContext.getRequest().setAttribute("result","密码修改成功,请重新登陆!");
		return SUCCESS;
	}
}

