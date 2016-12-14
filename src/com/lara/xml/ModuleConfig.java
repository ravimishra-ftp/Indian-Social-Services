package com.lara.xml;
import java.io.InputStream;
import java.util.HashMap;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.lara.model.RequestInfo;

public class ModuleConfig extends DefaultHandler
{
	private HashMap<String, RequestInfo> reqInfos = new HashMap<String, RequestInfo>();
	private String content = null;
	private RequestInfo reqInfo = null;
	private String reqPath = null;
	private String forwardName = null;
	
	public ModuleConfig(InputStream is)
	throws Exception
	{
		SAXParserFactory sax = SAXParserFactory.newInstance();
		SAXParser sp = sax.newSAXParser();
		sp.parse(is, this);
	}	
	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException
	{
		if("request-info".equals(qName))
		{
			reqInfo = new RequestInfo();
		}
		if("forward".equals(qName))
		{
			forwardName = attributes.getValue("name");
		}
	}	
	@Override
	public void characters(char[] ch, int start, int length) throws SAXException
	{
		content = new String(ch, start, length);
		content = content.trim();
	}
	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException 
	{
		if("request-info".equals(qName))
		{
			reqInfos.put(reqPath, reqInfo);
		}
		if("path".equals(qName))
		{			
			reqInfo.setPath(content);
			reqPath = content;
		}
		if("bean-class".equals(qName))
		{			
			reqInfo.setBeanClass(content);
		}
		if("action-class".equals(qName))
		{			
			reqInfo.setActionClass(content);
		}
		if("forward".equals(qName))
		{			
			reqInfo.putForward(forwardName, content);
		}			
	}
	public RequestInfo getRequestInfo(String path)
	{
		return reqInfos.get(path);
	}
}
