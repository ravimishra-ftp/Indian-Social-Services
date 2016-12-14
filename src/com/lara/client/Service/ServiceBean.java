package com.lara.client.Service;

import com.lara.model.Bean;

public class ServiceBean extends Bean
{
	private String id;
	private String date;
	private String serviceName;
	private String desc;
	private String hidden;
	private String from;
	private String to;
	
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getHidden() {
		return hidden;
	}
	public void setHidden(String hidden) {
		this.hidden = hidden;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String name) {
		this.serviceName = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
}
