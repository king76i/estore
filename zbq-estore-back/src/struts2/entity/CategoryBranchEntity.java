package struts2.entity;

public class CategoryBranchEntity {
	private int id;
	private int categoryMainId;
	private String name ;
	private String createTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCategoryMainId() {
		return categoryMainId;
	}
	public void setCategoryMainId(int categoryMainId) {
		this.categoryMainId = categoryMainId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
