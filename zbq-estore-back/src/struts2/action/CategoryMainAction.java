package struts2.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import struts2.dao.CategoryMainDao;
import struts2.dao.ManagerDao;
import struts2.entity.CategoryMainEntity;
import struts2.entity.ManagerEntity;

public class CategoryMainAction extends ActionSupport {
	CategoryMainDao dao = new CategoryMainDao();
	private CategoryMainEntity category;
	public CategoryMainEntity getCategory() {
		return category;
	}

	public void setCategory(CategoryMainEntity category) {
		this.category = category;
	}
	public String showAllMainCategory(){
		List<CategoryMainEntity> list = dao.selectMainCategory();
		ServletActionContext.getRequest().setAttribute("MainCategoryList", list);
		return SUCCESS;
	}
	public String insertMainCategory(){
		boolean exist = dao.checkCategoryName(category.getName());
		if(exist){
			ServletActionContext.getRequest().setAttribute("result","�ô�����Ѵ���!");
			return ERROR;
		}
		dao.insertManager(category);
		return SUCCESS;
	}
	public String updateMainCategory(){
		dao.updateMainCategory(category);
		ServletActionContext.getRequest().setAttribute("result","����޸ĳɹ�!");
		return SUCCESS;
	}
	public String deleteMainCategory(){
		boolean exits = dao.checkMainCategory(category);
		if(exits){
			ServletActionContext.getRequest().setAttribute("result","�ô�������С�����Ʒ �޷�ɾ��!");
			return ERROR;
		}
		dao.deletetMainCategory(category.getId());
		return SUCCESS;
	}
	
}
