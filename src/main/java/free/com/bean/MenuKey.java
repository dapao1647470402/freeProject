package free.com.bean;

import java.io.Serializable;

public class MenuKey implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String menuGroupId;
	private String menuId;

	public MenuKey() {
	}

	/**
	 * @param menuGroupId
	 * @param menuId
	 */
	public MenuKey(String menuGroupId, String menuId) {
		this.menuGroupId = menuGroupId;
		this.menuId = menuId;
	}

	/**
	 * @return the menuGroupId
	 */
	public String getMenuGroupId() {
		return menuGroupId;
	}

	/**
	 * @param menuGroupId the menuGroupId to set
	 */
	public void setMenuGroupId(String menuGroupId) {
		this.menuGroupId = menuGroupId;
	}

	/**
	 * @return the menuId
	 */
	public String getMenuId() {
		return menuId;
	}

	/**
	 * @param menuId the menuId to set
	 */
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((menuGroupId == null) ? 0 : menuGroupId.hashCode());
		result = prime * result + ((menuId == null) ? 0 : menuId.hashCode());
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuKey other = (MenuKey) obj;
		if (menuGroupId == null) {
			if (other.menuGroupId != null)
				return false;
		} else if (!menuGroupId.equals(other.menuGroupId))
			return false;
		if (menuId == null) {
			if (other.menuId != null)
				return false;
		} else if (!menuId.equals(other.menuId))
			return false;
		return true;
	}

}
