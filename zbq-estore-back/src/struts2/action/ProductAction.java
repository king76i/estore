package struts2.action;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import struts2.dao.ProductDao;
import struts2.entity.ProductEntity;

public class ProductAction extends ActionSupport {
	ProductDao dao = new ProductDao();
	private File image;
	private String imageFileName;
	private String imageContentType;
	private ProductEntity product;
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public ProductEntity getProduct() {
		return product;
	}
	public void setProduct(ProductEntity product) {
		this.product = product;
	}
	public String selectAllProduct(){
		ArrayList<ProductEntity> list = dao.selectAllProduct();
		int totalRecords = list.size();
		int recordPerPage = 5;
		int maxPageNum;
		if(totalRecords%recordPerPage==0){
			maxPageNum = totalRecords/recordPerPage;
		}else{
			maxPageNum = totalRecords/recordPerPage+1;
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		String pageNumStr = request.getParameter("pageNum");
		int pageNum = 1;
		if(pageNumStr==null){
			pageNum = 1;
		}else{
			pageNum = Integer.parseInt(pageNumStr);
		}
		int start =(pageNum-1) * recordPerPage;
		int end = Math.min(totalRecords,pageNum * recordPerPage);
		request.setAttribute("productList", list);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		request.setAttribute("totalRecords",totalRecords);
		request.setAttribute("maxPageNum", maxPageNum);
		request.setAttribute("pageNum", pageNum);
		return SUCCESS;
	}
	public String insertProduct() throws Exception{
		String realpath = ServletActionContext.getServletContext().getRealPath("/goodsPicture");
		if(image!=null){
			File savefile = new File(new File(realpath),imageFileName);
			if(!savefile.getParentFile().exists())
				savefile.getParentFile().mkdirs();
			FileUtils.copyFile(image, savefile);
			product.setPicture(imageFileName);
		}
		dao.insertProduct(product);
		return SUCCESS;
	}
	
}
