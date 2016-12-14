package com.lara.model;

import java.util.HashMap;
import java.util.Map;

public class RequestInfo 
{
	private String path;
	private String beanClass;
	private String actionClass;
	private Map<String, String> paths = new HashMap<String, String>();
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getBeanClass() {
		return beanClass;
	}
	public void setBeanClass(String beanClass) {
		this.beanClass = beanClass;
	}
	public String getActionClass() {
		return actionClass;
	}
	public void setActionClass(String actionClass) {
		this.actionClass = actionClass;
	}
	
	public void putForward(String key, String value)
	{
		paths.put(key, value);
	}
	
	public String getForward(String name)
	{
		return paths.get(name);
	}
}
