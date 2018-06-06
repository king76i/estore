package struts2.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import struts2.dao.CategoryBranchDao;
import struts2.entity.CategoryBranchEntity;

public class CategoryBranchAction extends ActionSupport {
	CategoryBranchDao dao = new CategoryBranchDao();
	private CategoryBranchEntity branchCategory;
	private ArrayList<CategoryBranchEntity> list;
	public CategoryBranchEntity getBranchCategory() {
		return branchCategory;
	}
	public void setBranchCategory(CategoryBranchEntity branchCategory) {
		this.branchCategory = branchCategory;
	}
	public ArrayList<CategoryBranchEntity> getList() {
		return list;
	}
	public void setList(ArrayList<CategoryBranchEntity> list) {
		this.list = list;
	}
	public String selectBranchCategoryByMainIdForAjax(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String mainId = (String)request.getParameter("mainId");
		if(mainId==null||mainId.equals("")){
			list = new ArrayList<CategoryBranchEntity>();
		}else{
			list = dao.selectBranchCategoryByMainId(Integer.parseInt(mainId));
		}
		return SUCCESS;
	}
}
