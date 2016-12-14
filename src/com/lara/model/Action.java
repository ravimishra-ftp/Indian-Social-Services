package com.lara.model;

import javax.servlet.http.HttpServletRequest;

public abstract class Action
{
	public abstract String process(HttpServletRequest request, Bean bean);
}
